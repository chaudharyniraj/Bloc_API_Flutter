// ignore_for_file: must_be_immutable

import 'package:api_bloc_flutter/Model/Movies_model/movies_list_model.dart';
import 'package:meta/meta.dart';

@immutable
abstract class MoviesState {}

class InitialState extends MoviesState {}

class ErrorsState extends MoviesState {
  String message;
  ErrorsState({
    required this.message,
  });
}

class MovieDetailsState extends MoviesState {
  MoviesListModel movieDetails;
  MovieDetailsState({
    required this.movieDetails,
  });
}
