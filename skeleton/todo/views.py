from models import Todo
from rest_framework import generics
from rest_framework.decorators import api_view
from rest_framework.mixins import DestroyModelMixin
from rest_framework.reverse import reverse
from rest_framework.response import Response
from serializers import TodoSerializer

class TodoView(generics.ListCreateAPIView):
    model = Todo
    serializer_class = TodoSerializer

class TodoDetailView(generics.RetrieveUpdateDestroyAPIView):
    model = Todo
    serializer_class = TodoSerializer