from django.conf.urls import url, include
from accounts import views

urlpatterns = [
    url(r'^register/', views.userregister, name='userregistration'),
    url(r'^login/', views.userlogin, name='userlogin'),
    url(r'^logout/', views.userlogout, name='logout'),
]
