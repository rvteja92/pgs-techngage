# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0002_auto_20160513_1139'),
    ]

    operations = [
        migrations.CreateModel(
            name='Discussion',
            fields=[
                ('id', models.AutoField(serialize=False, auto_created=True, verbose_name='ID', primary_key=True)),
                ('message', models.CharField(max_length=1024)),
                ('issue', models.ForeignKey(to='core.Issue')),
            ],
        ),
    ]
