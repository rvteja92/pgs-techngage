# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0006_department'),
    ]

    operations = [
        migrations.AddField(
            model_name='issue',
            name='category',
            field=models.ForeignKey(to='core.Department', null=True),
        ),
    ]
