from rest_framework import serializers
from auth_app.models import *




class UserAccSerializer(serializers.ModelSerializer):
    class Meta:
        model = UserAcc
        fields = '__all__'


class AdminAccSerializer(serializers.ModelSerializer):
    class Meta:
        model = AdminAcc
        fields = '__all__'

