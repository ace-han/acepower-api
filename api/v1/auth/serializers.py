from django.conf import settings
from django.contrib.auth import get_user_model
from django.utils.translation import ugettext as _
from rest_framework.exceptions import ValidationError
from rest_framework.fields import SerializerMethodField, ChoiceField, CharField
from rest_framework.relations import StringRelatedField
from rest_framework_jwt.compat import Serializer
from rest_framework_jwt.settings import api_settings
from weixin.client import WXAPPAPI

from authx.models import UserSource
from common.serializers import DynamicFieldsModelSerializer


User = get_user_model()
jwt_payload_handler = api_settings.JWT_PAYLOAD_HANDLER
jwt_encode_handler = api_settings.JWT_ENCODE_HANDLER

UserModel = get_user_model()

class UserSerializer(DynamicFieldsModelSerializer):
    class Meta:
        model = UserModel
        exclude = ('password', )

class UserGroupSerializer(DynamicFieldsModelSerializer):
    groups = StringRelatedField(many=True)
#     groups = SerializerMethodField()
    class Meta:
        model = UserModel
        exclude = ('password', )
        
#     def get_groups(self, obj):
#         # empty list for the time being
#         return []

class CodeToTokenSerializer(Serializer):
    """
    Serializer class used for OAuth login.

    'code' is used to retrieve session_key/access_token.
    'source' is used to identify which source from, usually wx/ali
    
    we create a new record if not in the db
    Returns a JSON Web Token that can be used to authenticate later calls.
    """
    
    code = CharField()
    source = ChoiceField(choices=[(e.value, e.name) for e in UserSource])


    def validate(self, attrs):
        source = UserSource( attrs.get('source') )
        
        if source == UserSource.WX:
            access_token, user = self.wx_code_to_session_info(attrs.get('code'))
        else:
            msg = _('source: %s not implemented' % source)
            raise ValidationError(msg)

        if user:
            if not user.is_active:
                msg = _('User account is disabled.')
                raise ValidationError(msg)

            payload = jwt_payload_handler(user)

            return {
                'token': jwt_encode_handler(payload),
                'user': user
            }
        else:
            msg = _('Unable to log in with provided parameters.')
            raise ValidationError(msg)

    
    @staticmethod
    def wx_code_to_session_info(code):
        '''
        return (session_key, db_user_obj)
        '''
        api = WXAPPAPI(appid=settings.WX_APP_ID,
                  app_secret=settings.WX_APP_SECRET)
        session_info = api.exchange_code_for_session_key(code=code)
#         {
#           "openid": "OPENID",
#           "session_key": "SESSIONKEY",
#           "unionid": "UNIONID"
#         }
        session_key = session_info.get('session_key', '')
        openid = session_info.get('openid', '')
        unionid = session_info.get('unionid', '')
        source = 'wx'
        # as commented, we use `USERNAME_FIELD` for openid, `password` for session_key
        user, created= UserModel._default_manager.update_or_create(**{
            UserModel.USERNAME_FIELD: openid,
        }, defaults={
            'source': source,
            'password': session_key,
            'unionid': unionid,
        })
        
        return session_key, user
            

    @staticmethod
    def ali_code_to_access_token(code):
        '''
        return (access_token, db_user_obj)
        '''
        pass