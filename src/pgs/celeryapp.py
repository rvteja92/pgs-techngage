from __future__ import absolute_import

from celery import Celery
import os
from django.conf import settings
#from . import celeryconfig

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'pgs.settings')

app = Celery('pgs')#, include=['tasks'])

app.config_from_object('django.conf:settings')
app.autodiscover_tasks(lambda: settings.INSTALLED_APPS)


# app.conf.update(BROKER_URL = 'amqp://',
#             CELERY_RESULT_BACKEND = 'amqp://',
#             
#             CELERY_TASK_SERIALIZER = 'json',
#             CELERY_RESULT_SERIALIZER = 'json',
#             CELERY_ACCEPT_CONTENT=['json'],
#             CELERY_TIMEZONE = 'Asia/Kolkata',
#             CELERY_ENABLE_UTC = True,
#             )

if __name__ == '__manin__':
    app.start()