from decimal import Decimal
import warnings

from django.conf import settings
from django.core.urlresolvers import reverse, NoReverseMatch
from oscar.core.loading import get_model
from oscarapi.serializers.basket import OfferDiscountSerializer, \
    VoucherDiscountSerializer
from oscarapi.serializers.checkout import CheckoutSerializer, OrderSerializer
from oscarapi.serializers.fields import TaxIncludedDecimalField
from oscarapi.utils import overridable
from rest_framework.exceptions import ValidationError, NotAcceptable
from rest_framework.fields import SerializerMethodField, DecimalField, CharField, \
    IntegerField
from rest_framework.serializers import Serializer

from common.serializers import DynamicFieldsModelSerializer
from oscarx.payment.fascade import Fascade


Basket = get_model('basket', 'Basket')
BasketLine = get_model('basket', 'Line')
BasketLineAttribute = get_model('basket', 'LineAttribute')

AssetLocation = get_model('partner', 'AssetLocation')
ShippingAddress = get_model('order', 'ShippingAddress')
BillingAddress = get_model('order', 'BillingAddress')
Order = get_model('order', 'Order')
OrderLine = get_model('order', 'Line')
OrderLineAttribute = get_model('order', 'LineAttribute')

class AssetLocationSerializer(DynamicFieldsModelSerializer):
    class Meta:
        model = AssetLocation
        fields = '__all__'

class BasketLineAttributeSerializer(DynamicFieldsModelSerializer):
    code = CharField(source='option.code')
    class Meta:
        model = BasketLineAttribute
        fields = '__all__'

class AssetLocationMixin(Serializer):
    asset_location = SerializerMethodField()
    
    def get_asset_location(self, obj):
        attribute_mgr = getattr(obj, 'attributes') if hasattr(obj, 'attributes') else getattr(obj, 'line_attributes')
        qs = attribute_mgr.filter(option__code='sku_code')
        if not qs.exists():
            return AssetLocationSerializer(AssetLocation.objects.none()).data
        qs  = AssetLocation.objects.filter(code=qs.values_list('value', flat=True)[0])
        if qs.exists():
            l_ser = AssetLocationSerializer(qs.get())
        else:
            l_ser = AssetLocationSerializer(AssetLocation.objects.none())
        return l_ser.data

class AssetLocationBasketLineSerializer(AssetLocationMixin, DynamicFieldsModelSerializer):
    attributes = BasketLineAttributeSerializer(
        many=True,
        required=False,
        read_only=True)
    
    class Meta:
        model = BasketLine
        fields = '__all__'

class AssetLocationBasketSerializer(DynamicFieldsModelSerializer):
    
    offer_discounts = OfferDiscountSerializer(many=True, required=False)
    total_excl_tax = DecimalField(
        decimal_places=2, max_digits=12, required=False)
    total_excl_tax_excl_discounts = DecimalField(
        decimal_places=2, max_digits=12, required=False)
    total_incl_tax = TaxIncludedDecimalField(
        excl_tax_field='total_excl_tax', decimal_places=2,
        max_digits=12, required=False)
    total_incl_tax_excl_discounts = TaxIncludedDecimalField(
        excl_tax_field='total_excl_tax_excl_discounts', decimal_places=2,
        max_digits=12, required=False)
    total_tax = TaxIncludedDecimalField(
        excl_tax_value=Decimal('0.00'), decimal_places=2,
        max_digits=12, required=False)
    currency = CharField(required=False)
    
    voucher_discounts = VoucherDiscountSerializer(many=True, required=False)
    lines = AssetLocationBasketLineSerializer(many=True, required=False)
    
    class Meta:
        model = Basket
        fields = '__all__'
        
class AssetLocationReserveSerializer(Serializer):
    sku_code = CharField(max_length=128)
    unit_duration_min = IntegerField(min_value=0)
    
    def validate_sku_code(self, value):
        ok = AssetLocation.objects.filter(code=value).exists()
        if not ok:
            raise ValidationError('AssetLocation not found')
        return value

class OrderLineAttributeSerializer(DynamicFieldsModelSerializer):
    code = CharField(source='option.code')
    class Meta:
        model = OrderLineAttribute
        fields = '__all__'

class AssetOrderLineSerializer(AssetLocationMixin, DynamicFieldsModelSerializer):
    line_attributes = OrderLineAttributeSerializer(many=True,
        required=False,
        read_only=True)
    
    class Meta:
        model = OrderLine
        fields = '__all__'

class AssetOrderSerializer(OrderSerializer):
    
    lines = AssetOrderLineSerializer(many=True, required=False)
    
    def get_payment_url(self, obj):
        reverse_view_name = 'api:v1:oscar:api-payment'
        try:
            return reverse(reverse_view_name, args=(obj.pk,))
        except NoReverseMatch:
            msg = "You need to implement a view named '%s' " \
                "which redirects to the payment provider and sets up the " \
                "callbacks." % (reverse_view_name, )
            warnings.warn(msg)
            return msg

class CountDownOrderSerializer(AssetOrderSerializer):
    countdown_secs = SerializerMethodField()
    
    def get_countdown_secs(self, obj):
        return settings.OSCAR_ORDER_TIMEOUT_SEC

    class Meta:
        model = Order
        fields = overridable('OSCARAPI_ORDER_FIELD', default=(
            'number', 'basket', 'url', 'lines',
            'owner', 'billing_address', 'currency', 'total_incl_tax',
            'total_excl_tax', 'shipping_incl_tax', 'shipping_excl_tax',
            'shipping_address', 'shipping_method', 'shipping_code', 'status',
            'guest_email', 'date_placed', 'payment_url', 'offer_discounts',
            'voucher_discounts', 'countdown_secs')
        )
    
class AssetCheckoutSerializer(CheckoutSerializer):
    
    def create(self, validated_data):
        try:
            basket = validated_data.get('basket')
            order_number = self.generate_order_number(basket)
            request = self.context['request']
            # make this shipping_address optional
            if 'shipping_address' in validated_data:
                shipping_address = ShippingAddress(
                **validated_data['shipping_address'])
            else:
                shipping_address = None

            if 'billing_address' in validated_data:
                billing_address = BillingAddress(
                    **validated_data['billing_address'])
            else:
                billing_address = None

            return self.place_order(
                order_number=order_number,
                user=request.user,
                basket=basket,
                shipping_address=shipping_address,
                shipping_method=validated_data.get('shipping_method'),
                shipping_charge=validated_data.get('shipping_charge'),
                billing_address=billing_address,
                order_total=validated_data.get('total'),
                guest_email=validated_data.get('guest_email') or ''
            )
        except ValueError as e:
            raise NotAcceptable(str(e))

class PaymentSerializer(Serializer):
    order = IntegerField()
    source_type = CharField()
    
    def validate_order(self, value):
        o = Order.objects.get(id=value)
        if o.status != 'pending':
            raise ValidationError('Order status: %s invalid' % o.status)
        return o
    
    def validate_source_type(self, value):
        if value not in Fascade.source_type_method_class_dict:
            raise ValidationError('Payment type: %s not suppported' % value)
        
        return value