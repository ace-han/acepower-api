from oscar.core.loading import get_class

UseFirstStockRecord = get_class('partner.strategy', 'UseFirstStockRecord')
StockRequired = get_class('partner.strategy', 'StockRequired')
NoTax = get_class('partner.strategy', 'NoTax')
Structured = get_class('partner.strategy', 'Structured')

class Selector(object):
    """
    Responsible for returning the appropriate strategy class for a given
    user/session.

    This can be called in three ways:

    #) Passing a request and user.  This is for determining
       prices/availability for a normal user browsing the site.

    #) Passing just the user.  This is for offline processes that don't
       have a request instance but do know which user to determine prices for.

    #) Passing nothing.  This is for offline processes that don't
       correspond to a specific user.  Eg, determining a price to store in
       a search index.

    """

    def strategy(self, request=None, user=None, **kwargs):
        """
        Return an instanticated strategy instance
        """
        # Default to the backwards-compatible strategy of picking the first
        # stockrecord but charging zero tax.
        return SKUOption(request)


class SKUOption(UseFirstStockRecord, StockRequired, NoTax, Structured):
    
    def select_stockrecord(self, product):
        '''
        we should set a `sku_code` to a product instance to select a `partner_sku` matching stockrecord
        otherwise it fall back to `UseFirstStockRecord`
        '''
        if hasattr(product, 'sku_code'):
            # first one that qualifies sku_code
            qs = product.stockrecords.filter(partner_sku=product.sku_code)
            if qs.exists():
                return qs[0]
        return super().select_stockrecord(product)