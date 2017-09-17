from .default import *

DEBUG = True

update_log_level(LOGGING, 'DEBUG')

# when behind the https forwarding
# SECURE_PROXY_SSL_HEADER = ('HTTP_X_FORWARDED_PROTO', 'https')
# SECURE_SSL_REDIRECT = True
# SESSION_COOKIE_SECURE = True
# CSRF_COOKIE_SECURE = True