from account import views
from rest_framework import routers
from django.urls import path
from django.conf.urls import include
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView

router =routers.DefaultRouter()
router.register('profile',views.UsersC ,basename='profile')


urlpatterns = [
    path('',include(router.urls)),
]