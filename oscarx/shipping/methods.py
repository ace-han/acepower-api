from django.utils.translation import ugettext_lazy as _
from oscar.core.loading import get_class

Free = get_class('shipping.methods', 'Free')


class CommenceDown(Free):
    """
    This is a special shipping method that indicates that no shipping is
    actually required (eg for digital goods).
    """
    code = 'commence-down'
    name = _('Commence Down')