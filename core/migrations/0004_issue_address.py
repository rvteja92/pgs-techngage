# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models
import jsonfield.fields


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0003_discussion'),
    ]

    operations = [
        migrations.AddField(
            model_name='issue',
            name='address',
            field=jsonfield.fields.JSONField(blank=True),
        ),
    ]
