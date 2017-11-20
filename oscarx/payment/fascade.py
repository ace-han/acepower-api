
from oscar.apps.shipping import methods as shipping_methods
from oscar.core.loading import get_class

from .methods import wx
from rest_framework.exceptions import ValidationError
CommenceDown = get_class('shipping.methods', 'CommenceDown')

class Fascade(object):
    '''
    we will delegate to many payment methods
    '''
    source_type_method_class_dict = {
        'wx': wx.WXPayment,
    }
    
    def launch_payment_request(self, order_id, source_type, user=None):
        method_class = self.source_type_method_class_dict.get(source_type, None)
        if not method_class:
            raise ValidationError('Unknown payment source type: %s' % (source_type))
        # we need instance in order to save status during process
        method_class().launch_payment_request(order_id, user)
    
    def handle_payment_callback(self, source_type, request):
        method_class = self.source_type_method_class_dict.get(source_type, None)
        if not method_class:
            raise ValidationError('Unknown payment source type: %s' % (source_type))
        return method_class().handle_payment_callback(request)
        