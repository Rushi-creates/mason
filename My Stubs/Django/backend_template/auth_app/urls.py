from django.urls import path
from . import views

urlpatterns = [

    #! superadmin paths
    path('sa/checkSuperAdmin/', views.checkSuperAdmin),




    #! UserAcc paths
    path('userAcc/', views.getAll_UserAcc),
    path('userAcc/<int:id>/', views.getSingle_UserAcc),
    path('userAcc/register/', views.register_UserAcc),  #add
    path('userAcc/resetAccount/<int:id>/', views.update_UserAcc),  #update , (use for reset password)
    path('userAcc/delete/<int:id>/', views.delete_UserAcc),    #delete

    path('userAcc/login_userAcc/', views.login_UserAcc),
    path('userAcc/forgotPasword_userAcc/', views.forgotPasword_userAcc),
    path('userAcc/verify_userEmail_beforeRegister/', views.verify_UserEmail_beforeRegister),
    

    #! AdminAcc paths
    path('adminAcc/get_regex_AdminAcc/', views.get_regex_AdminAcc),
    path('adminAcc/get_regex_byCompanyName_AdminAcc/', views.get_regex_byCompanyName_AdminAcc),
    
    path('adminAcc/', views.getAll_AdminAcc),
    path('adminAcc/<int:id>/', views.getSingle_AdminAcc),
    path('adminAcc/register/', views.register_AdminAcc),  #add
    path('adminAcc/resetAccount/<int:id>/', views.update_AdminAcc),  #update , (use for reset password)
    path('adminAcc/delete/<int:id>/', views.delete_AdminAcc),    #delete

    path('adminAcc/login_adminAcc/', views.login_AdminAcc),
    path('adminAcc/forgotPasword_adminAcc/', views.forgotPasword_AdminAcc),
    path('adminAcc/verify_adminEmail_beforeRegister/', views.verify_AdminEmail_beforeRegister),
    
   

]










