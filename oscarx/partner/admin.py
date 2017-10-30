from oscar.apps.partner.admin import *  # noqa

from oscar.core.loading import get_model

PartnerAsset = get_model('partner', 'PartnerAsset')

admin.site.register(PartnerAsset)