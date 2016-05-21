from __future__ import absolute_import

from .celeryapp import app
from .geo.googlegeo import getAddressObject
import os, sys, django
import logging


project_path = os.path.dirname(os.path.abspath(__file__)) + '/../'

sys.path.append(project_path)
os.environ['DJANGO_SETTINGS_MODULE'] = 'pgs.settings'
django.setup()

from core.models import Issue

@app.task
def getaddressfor(grievance_id):
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
                logging.error('Address determined but could not save object ' + str(e))
                raise Exception()
            
    except Exception as e:
        raise Exception()
    
    return False
        