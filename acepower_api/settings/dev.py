from .default import *

DEBUG = True

update_log_level(LOGGING, 'DEBUG')

ALLOWED_HOSTS = []
# when behind the https forwarding
# SECURE_PROXY_SSL_HEADER = ('HTTP_X_FORWARDED_PROTO', 'https')
# SECURE_SSL_REDIRECT = True
# SESSION_COOKIE_SECURE = True
# CSRF_COOKIE_SECURE = True

WX_APP_ID = 'wxbdee7bda590211e8'
WX_APP_SECRET = 'f6ab4c3fa06f673ba72298ed64cc9752'

