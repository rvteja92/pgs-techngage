from django.db import models
from django.contrib.auth.models import User
from jsonfield import JSONField

class UserRole(models.Model):
    role_name   = models.CharField(max_length=50)

    def __str__(self):
        return self.role_name

class UserProfile(models.Model):
    user_id  = models.AutoField(primary_key=True)
    username = models.CharField(max_length=40)
    password = models.CharField(max_length=40)
    role = models.ForeignKey(UserRole)

    def __str__(self):
        return "[Username: " + self.username + ", Role: " + self.role_name + "]"

class Department(models.Model):
    dept_id = models.AutoField(primary_key=True)
    name    = models.CharField(max_length=40)
    description = models.CharField(max_length=255, blank=True)

    def __str__(self):
        return '[Name: ' + self.name + ', Description: ' + self.description +']'

class IssueStatus(models.Model):
    status = models.CharField(max_length=40)

class Issue(models.Model):
    issue_id    = models.AutoField(primary_key=True)
    status  = models.ForeignKey(IssueStatus)
    title   = models.CharField(max_length=40)
    content = models.TextField(max_length=1024)
    pic     = models.CharField(max_length=80, blank=True)
    latitude    = models.CharField(max_length=20, blank=True)
    longitude   = models.CharField(max_length=20, blank=True)
    geo_address     = JSONField(blank=True)
    category    = models.ForeignKey(Department, null=True)

    #TODO make user compulsory after implementing authenticaton
    user    = models.ForeignKey(UserProfile, blank=True)

    def __str__(self):
        return '[Title: '+ self.title + ', Content: ' + self.content + ', User: ' + self.user.username + ']'

class Discussion(models.Model):
    issue   = models.ForeignKey(Issue)
    message = models.CharField(max_length=1024)
