from rest_framework import serializers
from models import  Todo

class TodoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Todo

    def restore_fields(self, data, files):
        deserialized = super(TodoSerializer, self).restore_fields(data, files)
        #TODO: whatever you feel like doing before it gets saved
        return deserialized



