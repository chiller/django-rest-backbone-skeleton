from django.db import models

# Create your models here.
class TodoList(models.Model):
    title = models.CharField(max_length=100, default="")
    created = models.DateTimeField(auto_now_add=True)


class Todo(models.Model):
    tlist = models.ForeignKey(TodoList)
    description = models.TextField()