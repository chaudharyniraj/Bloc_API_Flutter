import 'package:api_bloc_flutter/Model/Movies_model/movies_model.dart';

abstract class MoviesListState {}

class InitialState extends MoviesListState {}

class MovieListErrorsState extends MoviesListState {
  String message;
  MovieListErrorsState({
    required this.message,
  });
}

class MoviesLoadedState extends MoviesListState {
  List<MoviesModel> moviesData;
  MoviesLoadedState({
    required this.moviesData,
  });
}
