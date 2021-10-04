from django.db import models
from django.contrib.auth.models import User

class BasicDetailsM(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    date_of_diagnosis = models.DateTimeField(auto_now=True)
    admitted_in_hospital = models.DateTimeField(auto_now=True)
    covid_test_done = models.CharField(max_length=50)
    covid_test_type = models.CharField(max_length=50)
    covid_test_report = models.CharField(max_length=50)

    def __str__(self):
        return str(self.user)

# class CategoryM(models.Model):
#     user = models.ForeignKey(User, on_delete=models.CASCADE)
#     cname = models.CharField(max_length=255)

#     def __str__(self):
#         return (self.cname)

# class SubCategoryM(models.Model):
#     user = models.ForeignKey(User, on_delete=models.CASCADE)
#     cname = models.ForeignKey(CategoryM,on_delete=models.CASCADE)
#     sname = models.CharField(max_length=255)
#     value = models.CharField(max_length=255)
#     datetime=models.DateTimeField(auto_now=True)

#     def __str__(self):
#         return str(self.sname)

class DailyRecordsNameM(models.Model):
    recordname = models.CharField(max_length=255)
    def __str__(self):
        return str(self.recordname)

class DailyRecordsValueM(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE,related_name="user")
    recordname = models.ForeignKey(DailyRecordsNameM, on_delete=models.CASCADE,related_name="record")
    value = models.IntegerField()
    datetime = models.DateTimeField(auto_now=True)

    def __str__(self):
        return str(self.user)
