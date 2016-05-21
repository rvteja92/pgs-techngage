from core.models import Issue
from rest_framework import serializers


class IssueSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Issue
        fields = ('issue_id', 'title', 'content')
