class LoginModel {
  final String email;
  final String companyName;
  final String token;

  LoginModel.fromJson(Map<String, dynamic> parsedJson)
      : email = parsedJson['email'],
        companyName = parsedJson['company_name'],
        token = parsedJson['token'];
}
