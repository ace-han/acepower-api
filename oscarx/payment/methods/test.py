import json

from django.db.transaction import atomic
from django.urls.base import reverse
from oscar.core.loading import get_model
from rest_framework.exceptions import ValidationError
from rest_framework.generics import get_object_or_404
from rest_framework.test import APIRequestFactory
from rest_framework.views import APIView

from .base import BasePayment

Order = get_model('order', 'Order')
PaymentEventType = get_model('order', 'PaymentEventType')
PaymentEvent = get_model('order', 'PaymentEvent')
PaymentEventQuantity = get_model('order', 'PaymentEventQuantity')

SourceType = get_model('payment', 'SourceType')
Source = get_model('payment', 'Source')


class TestPayment(BasePayment):
    
    source_type = 'test'
    
    def launch_payment_request(self, order, user):
        self.prepare_payment_source(order, order.number, 0, order.total_incl_tax)
        factory = APIRequestFactory()
        request = factory.post(reverse('api:v1:oscar:api-payment-callback'), 
                    json.dumps({'order_number': order.number}), 
                    content_type='application/json')
        request = APIView().initialize_request(request)
        return self.handle_payment_callback(request)
    
    @atomic
    def handle_payment_callback(self, request):
        order_number = request.data.get('order_number')
        order = get_object_or_404(Order, number=order_number)
        if order.status != 'pending':
            raise ValidationError('Invalid order status: %s in payment callback' % order.status)
        
        order.set_status('being_processed')
        
        # payment first
        source = Source.objects.get(order=order, source_type__code=self.source_type)
        # create transaction record
        source.allocate(order.total_incl_tax, reference=order.number)
        
        payment_event_type = PaymentEventType.objects.get(code='pre-authorised')
        payment_event = PaymentEvent.objects.create(
                        order=order, 
                        amount=order.total_incl_tax,
                        reference=order.number,
                        event_type=payment_event_type)
        payment_event.save()
        for line in order.lines.all():
            PaymentEventQuantity.objects.create(
                event=payment_event, line=line, quantity=line.quantity)
        
        # shipment follows
        self.prepare_shipped_event(order, payment_event)
        return 'ok'