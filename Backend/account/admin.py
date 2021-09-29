from django.contrib import admin
from django.contrib.auth.models import User
from .models import *

class AccountMClass(admin.ModelAdmin):
    list_display = ['id','username','first_name','last_name','email']

admin.site.unregister(User)
admin.site.register(User,AccountMClass)
