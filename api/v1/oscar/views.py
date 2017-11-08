from oscar.core.loading import get_model
from rest_framework.decorators import api_view
from rest_framework.response import Response


OrderLineAttribute = get_model('order', 'LineAttribute')
Order = get_model('order', 'Order')

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
    assetlocation_code = request.query_params.get('assetlocation_code')
    option_code_key = 'assetlocation_code' # tide association with data in db!!!
    status = 'Being processed'
#     orderline = OrderLineAttribute.objects.filter(option__code=option_code_key,
#                                                   value=assetlocation_code)
    qs = Order.objects.filter(lines__attributes__option__code=option_code_key, 
                         lines__attributes__value=assetlocation_code,
                         user=request.user,
                         status=status).values('id', 'user_id')
    occupied = qs.exists()
    if occupied:
        item = qs[0]
        result = {
            'occupied': True,
            'occupied_by': item['user_id'],
            'order_id': item['id']# not pledged to return...
        }
    else:
        result = {
            'occupied': False,
            'occupied_by': None,
        }
    return Response(result)
    