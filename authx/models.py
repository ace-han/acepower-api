
from enum import IntEnum, Enum

from django.contrib.auth.models import AbstractBaseUser, PermissionsMixin, \
    UserManager as BaseAuthUserManager
from django.core import validators
from django.db import models
from django.utils import timezone
from django.utils.translation import ugettext_lazy as _


class UserManager(BaseAuthUserManager):
    def create_superuser(self, username, password, email='', **extra_fields):
        '''
            make email to be optional 
        '''
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)

        if extra_fields.get('is_staff') is not True:
            raise ValueError('Superuser must have is_staff=True.')
        if extra_fields.get('is_superuser') is not True:
            raise ValueError('Superuser must have is_superuser=True.')
        return self._create_user(username, email, password,**extra_fields)
    
class UserSource(Enum):
        WX = 'wx'
        ALI = 'ali'
        PHONE = 'phone'

class Gender(IntEnum):
    Female = 0
    Male = 1
    Unknown = 2

class AbstractUser(AbstractBaseUser, PermissionsMixin):
    """
    Imitation from django.contrib.authx.models.AbstractUser, without first_name & last_name
    An abstract base class implementing a fully featured User model with
    admin-compliant permissions.

    """
    username = models.CharField(_('username'), max_length=32, unique=True,
        help_text=_('Usually wechat openid/ ali user_id'),
        validators=[
            validators.RegexValidator(r'^[\w.@+-]+$',
                                      _('Enter a valid username. '
                                        'This value may contain only letters, numbers '
                                        'and @/./+/-/_ characters.'), 'invalid'),
        ],
        error_messages={
            'unique': _("A user with that username already exists."),
        })
    # place source here to save one more query when doing token/userinfo update
    source = models.CharField(_('source'), max_length=8, blank=True, choices=(
                                                (UserSource.WX, _('WX')),
                                                (UserSource.ALI, _('ALI')),
                                                (UserSource.PHONE, _('Phone')),
                                            ))
    # selfie_path = models.CharField(_('selfie path'), max_length=120, blank=True)
    email = models.EmailField(_('email address'), blank=True)
    is_staff = models.BooleanField(_('staff status'), default=False,
        help_text=_('Designates whether the user can log into this admin '
                    'site.'))
    is_active = models.BooleanField(_('active'), default=True,
        help_text=_('Designates whether this user should be treated as '
                    'active. Unselect this instead of deleting accounts.'))
    date_joined = models.DateTimeField(_('date joined'), default=timezone.now)

    objects = UserManager()

    USERNAME_FIELD = 'username'
    # REQUIRED_FIELDS will affect command-wise user creation in UserManager like create_superuser
    REQUIRED_FIELDS = []  
    
    class Meta:
        verbose_name = _('user')
        verbose_name_plural = _('users')
        abstract = True
       
    def get_full_name(self):
        """
        Returns the first_name plus the last_name, with a space in between.
        """
        return self.get_short_name()

    def get_short_name(self):
        "Returns the short name for the user."
        return (self.nickname or self.username).strip()
    
    def __str__(self):
        return self.username
    
class User(AbstractUser):
    """
    Users within the Django authentication system are represented by this
    model.

    Username, password and email are required. Other fields are optional.
    """
    class Meta:
        # app_label='auth' # could not make app_label to 'auth'
        # using this table name to make it compatible with django.contrib.auth.User
        db_table = 'auth_user'  


from django.contrib.auth import get_user_model

class Profile(models.Model):
    user = models.OneToOneField(get_user_model(), on_delete=models.CASCADE)
    avatar_url = models.CharField(_('avatar_url'), max_length=256, blank=True)
    city = models.CharField(_('city'), max_length=128, blank=True)
    country = models.CharField(_('country'), max_length=32, blank=True)
    gender = models.PositiveSmallIntegerField(_('gender'), 
                                            default=Gender.Unknown,
                                            choices=(
                                                (Gender.Female, _('Female')),
                                                (Gender.Male, _('Male')),
                                                (Gender.Unknown, _('Unknown')),
                                            ))
    city = models.CharField(_('city'), max_length=128, blank=True)
    language = models.CharField(_('language'), max_length=4, blank=True, help_text=_('language code'))
    nickname = models.CharField(_('nickname'), max_length=128, blank=True)
    province = models.CharField(_('province'), max_length=64, blank=True)
    
    unionid = models.CharField(_('unionid'), max_length=128, blank=True)
