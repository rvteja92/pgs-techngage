import django, sys, os

sys.path.append('/home/ravi/projects/techngage')
os.environ['DJANGO_SETTINGS_MODULE'] = 'pgs.settings'
django.setup()

from .models import UserProfile
