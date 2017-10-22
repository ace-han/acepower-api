
from django.forms.models import model_to_dict
from django.utils.translation import ugettext as _
from rest_condition import Or
from rest_framework import status
from rest_framework.decorators import api_view, permission_classes
from rest_framework.exceptions import ValidationError
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.viewsets import ModelViewSet

from account.models import Profile
from authx.models import UserSource
from authx.permissions import IsStaffUser

from .permissions import IsSelfOrReadOnly
from .serializers import ProfileSerializer, WxEncryptedProfileSerializer


class ProfileViewSet(ModelViewSet):
    queryset = Profile.objects.all()
    serializer_class = ProfileSerializer
    permission_classes = (Or(IsSelfOrReadOnly, IsStaffUser), )


@permission_classes((IsAuthenticated, ))
@api_view(('POST', ))
def encrypted_profile(request):
    '''
    create/update profile for the authenticated user only
    '''
    source = UserSource(request.user.source)
    if source == UserSource.WX:
        serializer = WxEncryptedProfileSerializer(request.user, data=request.data)
    else:
        msg = _('encrypted profile serializer for user source: %s is not implemented' %  request.user.source)
        raise ValidationError(msg)

    if serializer.is_valid():
        profile = serializer.object.get('profile') or request.user.profile
        serializer = ProfileSerializer(profile)
        return Response(serializer.data)

    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        
        