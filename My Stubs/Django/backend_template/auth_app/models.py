from django.db import models

# ---------------------------------------------------------------------------- #
#                         //! Create your models here.                         #
# ---------------------------------------------------------------------------- #


#@ User accounts
class UserAcc(models.Model):
    email = models.CharField(max_length=256,default="no value")
    number = models.IntegerField(default=1)
    password = models.CharField(max_length=50,default="no value") 

    class Meta:
        ordering = ['id']



#@ Admin Accounts
class AdminAcc(models.Model):
    email = models.CharField(max_length=256,default="no value")
    number = models.IntegerField(default=1)
    password = models.CharField(max_length=20,default="no value")  

    companyName = models.CharField(max_length=100,default="no value")  
    proofOfBiz_link = models.CharField(max_length=500,default="no value")  
    category = models.CharField(max_length=40,default="no value")  

    loc_firstLine = models.CharField(max_length=200,default="no value")  
    loc_secondLine = models.CharField(max_length=200,default="no value")  
    loc_pincode = models.IntegerField(default=1)

    isAgreementAccpeted = models.BooleanField(default=False)
    isAdminVerified = models.BooleanField(default=False) # to turn to true by superAdmin
    # maxQueueNumber = models.IntegerField(default=0)  # let each admin create only 5 queues


    class Meta:
        ordering = ['id']



