from django.utils import timezone

from oscar.core.loading import get_model
from oscar.apps.order.utils import OrderCreator as OscarOrderCreator


PartnerAsset = get_model('partner', 'PartnerAsset')
class OrderNumberGenerator(object):
    """
    Simple object for generating order numbers.

    We need this as the order number is often required for payment
    which takes place before the order model has been created.
    """

    def order_number(self, basket):
        """
        Return an order number for a given basket
        """
        prefix = timezone.now().strftime('%Y%m%d%H%M%S')
        return '%s%s' % (prefix, basket.id)

class OrderCreator(OscarOrderCreator):
    def create_additional_line_models(self, order, order_line, basket_line):
        '''
            associate order_line.partner_line_reference: => partner.PartnerAsset.serial_num
        '''
#         sku_code = basket_line.stockrecord.partner_sku
        pa_qs = PartnerAsset.objects.filter(state='in_used',stockrecord=basket_line.stockrecord)
        if pa_qs.exists():
            order_line.partner_line_reference = pa_qs.values_list('serial_num', flat=True)[0]
            order_line.save()