from oscar.core.loading import get_model

Order = get_model('order', 'Order')

def is_assetlocation_occupied(assetlocation_code):
    option_code_key = 'assetlocation_code'
    status = 'Being processed'
    qs = Order.objects.filter(lines__attributes__option__code=option_code_key, 
                         lines__attributes__value=assetlocation_code,
                         status=status)
    return qs.exists()