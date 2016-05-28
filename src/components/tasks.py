from __future__ import absolute_import

from .geo.googlegeo import getAddressObject
import os, sys, django
import logging
from pgs.celeryapp import app
from .twitter import notifyUpdates

project_path = os.path.dirname(os.path.abspath(__file__)) + '/../'

sys.path.append(project_path)
os.environ['DJANGO_SETTINGS_MODULE'] = 'pgs.settings'
django.setup()

from core.models import Issue

logger = logging.getLogger('celerylogger')


@app.task(bind=True)
def getaddressfor(self, grievance_id):

    #logging configuration
    # global logger
    # logfile = 'logs/celery.log'
    # handler = logging.FileHandler(logfile, 'a')
    # formatter = logging.Formatter('%(asctime)s - %(message)s')

    #business logic
    issue = Issue.objects.filter(issue_id=grievance_id).get()
    try:
        geoaddress = getAddressObject(issue.latitude, issue.longitude)
        if geoaddress:
            issue.geo_address = geoaddress

            try:
                issue.save()
                logging.info('Address saved for grievance')
                return True
            except Exception as e:
                self.retry(countdown=1200, max_retries=2)
                logging.error('Address determined but could not save object ' + str(e))
                raise Exception()

    except Exception as e:
        self.retry(countdown=1200, max_retries=2)
        raise Exception()

    return False

@app.task(bind=True)
def notifyStatus(self, message, grievance_id):
    grievance   = Issue.objects.filter(issue_id=grievance_id).get()
    handle  = grievance.twitter_handle
    reply_id = grievance.tweet['id']
    print('Reply to id ' + str(reply_id))
    if handle:
        reply = notifyUpdates(handle, message, reply_id)
        if reply:
            logger.info('Status notified with twitter')
            print('Status notified with twitter')
            return True
        else:
            logger.info('Failed to notify with twitter')
            print('Failed to notify with twitter')
    return False
