import 'dart:convert';

/* -------------------------------------------------------------------------- */
/*                   //! Basic authentication credentials :                   */
/* -------------------------------------------------------------------------- */
String basicAuth_username = 'rushi.creates';
// String basicAuth_password = 'noq@123***';
String basicAuth_password = 'noq@1*2*3*';
String basicAuth = 'Basic ' +
    base64Encode(utf8.encode('$basicAuth_username:$basicAuth_password'));

class ApiLinks {
/* -------------------------------------------------------------------------- */
/*                                 //! Domain                                 */
/* -------------------------------------------------------------------------- */
  static const String domainUrl = 'https://no-q.herokuapp.com/';

/* -------------------------------------------------------------------------- */
/*                                //! Endpoints                               */
/* -------------------------------------------------------------------------- */

//@ AdminAcc

  static const String adminAcc_getRegexSearch =
      domainUrl + 'adminAcc/get_regex_AdminAcc/';
  static const String adminAcc_getRegex_byCompanyName_Search =
      domainUrl + 'adminAcc/get_regex_byCompanyName_AdminAcc/';

  static const String adminAcc_getAll = domainUrl + 'adminAcc/';
  static const String adminAcc_register = domainUrl + 'adminAcc/register/';
  static const String adminAcc_resetAccount =
      domainUrl + 'adminAcc/resetAccount/';
  static const String adminAcc_delete = domainUrl + 'adminAcc/delete/';

  static const String adminAcc_login = domainUrl + 'adminAcc/login_adminAcc/';
  static const String adminAcc_forgotPass =
      domainUrl + 'adminAcc/forgotPasword_adminAcc/';
  static const String adminAcc_verify_adminEmail_beforeRegister =
      domainUrl + 'adminAcc/verify_adminEmail_beforeRegister/';
}
