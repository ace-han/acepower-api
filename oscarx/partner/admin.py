from oscar.apps.partner.admin import *  # noqa

from oscar.core.loading import get_model

PartnerAsset = get_model('partner', 'PartnerAsset')
AssetLocation = get_model('partner', 'AssetLocation')

class PartnerAssetAdmin(admin.ModelAdmin):
    raw_id_fields = ('stockrecord',)

admin.site.register(PartnerAsset, PartnerAssetAdmin)
admin.site.register(AssetLocation)