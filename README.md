django-rest-backbone-skeleton
=============================

Skeleton for a hooked-up django + backbone.js app, with django rest framework

Starting from `min` branch

`https://github.com/chiller/django-rest-backbone-skeleton.git`

`pip install -r skeleton/requirements.pip`

This going to take a little while.

`python manage.py syncdb`

Add a simple model:

`from django.db import models

 class Todo(models.Model):
     description = models.TextField()`
     
