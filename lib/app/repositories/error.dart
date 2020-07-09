import 'package:flutter/cupertino.dart';

mixin Error {
  Map<String, dynamic> errorCodes = {
    'ERROR_INVALID_EMAIL': 'Invalid email address',
    'ERROR_WRONG_PASSWORD': 'Invalid Password',
    'ERROR_USER_NOT_FOUND': 'Corresponding user not found',
    'ERROR_USER_DISABLED': 'User account has been disabled',
    'ERROR_TOO_MANY_REQUESTS': 'Too many login attempt',
    'ERROR_OPERATION_NOT_ALLOWED': 'Email & Password accounts are not enabled'
  };

  String errorLog({@required String code}) {
    return errorCodes[code];
  }
}
