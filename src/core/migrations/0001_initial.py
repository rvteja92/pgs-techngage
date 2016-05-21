# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import jsonfield.fields


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Department',
            fields=[
                ('dept_id', models.AutoField(serialize=False, primary_key=True)),
                ('name', models.CharField(max_length=40)),
                ('description', models.CharField(blank=True, max_length=255)),
            ],
        ),
        migrations.CreateModel(
            name='Discussion',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True, verbose_name='ID', auto_created=True)),
                ('message', models.CharField(max_length=1024)),
            ],
        ),
        migrations.CreateModel(
            name='Issue',
            fields=[
                ('issue_id', models.AutoField(serialize=False, primary_key=True)),
                ('title', models.CharField(max_length=256)),
                ('content', models.TextField(max_length=1024)),
                ('pic', models.CharField(blank=True, max_length=80)),
                ('latitude', models.CharField(blank=True, max_length=20)),
                ('longitude', models.CharField(blank=True, max_length=20)),
                ('geo_address', jsonfield.fields.JSONField(blank=True)),
                ('category', models.ForeignKey(to='core.Department', null=True)),
            ],
        ),
        migrations.CreateModel(
            name='IssueStatus',
            fields=[
                ('id', models.AutoField(serialize=False, primary_key=True, verbose_name='ID', auto_created=True)),
                ('status', models.CharField(max_length=40)),
            ],
        ),
        migrations.AddField(
            model_name='issue',
            name='status',
            field=models.ForeignKey(to='core.IssueStatus'),
        ),
        migrations.AddField(
            model_name='discussion',
            name='issue',
            field=models.ForeignKey(to='core.Issue'),
        ),
    ]
