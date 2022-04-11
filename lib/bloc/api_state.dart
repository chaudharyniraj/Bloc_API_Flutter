import 'package:api_bloc_flutter/Model/user_model.dart';

abstract class ApiState {}

class InitialState extends ApiState {}

class UserErrorState extends ApiState {
  String message;
  UserErrorState({
    required this.message,
  });
}

class UserLoadedState extends ApiState {
  List<UserModel> userData;
  UserLoadedState({
    required this.userData,
  });
}
