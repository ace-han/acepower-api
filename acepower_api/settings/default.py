"""
Django settings for dashboard project.

Generated by 'django-admin startproject' using Django 1.11.4.

For more information on this file, see
https://docs.djangoproject.com/en/1.10/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.10/ref/settings/
"""
from __future__ import absolute_import

import os
from datetime import timedelta
import oscar
from os.path import dirname
# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
BASE_DIR = os.path.realpath(dirname(dirname(dirname(__file__))))

# Path helper
location = lambda x: os.path.join(BASE_DIR, x)

# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.10/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '5)cu*r74+(f40qyqaq44o)neocao9%euf_o66^uw*w$(ks5u#4'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = False

ALLOWED_HOSTS = [
    '.tinaam.com',
]

# This is needed for the hosted version of the sandbox
ADMINS = (
    ('Ace Han', 'ace.jl.han@gmail.com'),
)
EMAIL_SUBJECT_PREFIX = '[TINAAM] '
EMAIL_BACKEND = 'django.core.mail.backends.console.EmailBackend'
OSCAR_FROM_EMAIL = 'service@tinaam.com'

MANAGERS = ADMINS


# Application definition


INSTALLED_APPS = [
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.sites',
    'django.contrib.messages',
    'django.contrib.flatpages',
    'django.contrib.staticfiles',
    'django.contrib.sitemaps',
    'django_extensions',

    # Debug toolbar + extensions
    'debug_toolbar',
    'widget_tweaks',
    'pytz',
    'rest_framework',
    
    'django.contrib.admin',
    'common',
    'authx',
    'account',
    
    'oscarapi', # this one must go first than `api.v1.oscar`
#     'api.v1.oscar',
    'api',
    
    'oscarx.gateway',     # For allowing oscar dashboard access

] + oscar.get_core_apps([
    'oscarx.partner',
    'oscarx.payment',
    'oscarx.shipping',
    'oscarx.order',
])

MIDDLEWARE = [
    'debug_toolbar.middleware.DebugToolbarMiddleware',
    
    'django.middleware.security.SecurityMiddleware',
    'whitenoise.middleware.WhiteNoiseMiddleware',
    
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'django.contrib.flatpages.middleware.FlatpageFallbackMiddleware',
    
    # Allow languages to be selected
    'django.middleware.locale.LocaleMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.http.ConditionalGetMiddleware',
    
    # Ensure a valid basket is added to the request instance for every request
    'oscar.apps.basket.middleware.BasketMiddleware',
    # this CustomApiRootHeaderSessionMiddleware has come after AuthenticationMiddleware and SessionMiddleware
    # 'oscarapi.middleware.HeaderSessionMiddleware',
    # HeaderSessionMiddleware has hard code 'api-root' within, 
    # may as well override it for customization
    'api.middleware.CustomApiRootHeaderSessionMiddleware',
    'api.middleware.VersionSwitch',
]

ROOT_URLCONF = 'acepower_api.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [
            oscar.OSCAR_MAIN_TEMPLATE_DIR,
        ],
        'OPTIONS': {
            'loaders': [
                'django.template.loaders.filesystem.Loader',
                'django.template.loaders.app_directories.Loader',
                'django.template.loaders.eggs.Loader',
            ],
            'context_processors': [
                'django.contrib.auth.context_processors.auth',
                'django.template.context_processors.request',
                'django.template.context_processors.debug',
                'django.template.context_processors.i18n',
                'django.template.context_processors.media',
                'django.template.context_processors.static',
                'django.contrib.messages.context_processors.messages',

                # Oscar specific
                'oscar.apps.search.context_processors.search_form',
                'oscar.apps.customer.notifications.context_processors.notifications',
                'oscar.apps.promotions.context_processors.promotions',
                'oscar.apps.checkout.context_processors.checkout',
                'oscar.core.context_processors.metadata',
            ],
            'debug': DEBUG,
        }
    }
]

WSGI_APPLICATION = 'acepower_api.wsgi.application'


# Database
# https://docs.djangoproject.com/en/1.10/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql', # Add 'postgresql_psycopg2', 'mysql', 'sqlite3' or 'oracle'.
        'NAME': 'acepower',                      # Or path to database file if using sqlite3.
        'USER': 'acepower',                      # Not used with sqlite3.
        'PASSWORD': 'acepower',                  # Not used with sqlite3.
        'HOST': 'localhost',                      # Set to empty string for localhost. Not used with sqlite3.
        'PORT': '3306',
#         'OPTIONS': {
#             'init_command': 'SET foreign_key_checks = 0;',
#          },
    }
}

# monkey patch for pymysql as db level
try:
    import pymysql
    pymysql.install_as_MySQLdb()
except ImportError:
    pass 


REDIS_PORT = 6379
# please DO redefine `BROKER_URL` in $env.py if either below 2 properties change 
REDIS_HOST = '127.0.0.1'
REDIS_PASSWORD = 'ace'

REDIS_CONFIG = {
    'password': REDIS_PASSWORD, 
    'port': REDIS_PORT,
    'host': REDIS_HOST, 
}
# celery + redis
# Keep consistent with /etc/redis.conf 'requirepass' config
# please DO redefine `BROKER_URL` in ${env}.py if above properties change
REDIS_CONN_TEMPLATE = 'redis://:%(password)s@%(host)s:%(port)s/%(db)s'

CACHE_REDIS_CONFIG = REDIS_CONFIG.copy()
CACHE_REDIS_CONFIG['db'] = 0
CACHES = {
    "default": {
        "BACKEND": "django_redis.cache.RedisCache",
        "LOCATION": REDIS_CONN_TEMPLATE % CACHE_REDIS_CONFIG,
        'TIMEOUT': 600,
        "OPTIONS": {
            "CLIENT_CLASS": "django_redis.client.DefaultClient",
            "IGNORE_EXCEPTIONS": True,
            "CONNECTION_POOL_KWARGS": {
                "max_connections": 1000,
            }
        }
    }
}

# Password validation
# https://docs.djangoproject.com/en/1.10/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/1.10/topics/i18n/

LANGUAGE_CODE = 'en'
# Includes all languages that have >50% coverage in Transifex
# Taken from Django's default setting for LANGUAGES
from django.utils.translation import ugettext_lazy as _
# it won't matter if here is zh-hans, zh-Hans
#  django.utils.translation.to_locale (=> return a str)
# will replace hyphen to underscore and Upper the H in hans
# detail could be referred in django.utils.translation.trans_real.py#to_locale
LANGUAGES = (
    ('en', _('English')),
    ('zh-hans', _('Simplified Chinese')),
    ('zh-hant', _('Traditional Chinese')),
)

LOCALE_PATHS=[
    location('locale'),
]

SITE_ID = 1

TIME_ZONE = 'UTC'

USE_I18N = True

USE_L10N = True

USE_TZ = True


# Absolute filesystem path to the directory that will hold user-uploaded files.
# Example: "/var/www/example.com/media/"
MEDIA_ROOT = os.path.normpath(os.path.join(BASE_DIR, '..', 'acepower-media'))

# URL that handles the media served from MEDIA_ROOT. Make sure to use a
# trailing slash.
# Examples: "http://example.com/media/", "http://media.example.com/"
MEDIA_URL = '/media/'

# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.8/howto/static-files/
STATIC_ROOT = os.path.join(BASE_DIR, 'static')

STATIC_URL = '/static/'

STATICFILES_DIRS = (
    os.path.join(BASE_DIR, 'www').replace('\\', '/'),
)

# Radically simplified static file serving for Python web apps
# pip install whitenoise
STATICFILES_STORAGE = 'whitenoise.storage.CompressedManifestStaticFilesStorage'

STATICFILES_FINDERS = (
    'django.contrib.staticfiles.finders.FileSystemFinder',
    'django.contrib.staticfiles.finders.AppDirectoriesFinder',
)


# in order to save the history logs
PROJECT_LOG_DIR = os.path.join(BASE_DIR, '..', 'acepower_api-logs')
if not os.path.exists(PROJECT_LOG_DIR):
    os.makedirs(PROJECT_LOG_DIR)

LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'formatters': {
        'verbose': {
            'format': '%(levelname)s %(asctime)s %(module)s %(process)d %(thread)d %(message)s'
        },
        'simple': {
            'format': '%(levelname)s %(message)s'
        },
    },
    'filters': {
        'require_debug_false': {
            '()': 'django.utils.log.RequireDebugFalse'
        },
        'require_debug_true': {
            '()': 'django.utils.log.RequireDebugTrue'
        }
    },
    'handlers': {
        'null': {
            'level': 'DEBUG',
            'class': 'logging.NullHandler',
        },
        'file': {
            'class':'logging.handlers.RotatingFileHandler',
            'maxBytes': 1024*1024*5, # 5 MB
            'backupCount': 3,
            'filename': os.path.join(PROJECT_LOG_DIR, 'app.log'),
            'formatter': 'verbose'
        },
        'console':{
            'level':'INFO',
            'class':'logging.StreamHandler',
            'filters': ['require_debug_true'],
            'formatter': 'verbose'
        },
        'mail_admins': {
            'level': 'ERROR',
            'filters': ['require_debug_false'],
            'class': 'django.utils.log.AdminEmailHandler'
        },
        'db_debug': {
            'class':'logging.handlers.RotatingFileHandler',
            'filters': ['require_debug_true'],
            'maxBytes': 1024*1024*5, # 5 MB
            'backupCount': 5,
            'filename': os.path.join(PROJECT_LOG_DIR, 'db.log'),
            'formatter': 'verbose'
        },
        
    },
    'loggers': {
        # Django loggers
        'django': {
            'handlers': ['null'],
            'propagate': True,
            'level': 'INFO',
        },
        'django.request': {
            # 'handlers': ['file', 'mail_admins'],
            'handlers': ['file', 'console'],
            'level': 'ERROR',
            'propagate': True,
        },
        'django.db.backends':{
            'handlers': ['db_debug', 'console', ],
            'level': 'ERROR',
            'propagate': True,
        },
        # oscar
        'oscar': {
            'level': 'DEBUG',
            'propagate': True,
        },
        'oscar.catalogue.import': {
            'handlers': ['console'],
            'level': 'INFO',
            'propagate': False,
        },
        'oscar.alerts': {
            'handlers': ['null'],
            'level': 'INFO',
            'propagate': False,
        },
        'oscarx': {
            'handlers': ['console'],
            'level': 'INFO',
            'propagate': False,
        }, 
        # Third party
        'raven': {
            'level': 'DEBUG',
            'handlers': ['console'],
            'propagate': False,
        },
        'sorl.thumbnail': {
            'handlers': ['console'],
            'propagate': True,
            'level': 'INFO',
        },
    },
}

"""
Provide a function to update the LOGGING level in each environment's setting
"""
def update_log_level(logger, level):
    level_key = 'level'
    if type(logger) is dict:
        for key in logger:
            if key == level_key:
                logger[key] = level
            else:
                update_log_level(logger[key], level)


REST_FRAMEWORK = {
    'DEFAULT_PERMISSION_CLASSES': (
        'rest_framework.permissions.AllowAny', # for the time being only
    ), 
    'DEFAULT_AUTHENTICATION_CLASSES': (
        'rest_framework.authentication.SessionAuthentication',
        'rest_framework.authentication.BasicAuthentication',
        'rest_framework_jwt.authentication.JSONWebTokenAuthentication',
        'authx.authentication.JSONWebTokenAuthenticationQS',    # almost for debug only
    ),
    # this should align the same as django GenericListView paginate_by, page_size mechanism
    'DEFAULT_FILTER_BACKENDS': (
                                #'url_filter.integrations.drf.DjangoFilterBackend',
                                #'rest_framework.filters.DjangoFilterBackend',
                                #'django_filters.rest_framework.DjangoFilterBackend',
                                'rest_framework_filters.backends.DjangoFilterBackend',
                                'rest_framework.filters.SearchFilter',
                                #'rest_framework.filters.OrderingFilter', 
                                'common.filters.RelatedOrderingFilter'), 
    'SEARCH_PARAM': 'q',
    'ORDERING_PARAM': 'ordering', 
    'DEFAULT_PAGINATION_CLASS': 'common.pagination.StandardResultsSetPagination',
    'PAGE_SIZE': 20,
    #'PAGE_QUERY_PARAM': 'page', # sadly no this config, 'page' already is the default query param for this PageNumberPagination
    #'PAGINATE_BY_PARAM': 'page_size', # this is also in REMOVED_SETTINGS
}
QS_JWT_KEY = 'jwt' # for authx.authentication to parse query_params if any jwt

AUTH_USER_MODEL = 'authx.User'

JWT_AUTH = {
    #'JWT_PAYLOAD_HANDLER': 'rest_framework_jwt.utils.jwt_payload_handler',
    #'JWT_PAYLOAD_HANDLER': 'authx.utils.jwt_payload_handler', # we should make the payload count
    #'JWT_RESPONSE_PAYLOAD_HANDLER': 'rest_framework_jwt.utils.jwt_response_payload_handler'
    #'JWT_RESPONSE_PAYLOAD_HANDLER': 'authx.utils.jwt_response_payload_handler',
    
    # default stuff with comments no more doc looking up
    'JWT_VERIFY': True,
    'JWT_VERIFY_EXPIRATION': True,
    'JWT_LEEWAY': 60,    # in seconds
                        # This allows you to validate an expiration time which is in the past but no very far. 
                        # For example, if you have a JWT payload with an expiration time set to 30 seconds after creation 
                        # but you know that sometimes you will process it after 30 seconds, 
                        # you can set a leeway of 10 seconds in order to have some margin
    'JWT_AUDIENCE': None,   # This is a string that will be checked against the aud field of the token, if present. Default is None(fail if aud present on JWT).
    'JWT_ISSUER': None,     # This is a string that will be checked against the iss field of the token. Default is None(do not check iss on JWT).
    
    'JWT_ALLOW_REFRESH': True,     # Enable token refresh functionality. Token issued from rest_framework_jwt.views.obtain_jwt_token will have an orig_iat field.
    # for usage clarification of the following two options 
    # plz refer to https://github.com/GetBlimp/django-rest-framework-jwt/issues/92#issuecomment-227763338
    # in this situation, once the user is forced to log off, you will have to login again with username/password
    # if you want the user stay logon for a really long time(which is not good), you might as well set the JWT_EXPIRATION_DELTA long enough, but JWT_EXPIRATION_DELTA<JWT_REFRESH_EXPIRATION_DELTA for sure
    # for a much more friendly user experience in front end, I set it to one day
    # however, for a real api backend I still need another endpoint to make it seconds=300  
    'JWT_EXPIRATION_DELTA': timedelta(days=1), # used to be seconds=300, original should be no longer than JWT_REFRESH_EXPIRATION_DELTA
    # as recommended @http://stackoverflow.com/questions/26739167/jwt-json-web-token-automatic-prolongation-of-expiration?rq=1
    # a generic JWT_EXPIRATION_DELTA would be 1 hour, renew should go with every time user open the page and one hour with a setTimeout(maybe?)
    # and JWT_REFRESH_EXPIRATION_DELTA should be 1 week
    'JWT_REFRESH_EXPIRATION_DELTA': timedelta(days=7), #Limit on token refresh, is a datetime.timedelta instance. 
                                                    # This is how much time after the original token that future tokens can be refreshed from.
    'JWT_AUTH_HEADER_PREFIX': 'Bearer', # that HTTP Header Authorization: Bearer xxx, Bearer part
}

WX_APP_ID = 'YOUR_WX_APP_ID'
WX_APP_SECRET = 'YOUR_WX_APP_SECRET'


# Add Oscar's custom auth backend so users can sign in using their email
# address.
AUTHENTICATION_BACKENDS = (
    #'oscar.apps.customer.auth_backends.EmailBackend',
    'django.contrib.auth.backends.ModelBackend',
)

LOGIN_REDIRECT_URL = '/'
APPEND_SLASH = True

# ====================
# Messages contrib app
# ====================

from django.contrib.messages import constants as messages
MESSAGE_TAGS = {
    messages.ERROR: 'danger'
}

# Haystack settings
HAYSTACK_CONNECTIONS = {
    'default': {
        'ENGINE': 'haystack.backends.whoosh_backend.WhooshEngine',
        'PATH': location('whoosh_index'),
    },
}
# Here's a sample Haystack config if using Solr (which is recommended)
#HAYSTACK_CONNECTIONS = {
#    'default': {
#        'ENGINE': 'haystack.backends.solr_backend.SolrEngine',
#        'URL': u'http://127.0.0.1:8983/solr/oscar_latest/',
#        'INCLUDE_SPELLING': True
#    },
#}

# =============
# Debug Toolbar
# =============

# Implicit setup can often lead to problems with circular imports, so we
# explicitly wire up the toolbar
DEBUG_TOOLBAR_PATCH_SETTINGS = False
DEBUG_TOOLBAR_PANELS = [
    'debug_toolbar.panels.versions.VersionsPanel',
    'debug_toolbar.panels.timer.TimerPanel',
    'debug_toolbar.panels.settings.SettingsPanel',
    'debug_toolbar.panels.headers.HeadersPanel',
    'debug_toolbar.panels.request.RequestPanel',
    'debug_toolbar.panels.sql.SQLPanel',
    'debug_toolbar.panels.staticfiles.StaticFilesPanel',
    'debug_toolbar.panels.templates.TemplatesPanel',
    'debug_toolbar.panels.cache.CachePanel',
    'debug_toolbar.panels.signals.SignalsPanel',
    'debug_toolbar.panels.logging.LoggingPanel',
    'debug_toolbar.panels.redirects.RedirectsPanel',
]
INTERNAL_IPS = ['127.0.0.1', '::1']


# ==============
# Oscar settings
# ==============

from oscar.defaults import *

# Meta
# ====
OSCAR_SHOP_NAME = 'ACEPOWER'
OSCAR_SHOP_TAGLINE = ''

OSCAR_RECENTLY_VIEWED_PRODUCTS = 20
OSCAR_ALLOW_ANON_CHECKOUT = True

# This is added to each template context by the core context processor.  It is
# useful for test/stage/qa sites where you want to show the version of the site
# in the page title.
DISPLAY_VERSION = False


# Order processing
# ================

# Sample order/line status settings. This is quite simplistic. It's like you'll
# want to override the set_status method on the order object to do more
# sophisticated things.
OSCARAPI_INITIAL_ORDER_STATUS = OSCAR_INITIAL_ORDER_STATUS = 'Pending'
OSCAR_INITIAL_LINE_STATUS = 'Pending'

# This dict defines the new order statuses than an order can move to
OSCAR_ORDER_STATUS_PIPELINE = {
    'Pending': ('Being processed', 'Cancelled', 'Timeout',),
    'Being processed': ('Complete', 'Cancelled', 'Timeout',),
    'Cancelled': (),
    'Complete': (),
    'Timeout': (),
}

# This dict defines the line statuses that will be set when an order's status
# is changed
OSCAR_ORDER_STATUS_CASCADE = {
    'Pending': 'Pending',
    'Being processed': 'Being processed',
    'Cancelled': 'Cancelled',
    'Complete': 'Shipped',
    'Timeout': 'Timeout',
}

OSCAR_ORDER_TIMEOUT_SEC = 300

# LESS/CSS
# ========

# We default to using CSS files, rather than the LESS files that generate them.
# If you want to develop Oscar's CSS, then set USE_LESS=True to enable the
# on-the-fly less processor.
USE_LESS = False


# Sentry
# ======

if os.environ.get('SENTRY_DSN'):
    RAVEN_CONFIG = {'dsn': os.environ.get('SENTRY_DSN')}
    LOGGING['handlers']['sentry'] = {
        'level': 'ERROR',
        'class': 'raven.contrib.django.raven_compat.handlers.SentryHandler',
    }
    LOGGING['root']['handlers'].append('sentry')
    INSTALLED_APPS.append('raven.contrib.django.raven_compat')


# Sorl
# ====

THUMBNAIL_DEBUG = True
THUMBNAIL_KEY_PREFIX = 'oscar-sandbox'

# Django 1.6 has switched to JSON serializing for security reasons, but it does not
# serialize Models. We should resolve this by extending the
# django/core/serializers/json.Serializer to have the `dumps` function. Also
# in tests/config.py
SESSION_SERIALIZER = 'django.contrib.sessions.serializers.JSONSerializer'

OSCAR_DEFAULT_CURRENCY = 'CNY'



