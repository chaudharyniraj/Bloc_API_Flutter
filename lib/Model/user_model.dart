// ignore_for_file: constant_identifier_names

class UserModel {
  late int userId;
  late String userFirstName;
  late String userLastName;
  late String userEmail;
  late String userAvatar;

  UserModel(
    this.userId,
    this.userFirstName,
    this.userLastName,
    this.userEmail,
    this.userAvatar,
  );

  static const String k_id = "id";
  static const String k_email = "email";
  static const String k_first_name = "first_name";
  static const String k_last_name = "last_name";
  static const String k_avatar = "avatar";

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json[k_id];
    userEmail = json[k_email];
    userFirstName = json[k_first_name];
    userLastName = json[k_last_name];
    userAvatar = json[k_avatar];
  }
}
