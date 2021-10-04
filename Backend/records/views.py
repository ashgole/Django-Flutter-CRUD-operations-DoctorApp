from django.shortcuts import render

from rest_framework import views,response,status,viewsets,permissions
from . import models as RecordsModel
from . import serializers as RecordsModelSerializer
from django.shortcuts import get_object_or_404
from rest_framework import authentication, permissions


class BasicDetailsC(viewsets.ViewSet):
    permission_classes = (permissions.IsAuthenticated,)
    serializer_class=RecordsModelSerializer.BasicDetailsMS
    queryset=RecordsModel.BasicDetailsM.objects.all()

    def list(self,request):
        print(request.user)
        serializer=self.serializer_class(self.queryset,many=True)
        return response.Response(serializer.data)

    def retrieve(self,request,pk=None):
        blog=get_object_or_404(self.queryset,user_id=pk)
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
        blog=get_object_or_404(self.queryset,user_id=pk)
        data=request.data
        serializer=self.serializer_class(blog,data)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return response.Response(serializer.data)

    def partial_update(self,request,pk=None):
        blog=get_object_or_404(self.queryset,user_id=pk)
        data=request.data
        serializer=self.serializer_class(blog,data,partial=True)
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return response.Response(serializer.data,status=200)

    def destroy(self,request,pk=None):
        instances=get_object_or_404(self.queryset,pk=pk)
        instances.delete()
        return response.Response(status=200)

class DailyRecordsC(viewsets.ViewSet):
    permission_classes = (permissions.IsAuthenticated,)
    serializer_class=RecordsModelSerializer.DailyRecordsValueMS
    queryset=RecordsModel.DailyRecordsValueM.objects.all()

    def list(self,request):
        print(request.user)
        serializer=self.serializer_class(self.queryset,many=True)
        return response.Response(serializer.data)

    def retrieve(self,request,pk=None,):
        blog=RecordsModel.DailyRecordsValueM.objects.filter(user_id=pk)
        print('*'*20)
        print(blog)
        return response.Response(list(blog.values()))

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
        instances=RecordsModel.DailyRecordsValueM.objects.filter(user_id=pk)
        instances.delete()
        return response.Response(status=200)
