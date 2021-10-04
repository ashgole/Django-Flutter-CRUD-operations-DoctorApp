from records import views
from rest_framework import routers
from django.urls import path
from django.conf.urls import include

router =routers.DefaultRouter()

router.register('besicdetails',views.BasicDetailsC ,basename='BasicDetailsM')
router.register('dailyrecords',views.DailyRecordsC ,basename='DailyRecordsC')

urlpatterns = [
    path('',include(router.urls)),
]