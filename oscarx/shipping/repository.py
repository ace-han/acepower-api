
from oscar.apps.shipping import methods as shipping_methods
from oscar.core.loading import get_class

CommenceDown = get_class('shipping.methods', 'CommenceDown')
OcarRepository = get_class('shipping.repository', 'Repository')
class Repository(OcarRepository):
    """
    Repository class responsible for returning ShippingMethod
    objects for a given user, basket etc
    """

    # We default to just free shipping. Customise this class and override this
    # property to add your own shipping methods. This should be a list of
    # instantiated shipping methods.
    methods = (shipping_methods.Free(), CommenceDown())