from django.db.transaction import atomic
from oscar.core.loading import get_model

SourceType = get_model('payment', 'SourceType')
Source = get_model('payment', 'Source')

ShippingEventType = get_model('order', 'ShippingEventType')
ShippingEvent = get_model('order', 'ShippingEvent')
ShippingEventQuantity = get_model('order', 'ShippingEventQuantity')

class BasePayment(object):
    
    source_type = 'base'
    
    def prepare_payment_source(self, order, reference, amount_allocated, amount_debited, 
                               amount_refunded=0, label=''):
        '''
            please call this method during pre-payment
        '''
        # payment source
        o_source_type, _ = SourceType.objects.get_or_create(name=self.source_type.capitalize(), 
                                                           code=self.source_type)
        source, _ = Source.objects.get_or_create(order=order,
                                       source_type=o_source_type,
                                       defaults = {
                                           'currency': order.currency,
                                           'amount_allocated': amount_allocated,
                                           'amount_debited': amount_debited,
                                           'amount_refunded': amount_refunded,
                                           'reference': reference,
                                           'label': label,
                                        }
                                    )
        return source

    def prepare_shipped_event(self, order, payment_event):
        '''
            this is the place for turning on the device
        '''
        shipping_event_type = ShippingEventType.objects.get(code='shipped')
        shipping_event = ShippingEvent.objects.create(order=order, event_type=shipping_event_type)
        shipping_event.save()
        for line in order.lines.all():
            ShippingEventQuantity.objects.create(
                event=shipping_event, line=line, quantity=line.quantity)
        payment_event.shipping_event = shipping_event
        payment_event.save()


    def launch_payment_request(self, order, user):
        raise NotImplementedError()
    
    @atomic
    def handle_payment_callback(self, request):
        raise NotImplementedError()