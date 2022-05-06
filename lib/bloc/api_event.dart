// ignore_for_file: must_be_immutable

import 'package:meta/meta.dart';

@immutable
abstract class ApiEvent {}

class UserEvent extends ApiEvent {}

class ResourceEvent extends ApiEvent {}

class RegisterEvent extends ApiEvent {
  String email;
  String password;
  RegisterEvent({
    required this.email,
    required this.password,
  });
}

class ResponseEvent extends ApiEvent {}

class MoviesEvent extends ApiEvent {}

class MoviesEvent3D extends ApiEvent {}

class SuggestedMoviesEvent extends ApiEvent {}
