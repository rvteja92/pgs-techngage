from __future__ import absolute_import

from celery import Celery
from celery.signals import after_setup_task_logger

import os


os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'pgs.settings')

from django.conf import settings

app = Celery('pgs')#, include=['tasks'])

app.config_from_object('pgs.settings')


# @after_setup_task_logger.connect
# def augment_celery_log(**kwargs):
#     logger = logging.getLogger('celerylogger')
#     logfile = 'logs/celery.log'
#     handler = logging.FileHandler(logfile, 'a')
#     formatter = logging.Formatter('%(asctime)s - %(message)s')
#
#     if not logger.handlers:
#         formatter = logging.Formatter(logging.BASIC_FORMAT)
#         handler.setFormatter(formatter)
#         logger.addHandler(handler)
#         logger.propagate = 0
#
#         logger.setLevel(logging.DEBUG)



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
