from __future__ import absolute_import

from datetime import timedelta

from celery import shared_task
from celery.utils.log import get_task_logger
from django.conf import settings
from django.utils import timezone
from oscar.core.loading import get_model
from django.db.transaction import atomic


Order = get_model('order', 'Order')

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