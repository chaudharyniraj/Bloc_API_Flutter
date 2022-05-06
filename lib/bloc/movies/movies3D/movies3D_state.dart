// ignore_for_file: file_names

import 'package:api_bloc_flutter/Model/Movies_model/movies_model.dart';

abstract class Movies3DState {}

class InitialState extends Movies3DState {}

class Movie3DErrorsState extends Movies3DState {
  String message;
  Movie3DErrorsState({
    required this.message,
  });
}

class Movies3DLoadedState extends Movies3DState {
  List<MoviesModel> moviesData3D;
  Movies3DLoadedState({
    required this.moviesData3D,
  });
}
