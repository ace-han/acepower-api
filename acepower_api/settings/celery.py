from .default import *

DEBUG = False
#: Only add pickle to this list if your broker is secured
#: from unwanted access (see userguide/security.html)
RESULT_REDIS_CONFIG = REDIS_CONFIG.copy()
RESULT_REDIS_CONFIG['db'] = 1
CELERY_RESULT_BACKEND = REDIS_CONN_TEMPLATE % RESULT_REDIS_CONFIG

BROKER_REDIS_CONFIG = REDIS_CONFIG.copy()
BROKER_REDIS_CONFIG['db'] = 2
CELERY_BROKER_URL = REDIS_CONN_TEMPLATE % BROKER_REDIS_CONFIG
CELERY_ACCEPT_CONTENT = ['json']
CELERY_TASK_SERIALIZER = 'json'
CELERY_RESULT_SERIALIZER = 'json'

CELERY_TIMEZONE = TIME_ZONE

# Maximum number of tasks a pool worker process can execute before it’s replaced with a new one. 
# resource cleaning insurance mechanism for celery workers, 
# especially useful for those ssh, db connection error-prone senarios
CELERYD_MAX_TASKS_PER_CHILD=200

from celery.schedules import crontab

CELERY_BEAT_SCHEDULE = {
    'mark_pending_order_timeout': {
        'task': 'oscarx.order.tasks.mark_as_timeout',
        'schedule': crontab(minute='*'),
        #'args': (1, 2)
    },
}

