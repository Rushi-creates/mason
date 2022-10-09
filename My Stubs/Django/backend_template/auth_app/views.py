# from appNameFolder.fileName import func/className
from rest_framework.decorators import api_view
from rest_framework.response import Response

from auth_app.models import UserAcc,AdminAcc
from auth_app.myPaginations import MyCustomPagination
from auth_app.serializers import  UserAccSerializer,AdminAccSerializer
from .filters import UserAccFilters,AdminAccFilters
from auth_app.credentials import my_secret_superString


import random
from django.core.mail import EmailMessage
from django.conf import settings



#! Create your views here.


# ---------------------------------------------------------------------------- #
#                                //! superadmin                                #
# ---------------------------------------------------------------------------- #

@api_view(['POST'])
def checkSuperAdmin(request):

    superString =request.data.get('superString')

    if superString == my_secret_superString:
        return Response(True)
    else : 
        return Response(False)



# ---------------------------------------------------------------------------- #
#                                  //! UserAcc                                 #
# ---------------------------------------------------------------------------- #



@api_view(['GET'])
def getAll_UserAcc(request):
    paginator = MyCustomPagination()
    userObj = UserAcc.objects.all()
    filteredData = UserAccFilters(request.GET, queryset = userObj).qs # gives filter search options from filters.py
    try :
        context = paginator.paginate_queryset(filteredData, request)
        serializer = UserAccSerializer(context,many=True)
        return Response(serializer.data)
    except:
        return Response([])



@api_view(['GET'])
def getSingle_UserAcc(request,id):
    userObj = UserAcc.objects.get(id=id)
    serializer = UserAccSerializer(instance=userObj)
    return Response(serializer.data)


# call directly after otp is verified ( from frontend send email , pass)
@api_view(['POST'])
def register_UserAcc(request):
    userObj = UserAccSerializer(data=request.data)
    print(userObj)
    if userObj.is_valid():
        print('saved')
        userObj.save()
    return Response(userObj.data)


@api_view(['PUT'])
def update_UserAcc(request,id):
    userObj = UserAcc.objects.get(id=id)
    serializers = UserAccSerializer(instance=userObj, data=request.data)
    if serializers.is_valid():
        serializers.save()
    return Response(serializers.data)


@api_view(['DELETE' , 'GET'])
def delete_UserAcc(request,id):
    userObj = UserAcc.objects.get(id=id)
    userObj.delete()
    return Response(f"Deleted {id}")





# use before register button
@api_view(['POST'])
def verify_UserEmail_beforeRegister(request):


    myemail =request.data.get('email')
    mypass = request.data.get('password')

    # if acc exists, ask him to login
    if UserAcc.objects.filter(email=myemail).exists() and UserAcc.objects.filter(password= mypass).exists() :
        return Response('Account already exists, try to login') 

    # send otp, before registering 
    else:
        otp=random.randint(1000,9999) 
        print (otp)

        emailBody = 'Your OTP is : '+ str(otp) +'.\n'
        'if you think this was sent to you by mistake , please ignore this email'


        #note first send this same otp to some sms paid service with twillio  or to EMAIL (twillio  OR email code here)
        email = EmailMessage(
            'Verify your email :', # subject     
            emailBody,        # body 
            settings.EMAIL_HOST_USER,  # sender's email from settigs.py 
            [myemail],    # whom to send email 
            )
        email.fail_silently=False
        email.send()                 # actually send email


        # then send same otp to client
        return Response(otp)




# use before forgot password(update acc) button
@api_view(['POST'])
def forgotPasword_userAcc(request):

    

    myemail =request.data.get('email')


    # if account exists in DB, then only he can reset password
    if UserAcc.objects.filter(email=myemail).exists() :
        otp=random.randint(1000,9999) 
        print (otp)

        emailBody = 'Your OTP to reset password is '+ str(otp) +'.\n'
        'if you think this was sent to you by mistake , please ignore this email'

        # note first send this same otp to some sms paid service with twillio  or to EMAIL
        # twillio  OR email code here
        email = EmailMessage(
            'Verify your email :',                   # subject test here 
            emailBody,        # body text here 
            settings.EMAIL_HOST_USER,    # sender's email from settigs.py 
            [myemail],    # whom to send email 
            )
        email.fail_silently=False  # will sent us email notifying in case of any error
        email.send()                 # actually send email


        # then send same otp to client
        return Response(otp)

        # if email doesnt exist in DB , you cannot reset password
    else:
        return Response("This account email doesn't exists, please enter right email, or create account first")  




@api_view(['POST'])
def login_UserAcc(request):

    # using get() method of py dict(to access value, by using the key), and store it in var
    myemail =request.data.get('email')
    mypass = request.data.get('password')

    # if email,pass exists in DB, then return full userAccObj
    if UserAcc.objects.filter(email=myemail).exists() and UserAcc.objects.filter(password= mypass).exists() : 
        userObj = UserAcc.objects.get(email=myemail, password =mypass)
        serializer = UserAccSerializer(instance=userObj)
        return Response(serializer.data)

    # if email and pass wrong/doesnt exists in DB 
    else:
        return Response("This account doesn't exist, enter correct details or try to register.")  




# ---------------------------------------------------------------------------- #
#                                 //! AdminAcc                                 #
# ---------------------------------------------------------------------------- #



@api_view(['GET'])
def getAll_AdminAcc(request):
    paginator = MyCustomPagination()
    userObj = AdminAcc.objects.all()
    filteredData = AdminAccFilters(request.GET, queryset = userObj).qs # gives filter search options from filters.py
    try :
        context = paginator.paginate_queryset(filteredData, request)
        serializer = AdminAccSerializer(context,many=True)
        return Response(serializer.data)
    except:
        return Response([])




#! let user search adminsAcc by emails  in search field 
@api_view(['GET'])
def get_regex_AdminAcc(request):

    paginator = MyCustomPagination()
    filteredData = AdminAcc.objects.filter(email__icontains=request.GET['email'])
    try :
        context = paginator.paginate_queryset(filteredData, request)
        serializer = AdminAccSerializer(context,many=True)
        return Response(serializer.data)
    except:
        return Response([])

#! let user search adminsAcc by emails  in search field 
@api_view(['GET'])
def get_regex_byCompanyName_AdminAcc(request):

    paginator = MyCustomPagination()
    filteredData = AdminAcc.objects.filter(companyName__icontains=request.GET['companyName'])
    try :
        context = paginator.paginate_queryset(filteredData, request)
        serializer = AdminAccSerializer(context,many=True)
        return Response(serializer.data)
    except:
        return Response([])




# #! let user search adminsAcc by emails  in search field 
# @api_view(['POST'])
# def get_regex_AdminAcc(request):

#     mySearch =request.data.get('searchData')

#     paginator = MyCustomPagination()
#     filteredData = AdminAcc.objects.filter(email__icontains=mySearch)
#     print(filteredData)
#     try :
#         context = paginator.paginate_queryset(filteredData, request)
#         serializer = AdminAccSerializer(context,many=True)
#         return Response(serializer.data)
#     except:
#         return Response([])



@api_view(['GET'])
def getSingle_AdminAcc(request,id):
    userObj = AdminAcc.objects.get(id=id)
    serializer = AdminAccSerializer(instance=userObj)
    return Response(serializer.data)


# call directly after otp is verified ( from frontend send email , pass)
@api_view(['POST'])
def register_AdminAcc(request):
    userObj = AdminAccSerializer(data=request.data)
    if userObj.is_valid():
        userObj.save()
    return Response(userObj.data)


@api_view(['PUT'])
def update_AdminAcc(request,id):
    userObj = AdminAcc.objects.get(id=id)
    serializers = AdminAccSerializer(instance=userObj, data=request.data)
    if serializers.is_valid():
        serializers.save()
    return Response(serializers.data)


@api_view(['DELETE' , 'GET'])
def delete_AdminAcc(request,id):
    userObj = AdminAcc.objects.get(id=id)
    userObj.delete()
    return Response(f"Deleted {id}")





# use before register button
@api_view(['POST'])
def verify_AdminEmail_beforeRegister(request):

  
    myemail =request.data.get('email')
    mypass = request.data.get('password')

    # if acc exisits, ask him to login
    if AdminAcc.objects.filter(email=myemail).exists() and AdminAcc.objects.filter(password= mypass).exists() :
        return Response('Account already exists, try to login') 

    # send otp, before registering 
    else:
        otp=random.randint(1000,9999) 
        print (otp)

        emailBody = 'Your OTP is : '+ str(otp) +'.\n'
        'if you think this was sent to you by mistake , please ignore this email'


        #note first send this same otp to some sms paid service with twillio  or to EMAIL (twillio  OR email code here)
        email = EmailMessage(
            'Verify your email :', # subject     
            emailBody,        # body 
            settings.EMAIL_HOST_USER,  # sender's email from settigs.py 
            [myemail],    # whom to send email 
            )
        email.fail_silently=False
        email.send()                 # actually send email


        # then send same otp to client
        return Response(otp)




# use before forgot password(update acc) button
@api_view(['POST'])
def forgotPasword_AdminAcc(request):

    emailBody = 'Your OTP to reset password is '+ str(otp) +'.\n'
    'if you think this was sent to you by mistake , please ignore this email'

    myemail =request.data.get('email')


    # if account exists in DB, then only he can reset password
    if AdminAcc.objects.filter(email=myemail).exists() :
        otp=random.randint(1000,9999) 
        print (otp)

        # note first send this same otp to some sms paid service with twillio  or to EMAIL
        # twillio  OR email code here
        email = EmailMessage(
            'Verify your email :',                   # subject test here 
            emailBody,        # body text here 
            settings.EMAIL_HOST_USER,    # sender's email from settigs.py 
            [myemail],    # whom to send email 
            )
        email.fail_silently=False  # will sent us email notifying in case of any error
        email.send()                 # actually send email


        # then send same otp to client
        return Response(otp)

        # if email doesnt exist in DB , you cannot reset password
    else:
        return Response("This account email doesn't exists, please enter right email, or create account first")  




@api_view(['POST'])
def login_AdminAcc(request):

    # using get() method of py dict(to access value, by using the key), and store it in var
    myemail =request.data.get('email')
    mypass = request.data.get('password')

    # if email,pass exists in DB, then return full userAccObj
    if AdminAcc.objects.filter(email=myemail).exists() and AdminAcc.objects.filter(password= mypass).exists() : 
        userObj = AdminAcc.objects.get(email=myemail, password =mypass)
        serializer = AdminAccSerializer(instance=userObj)
        return Response(serializer.data)

    # if email and pass wrong/doesnt exists in DB 
    else:
        return Response("This account doesn't exist, enter correct details or try to register")  




