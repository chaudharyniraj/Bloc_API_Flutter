import 'package:api_bloc_flutter/Model/Movies_model/movies_list_model.dart';
import 'package:api_bloc_flutter/Model/Movies_model/suggested_movies/suggested_movies_model.dart';
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

class MoviesLoadedState extends ApiState {
  List<MoviesListModel> moviesData;
  MoviesLoadedState({
    required this.moviesData,
  });
}

class Movies3DLoadedState extends ApiState {
  List<MoviesListModel> moviesData3D;
  Movies3DLoadedState({
    required this.moviesData3D,
  });
}

class SuggestedMoviesLoadedState extends ApiState {
  List<SuggestedMoviesModel> suggestedMoviesData3;
  SuggestedMoviesLoadedState({
    required this.suggestedMoviesData3,
  });
}
