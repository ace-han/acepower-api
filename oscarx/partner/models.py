from enum import Enum
from django.db import models
from django.utils.translation import ugettext_lazy as _

from oscar.apps.partner.models import *  # noqa isort:skip
from oscar.core.loading import is_model_registered


__all__ = []

class AssetState(Enum):
    IDLE = 'idle'
    IN_USE = 'in_use'
    DAMAGED = 'damaged'
    REPAIRING = 'repairing'
    OBSOLETE = 'obsolete'
    EXPIRED = 'expired'

class AbstractPartnerAsset(models.Model):
    serial_num = models.CharField(_('serial number'), max_length=128)
    state = models.CharField(_('state'), max_length=8, 
                              choices=[(e.value, e.name) for e in AssetState])
    cost = models.FloatField(_('cost'), default=0.0)
    purchased_at = models.DateTimeField(_('date purchased'), null=True)
    expiring_at = models.DateTimeField(_('expiring date'), null=True)
    maintainer = models.CharField(_('maintainer'), max_length=64, blank=True)
    maintainer_phone = models.CharField(_('maintainer phone'), max_length=32, blank=True)
    partner = models.ForeignKey(
        'partner.Partner',
        on_delete=models.CASCADE,
        verbose_name=_("Partner"))
    stockrecord = models.ForeignKey(
        'partner.StockRecord',
        on_delete=models.SET_NULL,
        verbose_name=_("StockRecord"),
        null=True)
    
    class Meta:
        abstract = True
        app_label = 'partner'
        unique_together = ('partner', 'serial_num')
        verbose_name = _("Partner Asset")
        verbose_name_plural = _("Partner Assets")

if not is_model_registered('partner', 'PartnerAsset'):
    class PartnerAsset(AbstractPartnerAsset):
        pass

    __all__.append('PartnerAsset')