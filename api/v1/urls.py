from django.conf.urls import url, include
from .auth import urls as auth_urls
from .account import urls as account_urls

urlpatterns = [
    url(r'^auth/', include(auth_urls, namespace='auth')),
    url(r'^account/', include(account_urls, namespace='account')),
    
    # url(r'^oscar/', include(oscarapp.urls, namespace='oscar')), # Cannot override the namespace for a dynamic module that provides a namespace
    # url(r'^oscar/', include(oscarapp.urls)), # could not be overridden since oscarapp.urls got some named view within that can not be namespaced
]
