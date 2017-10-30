from django.conf.urls import url

from .views import GatewayView

urlpatterns = [
    url(r'^$', GatewayView.as_view(), name='gateway')
]
