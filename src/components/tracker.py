import django, sys, os

sys.path.append('/home/ravi/projects/techngage/src')
os.environ['DJANGO_SETTINGS_MODULE'] = 'pgs.settings'
django.setup()

#print(sys.modules[__name__])
#print(os.path.dirname(sys.modules[__name__]))
print(os.path.dirname(os.path.relpath(__file__)))
