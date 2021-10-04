from django.contrib import admin
from .models import *

class BasicDetailsMClass(admin.ModelAdmin):
    list_display = ['id','user','covid_test_done','covid_test_type','covid_test_report']

admin.site.register(BasicDetailsM,BasicDetailsMClass)

class CategoryMClass(admin.ModelAdmin):
    list_display = ['user','cname']

class DailyRecordsNameMA(admin.ModelAdmin):
    list_display = ['id','recordname']

admin.site.register(DailyRecordsNameM,DailyRecordsNameMA)

class DailyRecordsValueMA(admin.ModelAdmin):
    list_display = ['user','recordname','value','datetime']

admin.site.register(DailyRecordsValueM,DailyRecordsValueMA)
