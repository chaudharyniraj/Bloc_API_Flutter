// ignore_for_file: constant_identifier_names

class UserRegisterModel {
  late String email;
  late String password;

  static const String k_email = "email";
  static const String k_password = "password";

  Map<String, dynamic> toMap() => {k_email: email, k_password: password};
}
