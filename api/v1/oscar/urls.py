from django.conf.urls import url

from . import views


urlpatterns = (
    url(r'^index', views.index),
    url(r'^assetlocation/status$', views.assetlocation_status),
    url(r'^basket/preview$', views.BasketPreview.as_view()),
    url(r'^asset/checkout$', views.CheckoutView.as_view()),
    url(r'^asset/basket/(?P<basket_id>\d+)$', views.AssetBasketView.as_view()),
    url(r'^payment/(?P<order_id>\d+)$', views.PaymentRequestView.as_view(), name='api-payment'),
    url(r'^payment/callback$', views.PaymentCallbackView.as_view()),
)
