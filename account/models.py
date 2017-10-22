from enum import IntEnum

from django.db import models
from django.utils.translation import ugettext_lazy as _
from django.contrib.auth import get_user_model

class Gender(IntEnum):
    Female = 0
    Male = 1
    Unknown = 2

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
    language = models.CharField(_('language'), max_length=4, blank=True, help_text=_('language code'))
    nickname = models.CharField(_('nickname'), max_length=128, blank=True)
    province = models.CharField(_('province'), max_length=64, blank=True)
