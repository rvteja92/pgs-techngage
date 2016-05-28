from django.db import models
from django.conf import settings
from jsonfield import JSONField


class Department(models.Model):
    dept_id = models.AutoField(primary_key=True)
    name    = models.CharField(max_length=40)
    description = models.CharField(max_length=255, blank=True)

    def __str__(self):
        return '[Name: ' + self.name + ', Description: ' + self.description +']'

class IssueStatus(models.Model):
    status = models.CharField(max_length=40)

class Issue(models.Model):

    class Meta:
        permissions = (
            ('review_issue', 'Can change the status of issue'),
        )

    issue_id    = models.AutoField(primary_key=True)
    status  = models.ForeignKey(IssueStatus)
    title   = models.CharField(max_length=256)
    content = models.TextField(max_length=1024)
    pic     = models.CharField(max_length=80, blank=True)
    latitude    = models.CharField(max_length=20, blank=True)
    longitude   = models.CharField(max_length=20, blank=True)
    geo_address     = JSONField(blank=True)
    twitter_handle  = models.CharField(max_length=20, blank=True)
    tweet   = JSONField(blank=True)
    category    = models.ForeignKey(Department, null=True)

    """
    TODO Make user compulsory - once user models are generated from tweets
    """
    user    = models.ForeignKey(settings.AUTH_USER_MODEL, blank=True, null=True)

    def __str__(self):
        return '[Title: '+ self.title + ', Content: ' + self.content + ', User: ' + self.user.username + ']'

class Discussion(models.Model):
    issue   = models.ForeignKey(Issue)
    message = models.CharField(max_length=1024)
