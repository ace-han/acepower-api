from decimal import Decimal
import warnings

from django.core.urlresolvers import reverse, NoReverseMatch
from oscar.core.loading import get_model
from oscarapi.serializers.basket import OfferDiscountSerializer, \
    VoucherDiscountSerializer
from oscarapi.serializers.fields import TaxIncludedDecimalField
from rest_framework.exceptions import ValidationError, NotAcceptable
from rest_framework.fields import SerializerMethodField, DecimalField, CharField, \
    IntegerField
from rest_framework.serializers import Serializer
from oscarapi.serializers.checkout import CheckoutSerializer, OrderSerializer
from common.serializers import DynamicFieldsModelSerializer


Basket = get_model('basket', 'Basket')
BasketLine = get_model('basket', 'Line')
BasketLineAttribute = get_model('basket', 'LineAttribute')

AssetLocation = get_model('partner', 'AssetLocation')
ShippingAddress = get_model('order', 'ShippingAddress')
BillingAddress = get_model('order', 'BillingAddress')

class AssetLocationSerializer(DynamicFieldsModelSerializer):
    class Meta:
        model = AssetLocation
        fields = '__all__'

class BasketLineAttributeSerializer(DynamicFieldsModelSerializer):
    code = CharField(source='option.code')
    class Meta:
        model = BasketLineAttribute
        fields = '__all__'

class AssetLocationBasketLineSerializer(DynamicFieldsModelSerializer):
    attributes = BasketLineAttributeSerializer(
        many=True,
        required=False,
        read_only=True)
    
    asset_location = SerializerMethodField()
    
    class Meta:
        model = BasketLine
        fields = '__all__'
    
    def get_asset_location(self, obj):
        qs  = AssetLocation.objects.filter(code=obj.stockrecord.partner_sku)
        if qs.exists():
            l_ser = AssetLocationSerializer(qs.get())
        else:
            l_ser = AssetLocationSerializer(AssetLocation.objects.none())
        return l_ser.data


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


class AssetOrderSerializer(OrderSerializer):
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