# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0007_issue_category'),
    ]

    operations = [
        migrations.AlterField(
            model_name='issue',
            name='title',
            field=models.CharField(max_length=256),
        ),
    ]
