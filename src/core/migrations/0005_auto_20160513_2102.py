# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0004_issue_address'),
    ]

    operations = [
        migrations.RenameField(
            model_name='issue',
            old_name='address',
            new_name='geo_address',
        ),
    ]
