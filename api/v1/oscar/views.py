
from oscar.core.loading import get_model
from oscarapi.basket import operations
from oscarapi.views.basket import AddProductView
from oscarapi.views.checkout import CheckoutView as OscarApiCheckoutView
from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.generics import get_object_or_404
from rest_framework.response import Response
from rest_framework.views import APIView

from api.v1.oscar.serializers import AssetLocationReserveSerializer, \
    AssetLocationBasketSerializer, AssetCheckoutSerializer, \
    AssetOrderSerializer, CountDownOrderSerializer


Basket = get_model('basket', 'Basket')
OrderLineAttribute = get_model('order', 'LineAttribute')
Order = get_model('order', 'Order')
Product = get_model('catalogue', 'Product')
ProductOption = get_model('catalogue', 'Option')

@api_view(['GET'])
def index(request):
    return Response({'msg': 'Hello AcePower'})

@api_view(['GET'])
def assetlocation_status(request):
    '''
        return {
            'occupied': True/False,
            'occupied_by': user_id
        }
    '''
    option_code_key = 'sku_code' # tide association with data in db!!!
    sku_code = request.query_params.get(option_code_key)
    statuses = ('Pending', 'Being processed')
#     orderline = OrderLineAttribute.objects.filter(option__code=option_code_key,
#                                                   value=assetlocation_code)
#     now = timezone.now()
#     qs = Order.objects.filter(date_placed__gt=now-timedelta(minutes=5), 
    qs = Order.objects.filter(status__in=statuses,
                            lines__attributes__option__code=option_code_key, 
                            lines__attributes__value=sku_code)
    occupied = qs.exists()
    if occupied:
        item = qs[0]
        result = {
            'occupied': True,
            'order': CountDownOrderSerializer(item, context={'request': request}).data,
        }
    else:
        result = {
            'occupied': False,
            'occupied_by': None,
        }
    return Response(result)

class BasketPreview(AddProductView):
    """
    refer to oscarapi.views.basket#AddProductView
    """
    serializer_class = AssetLocationBasketSerializer

    def post(self, request, format=None):
        '''
            return a basket info refer to oscar api with a little modification
            {
                "id": 1,
                "owner": user_id,
                "status": "Open",
                "lines": [
                    {...}, 
                    {...}, ...
                ],
                "total_excl_tax": "59.96",
                "total_excl_tax_excl_discounts": "66.95",
                "total_incl_tax": "59.96",
                "total_incl_tax_excl_discounts": "66.95",
                "total_tax": "0.00",
                "currency": "CNY",
                "voucher_discounts": [],
                "offer_discounts": [
                    {
                        "description": null,
                        "name": "Normal site offer",
                        "amount": "6.99"
                    }
                ],
                "is_tax_known": true
            } 
        '''
        ser = AssetLocationReserveSerializer(data=request.data)
        ser.is_valid(raise_exception=True)
    #     3. empty(flush) the basket and add a stockrecord basketline to the basket, apply all the offers
    #     4. return the basket info and display it
        options = []
        product = None
        quantity = 1
        sku_code_key = 'sku_code'
        
        for k, v in ser.validated_data.items():
            if k == sku_code_key:
                product = get_object_or_404(Product, stockrecords__partner_sku=v)
                product.sku_code = v
            option = get_object_or_404(ProductOption, code=k)
            options.append({
                'option': option,
                'value': v,
            })
    
        basket = operations.get_basket(request)
        basket.flush()
        basket_valid, message = self.validate(basket, product, quantity, options)
        if not basket_valid:
            return Response({'detail': message}, status=status.HTTP_406_NOT_ACCEPTABLE)
        basket.add_product(product, quantity=1, options=options)
        operations.apply_offers(request, basket)
        ser = self.serializer_class(basket, context={'request': request})
        return Response(ser.data)

class CheckoutView(OscarApiCheckoutView):
    """
    customize shipping_address to be 
    Prepare an order for checkout.

    POST(basket, shipping_address,
         [total, shipping_method_code, shipping_charge, billing_address]):
    {
        "basket": "http://testserver/oscarapi/baskets/1/",
        "guest_email": "foo@example.com",
        "total": "100.0",
        "shipping_charge": {
            "currency": "EUR",
            "excl_tax": "10.0",
            "tax": "0.6"
        },
        "shipping_method_code": "no-shipping-required",
        "shipping_address": {
            "country": "http://127.0.0.1:8000/oscarapi/countries/NL/",
            "first_name": "Henk",
            "last_name": "Van den Heuvel",
            "line1": "Roemerlaan 44",
            "line2": "",
            "line3": "",
            "line4": "Kroekingen",
            "notes": "Niet STUK MAKEN OK!!!!",
            "phone_number": "+31 26 370 4887",
            "postcode": "7777KK",
            "state": "Gerendrecht",
            "title": "Mr"
        }
    }
    returns the order object.
    """
    order_serializer_class = CountDownOrderSerializer
    serializer_class = AssetCheckoutSerializer

class AssetOrderView(APIView):
    serializer_class = AssetOrderSerializer
    
    def get(self, request, order_id, format=None):
        order = get_object_or_404(Order, id=order_id)
        ser = self.serializer_class(order, context={'request': request})
        return Response(ser.data)

class CountDownOrderView(AssetOrderView):
    serializer_class = CountDownOrderSerializer

class PaymentRequestView(APIView):
    
    def post(self, request, order_id):
        return Response({'msg': 'stub'})

class PaymentCallbackView(APIView):
    
    def post(self, request, order_id):
        return Response({'msg': 'stub'})