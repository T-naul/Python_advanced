# Generated by Django 4.1.1 on 2022-09-26 13:03

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Person',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=50)),
                ('age', models.IntegerField()),
                ('address', models.TextField()),
                ('mobile_number', models.CharField(max_length=10)),
            ],
        ),
    ]