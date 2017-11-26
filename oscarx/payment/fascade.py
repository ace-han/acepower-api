
from oscar.core.loading import get_model

from rest_framework.exceptions import ValidationError

from .methods.test import TestPayment
from .methods.wx import WXPayment

SourceType = get_model('payment', 'SourceType')
Source = get_model('payment', 'Source')

class Fascade(object):
    '''
    we will delegate to many payment methods
    '''
    source_type_method_class_dict = {
        TestPayment.source_type: TestPayment,
        WXPayment.source_type: WXPayment,
    }
    
    @staticmethod
    def launch_payment_request(order, source_type='test', user=None):
        '''
            return third party structure data for diff payment logic
        '''
        method_class = Fascade.source_type_method_class_dict.get(source_type, None)
        if not method_class:
            raise ValidationError('Unknown payment source type: %s' % (source_type))
       
        # we need instance in order to save status during process
        return method_class().launch_payment_request(order, user)
    
    @staticmethod
    def handle_payment_callback(source_type, request):
        method_class = Fascade.source_type_method_class_dict.get(source_type, None)
        if not method_class:
            raise ValidationError('Unknown payment source type: %s' % (source_type))
        return method_class().handle_payment_callback(request)
        