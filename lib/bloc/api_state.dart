import 'package:api_bloc_flutter/Model/resource_model.dart';
import 'package:api_bloc_flutter/Model/user_model.dart';

abstract class ApiState {}

class InitialState extends ApiState {}

class ErrorState extends ApiState {
  String message;
  ErrorState({
    required this.message,
  });
}

class UserLoadedState extends ApiState {
  List<UserModel> userData;
  UserLoadedState({
    required this.userData,
  });
}

class ResourcesLoadedState extends ApiState {
  List<ResourceModel> resourceData;
  ResourcesLoadedState({
    required this.resourceData,
  });
}

class RegisterState extends ApiState {}

class ResponseState extends ApiState {
  String token;
  ResponseState({
    required this.token,
  });
}
