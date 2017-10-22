from django.conf.urls import url, include
from rest_framework import routers

from . import views

router = routers.DefaultRouter()
router.register('profiles', views.ProfileViewSet)

urlpatterns = (
    url(r'^encrypted-profile', views.encrypted_profile),
    url(r'^', include(router.urls)),
)
