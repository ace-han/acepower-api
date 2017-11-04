import re
from django.core.urlresolvers import resolve
from django.utils import six
from django.utils.deprecation import MiddlewareMixin
from oscarapi.middleware import HeaderSessionMiddleware


# plz refer to 
# http://stackoverflow.com/questions/14269719/django-rest-framework-v1-versioning#answer-21839842
# e.g.: 
#    curl -H "X-Version: v1" http://localhost:8090/api/auth/test/
# and I've decided to do this in the old way (MiddlewareMixin)
class VersionSwitch(MiddlewareMixin):
    
    def process_request(self, request):
        '''
        this method will do it's best to patch up the version info for the incoming request
        the `request.path_info` or `request.path` may not include `version`
        people may request the version number via HEADER
        e.g:
            curl -H "X-Version: v1" http://localhost:8090/api/auth/test/ => v1
            the request.path will be replace as
                http://localhost:8090/api/v1/auth/test/
        
        and this method will get below output
            curl http://localhost:8090/api/auth/test/ => the latest, v2 maybe
            curl -H "X-Version: v2" http://localhost:8090/api/auth/test/ => v2
            curl -H "X-Version: v1" http://localhost:8090/api/v2/auth/test/ => v2
        '''
        r = resolve(request.path_info)
        version = request.META.get('HTTP_X_VERSION', False)
        
        # r.namespace => like, 'api:v1:auth'
        if r.namespace.startswith('api:') and version:
            # request.path_info will always be equal to or longer than request.path
            # so I choose request.path to test
            # r.namespaces => like, ['api', 'v1', 'auth']
            if '/'.join(r.namespaces[:2]) not in request.path:
                # version in request.path takes HIGH priority 
                request.path = request.path.replace('/api', '/api/{}'.format(version))
                request.path_info = request.path_info.replace('/api', '/api/{}'.format(version))
        


OSCAR_API_RE = re.compile(r'^\/api.*?\/oscar\/', re.IGNORECASE) # @UndefinedVariable

@staticmethod
def is_custom_api_request(request):
    match = OSCAR_API_RE.match(request.path)        
    return match is not None
 
class CustomApiRootHeaderMetaClass(type):
    def __new__(cls, clsname, bases, attr_dict):
        for base in bases:
            if not hasattr(base, 'is_api_request'):
                continue
            base.is_api_request = is_custom_api_request
             
        return super().__new__(cls, clsname, bases, attr_dict)
 
@six.add_metaclass(CustomApiRootHeaderMetaClass)
class CustomApiRootHeaderSessionMiddleware(HeaderSessionMiddleware):
    '''
        refer to https://stackoverflow.com/questions/100003/what-is-a-metaclass-in-python
    '''
    pass