"""dashboard URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.10/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf import settings
from django.conf.urls import url, include
from django.conf.urls.i18n import i18n_patterns
from django.contrib import admin
from oscar.app import application
from django.contrib.sitemaps import views

from common.sitemaps import base_sitemaps
from gateway import urls as gateway_urls
from .views import index

urlpatterns = [
    url(r'^i18n/', include('django.conf.urls.i18n')),
    url(r'^api/', include('api.urls', namespace='api')),
    # The Django admin is not officially supported; expect breakage.
    # Nonetheless, it's often useful for debugging.
    url(r'^admin/', include(admin.site.urls)),

    # include a basic sitemap
    url(r'^sitemap\.xml$', views.index,
        {'sitemaps': base_sitemaps}),
    url(r'^sitemap-(?P<section>.+)\.xml$', views.sitemap,
        {'sitemaps': base_sitemaps},
        name='django.contrib.sitemaps.views.sitemap')
]

# Prefix Oscar URLs with language codes
urlpatterns += i18n_patterns(
    #url(r'^$', index),
    # Custom functionality to allow dashboard users to be created
    url(r'gateway/', include(gateway_urls)),
    # Oscar's normal URLs
    url(r'^', application.urls),
)

if settings.DEBUG:
    from django.views.static import serve as static_serve
    from django.contrib.staticfiles.urls import staticfiles_urlpatterns
    from oscar.views import handler403, handler404, handler500

    import debug_toolbar
    # Server statics and uploaded media
    urlpatterns = [
                  url(r'^media/(?P<path>.*)$', static_serve,
                      {'document_root': settings.MEDIA_ROOT, 'show_indexes': True}),
              ] + staticfiles_urlpatterns() + urlpatterns
    # Allow error pages to be tested
    urlpatterns += [
        url(r'^403$', handler403),
        url(r'^404$', handler404),
        url(r'^500$', handler500),
        url(r'^__debug__/', include(debug_toolbar.urls)),
    ]