from decimal import Decimal

from oscar.core.loading import get_model
from oscarapi.serializers.basket import OfferDiscountSerializer, \
    VoucherDiscountSerializer
from oscarapi.serializers.fields import TaxIncludedDecimalField
from rest_framework.exceptions import ValidationError
from rest_framework.fields import SerializerMethodField, DecimalField, CharField, \
    IntegerField
from rest_framework.serializers import Serializer

from api.v1.oscar.asset import is_assetlocation_occupied
from common.serializers import DynamicFieldsModelSerializer


Basket = get_model('basket', 'Basket')
BasketLine = get_model('basket', 'Line')
BasketLineAttribute = get_model('basket', 'LineAttribute')

AssetLocation = get_model('partner', 'AssetLocation')

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
        a_qs = obj.attributes.filter(option__code='assetlocation_code')
        if a_qs.exists():
            l_qs = AssetLocation.objects.filter(code=a_qs.values_list('value', flat=True)[0])
            l_ser = AssetLocationSerializer(l_qs.get())
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
    assetlocation_code = CharField(max_length=128)
    unit_duration_min = IntegerField(min_value=0)
    
    def validate_assetlocation_code(self, value):
        ok = AssetLocation.objects.filter(code=value).exists()
        if not ok:
            raise ValidationError('AssetLocation not found')
        occupied = is_assetlocation_occupied(value)
        if occupied:
            raise ValidationError('AssetLocation is occupied')
        return value