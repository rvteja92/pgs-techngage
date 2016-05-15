# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='issue',
            name='latitude',
            field=models.CharField(blank=True, max_length=20),
        ),
        migrations.AlterField(
            model_name='issue',
            name='longitude',
            field=models.CharField(blank=True, max_length=20),
        ),
    ]