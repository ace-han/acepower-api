
import logging

from django.conf import settings
from rest_framework.exceptions import ValidationError
from rest_framework.fields import CharField
from rest_framework_jwt.compat import Serializer
from weixin.lib.wxcrypt import WXBizDataCrypt

from account.models import Profile
from common.serializers import DynamicFieldsModelSerializer


logger = logging.getLogger(__name__)

class ProfileSerializer(DynamicFieldsModelSerializer):
    class Meta:
        model = Profile
        fields = '__all__'
        

class WxEncryptedProfileSerializer(Serializer):
    encrypted_data = CharField(max_length=512)
    iv = CharField(max_length=32)
    
    def __init__(self, user, *args, **kwargs):
        self.user = user
        super().__init__(*args, **kwargs)
        
    def validate(self, attrs):
        encrypted_data = attrs.get('encrypted_data')
        iv = attrs.get('iv')
        crypt = WXBizDataCrypt(settings.WX_APP_ID, self.user.access_token)
        try:
            user_info = crypt.decrypt(encrypted_data, iv)
        except Exception as e:
            raise ValidationError(e)
        profile, created = Profile.objects.update_or_create(
            user=self.user,
            defaults={
                'avatar_url': user_info.get('avatarUrl', ''),
                'city': user_info.get('city', ''),
                'country': user_info.get('country', ''),
                'gender': user_info.get('gender', ''),
                'language': user_info.get('language', ''),
                'nickname': user_info.get('nickName', ''),
                'province': user_info.get('province', ''),
                'unionid': user_info.get('unionId', ''),
            }
        )
        logger.info('user: %s, profile: %s %s', 
                    self.user.id, profile.id, 'created' if created else 'updated')
        return {'profile': profile}

class AliEncryptedProfileSerializer(Serializer):
    '''
    TODO
    '''
    pass
