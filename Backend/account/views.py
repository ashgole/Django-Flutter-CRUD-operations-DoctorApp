from django.shortcuts import render

# Create your views here.
from rest_framework import response,status,viewsets
from django.contrib.auth.models import User
from . import serializers as UserModelSerializer
from django.shortcuts import get_object_or_404
from rest_framework.authtoken.views import ObtainAuthToken
from rest_framework.settings import api_settings

from rest_framework import authentication, permissions

class UsersC(viewsets.ViewSet):
    permission_classes = (permissions.IsAuthenticated,)
    serializer_class=UserModelSerializer.ProfileMS
    queryset=User.objects.all()

    def list(self,request):
        print(request.user)
        serializer=self.serializer_class(self.queryset,many=True)
        return response.Response(serializer.data)

    def retrieve(self,request,pk=None):
        blog=get_object_or_404(self.queryset,pk=pk)
        print('*'*20)
        print(blog)
        serializer=self.serializer_class(blog)
        return response.Response(serializer.data)

    def create(self,request):
        data=request.data
        serializer=self.serializer_class(data=data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return response.Response(serializer.data)

    def update(self,request,pk=None):

        blog=get_object_or_404(self.queryset,pk=pk)
        data=request.data
        serializer=self.serializer_class(blog,data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return response.Response(serializer.data)

    def partial_update(self,request,pk=None):
        blog=get_object_or_404(self.queryset,pk=pk)
        data=request.data
        serializer=self.serializer_class(blog,data,partial=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return response.Response(serializer.data,status=200)

    def destroy(self,request,pk=None):
        instances=get_object_or_404(self.queryset,pk=pk)
        instances.delete()
        return response.Response(status=200)

# this is for browsable login API
class UserLoginView(ObtainAuthToken):
    renderer_classes=api_settings.DEFAULT_RENDERER_CLASSES