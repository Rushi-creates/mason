import django_filters
from auth_app.models import * 

class UserAccFilters(django_filters.FilterSet):
    class Meta: 
        model = UserAcc
        fields = '__all__'

class AdminAccFilters(django_filters.FilterSet):
    class Meta: 
        model = AdminAcc
        fields = '__all__'
