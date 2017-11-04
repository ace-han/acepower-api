from django.conf.urls import url, include
from .auth import urls as auth_urls
from .account import urls as account_urls
from .oscar import urls as oscar_api

urlpatterns = (
    url(r'^auth/', include(auth_urls, namespace='auth')),
    url(r'^account/', include(account_urls, namespace='account')),
    url(r'^oscar/', include(oscar_api, namespace='oscar')),
)
