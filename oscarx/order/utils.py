from django.utils import timezone


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