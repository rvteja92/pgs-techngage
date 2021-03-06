from django.conf.urls import url, include

from . import views, grievance


urlpatterns = [
    url(r'^$', grievance.dashboard, name='dashboard_home'),
#     url(r'^register', views.register, name='register'),
    url(r'^grievance/add', grievance.add, name='add'),
    url(r'^grievance/all', grievance.allIssues, name='all'),
    url(r'^grievance/view/(?P<grievance_id>[0-9]+)', grievance.view, name='view'),
    url(r'^grievance/review/(?P<grievance_id>[0-9]+)', grievance.review, name='review'),
    url(r'^grievance/track/(?P<grievance_id>[0-9]+)', grievance.track, name='track'),
    url(r'^department/all', grievance.departments, name='dept_all'),
    url(r'^department/save', grievance.saveDepartment, name='dept_save'),
    url(r'^dashboard', grievance.dashboard, name='dashboard_main'),

]
