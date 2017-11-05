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
    
    def __str__(self):
        return 'partner_id: %s, serial_num: %s' % (self.partner_id, self.serial_num)
    
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

class AbstractAssetLocation(models.Model):
    # code usually for scanning qr_code 
    code = models.CharField(_('code'), max_length=128)
    # usually line1 is the room `line2+Serial Number` in this app
    line1 = models.CharField(_("First line of address"), max_length=255)
    # usually line2 is a location precisely at hotel in this app
    line2 = models.CharField(
        _("Second line of address"), max_length=255, blank=True)
    
    asset = models.ForeignKey(
        'partner.PartnerAsset',
        on_delete=models.SET_NULL,
        verbose_name=_("Asset"),
        null=True)

    def __str__(self):
        return self.line1
    
    class Meta:
        abstract = True
        app_label = 'partner'
        unique_together = ('code', )
        verbose_name = _("Asset Location")

if not is_model_registered('partner', 'AssetLocation'):
    class AssetLocation(AbstractAssetLocation):
        pass


    __all__.append('AssetLocation')