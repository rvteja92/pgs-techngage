# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Issue',
            fields=[
                ('issue_id', models.AutoField(serialize=False, primary_key=True)),
                ('title', models.CharField(max_length=40)),
                ('content', models.TextField(max_length=1024)),
                ('pic', models.CharField(max_length=80, blank=True)),
                ('latitude', models.CharField(max_length=10, blank=True)),
                ('longitude', models.CharField(max_length=10, blank=True)),
            ],
        ),
        migrations.CreateModel(
            name='IssueStatus',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, serialize=False, primary_key=True)),
                ('status', models.CharField(max_length=40)),
            ],
        ),
        migrations.CreateModel(
            name='UserProfile',
            fields=[
                ('user_id', models.AutoField(serialize=False, primary_key=True)),
                ('username', models.CharField(max_length=40)),
                ('password', models.CharField(max_length=40)),
            ],
        ),
        migrations.CreateModel(
            name='UserRole',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, serialize=False, primary_key=True)),
                ('role_name', models.CharField(max_length=50)),
            ],
        ),
        migrations.AddField(
            model_name='userprofile',
            name='role',
            field=models.ForeignKey(to='core.UserRole'),
        ),
        migrations.AddField(
            model_name='issue',
            name='status',
            field=models.ForeignKey(to='core.IssueStatus'),
        ),
        migrations.AddField(
            model_name='issue',
            name='user',
            field=models.ForeignKey(to='core.UserProfile', blank=True),
        ),
    ]
