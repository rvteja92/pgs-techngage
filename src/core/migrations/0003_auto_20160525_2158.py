# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0002_issue_user'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='issue',
            options={'permissions': (('review_issue', 'Can change the status of issue'),)},
        ),
    ]
