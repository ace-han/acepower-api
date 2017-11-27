from __future__ import absolute_import

from datetime import timedelta

from celery import shared_task, signature
from celery.utils.log import get_task_logger
from django.conf import settings
from django.utils import timezone
from oscar.core.loading import get_model
from django.db.transaction import atomic


Order = get_model('order', 'Order')
OrderLine = get_model('order', 'Line')
OrderLineAttribute = get_model('order', 'LineAttribute')
ShippingEventType = get_model('order', 'ShippingEventType')
ShippingEvent = get_model('order', 'ShippingEvent')
ShippingEventQuantity = get_model('order', 'ShippingEventQuantity')

@atomic
@shared_task(bind=True)
def mark_as_timeout(self):
    '''
    mark order status as Timeout and cancel the allocation of the each stock
    '''
    logger = get_task_logger(self.name)
    now = timezone.now()
    delta = timedelta(seconds=settings.OSCAR_ORDER_TIMEOUT_SEC)
    fine_time = now - delta
    o_qs = Order.objects.filter(status='pending', date_placed__lt=fine_time)
    if not o_qs.exists():
        logger.info('No `pending` orders need mark as `timeout`')
        return
    
    o_counter = 0
    l_counter = 0
    for o in o_qs:
        for line in o.lines.all().select_related('stockrecord'):
            if line.stockrecord:
                line.stockrecord.cancel_allocation(line.quantity)
                l_counter += 1
        o.set_status('timeout')
        o_counter += 1
    logger.info('pending order size: %s, order line size: %s', o_counter, l_counter)
 
@atomic
@shared_task(bind=True)
def turn_off_device(self, order_id):
    logger = get_task_logger(self.name)
    order = Order.objects.get(id=order_id)
    first_line = order.lines.all()[0]
    sku_code = first_line.attributes.filter(option__code='sku_code').values_list('value', flat=True)
    logger.info('turning off order: %s, sku_code: %s', order.id, sku_code)
    order.set_status('complete')
    first_line.stockrecord.cancel_allocation(first_line.quantity)
    shipping_event_type = ShippingEventType.objects.get(code='delivered')
    shipping_event = ShippingEvent.objects.create(order=order, event_type=shipping_event_type)
    shipping_event.save()
    for line in order.lines.all():
        ShippingEventQuantity.objects.create(
            event=shipping_event, line=line, quantity=line.quantity)
    logger.info('turned off order: %s, sku_code: %s', order.id, sku_code)
 
@shared_task(bind=True)
def turn_off_devices(self):
    logger = get_task_logger(self.name)
    event_qs = ShippingEvent.objects.filter(order__status='being_processed', 
                event_type__code='shipped').values('id', 'order_id', 'date_created')
    if not event_qs.exists():
        logger.info('No Counting Down orders')
        return
    order_id_event_createtime_dict = {event['order_id']: event['date_created'] for event in event_qs}
    line_qs = OrderLine.objects.filter(order_id__in=order_id_event_createtime_dict.keys()).values('id', 'order_id')
    line_id_order_id_dict = {line['id']: line['order_id'] for line in line_qs}
     
    ola_qs = OrderLineAttribute.objects.filter(line_id__in=line_id_order_id_dict.keys(), 
                                               option__code='unit_duration_min').values()
    now = timezone.now()
    completed_order_ids = []
    for ola in ola_qs:
        order_id = line_id_order_id_dict[ ola['line_id'] ]
        event_createtime = order_id_event_createtime_dict[ order_id ]
        try:
            unit_duration_min = int(ola['unit_duration_min'])
        except:
            unit_duration_min = 1
        if event_createtime+timedelta(minutes=unit_duration_min) < now:
            completed_order_ids.append(order_id)
    if not completed_order_ids:
        logger.info('No `completed` orders')
    task = signature('oscarx.order.tasks.turn_off_device')
    for completed_order_id in completed_order_ids:
        task.apply_async((completed_order_id, ), expires=60)
        