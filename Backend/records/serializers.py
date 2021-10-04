from rest_framework import serializers
from .models import *

class BasicDetailsMS(serializers.ModelSerializer):
    class Meta:
        model = BasicDetailsM
        fields = '__all__'

# class CategoryMS(serializers.ModelSerializer):
#     class Meta:
#         model = CategoryM
#         fields = '__all__'

# class SubCategoryMS(serializers.ModelSerializer):
#     class Meta:
#         model = SubCategoryM
#         fields = '__all__'

class DailyRecordsNameMS(serializers.ModelSerializer):
    class Meta:
        model = DailyRecordsNameM
        fields = ['recordname']

class DailyRecordsValueMS(serializers.ModelSerializer):
    # recordname  = DailyRecordsNameMS()

    class Meta:
        model = DailyRecordsValueM
        fields = '__all__'
