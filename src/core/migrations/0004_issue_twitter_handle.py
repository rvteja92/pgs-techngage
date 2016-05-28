# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0003_auto_20160525_2158'),
    ]

    operations = [
        migrations.AddField(
            model_name='issue',
            name='twitter_handle',
            field=models.CharField(blank=True, max_length=20),
        ),
    ]
