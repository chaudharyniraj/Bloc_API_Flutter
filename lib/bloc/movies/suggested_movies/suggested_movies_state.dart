import 'package:api_bloc_flutter/Model/Movies_model/suggested_movies/suggested_movies_model.dart';

abstract class SuggestedMoviesState {}

class InitialState extends SuggestedMoviesState {}

class SuggestedMoviesErrorState extends SuggestedMoviesState {
  String message;
  SuggestedMoviesErrorState({
    required this.message,
  });
}

class SuggestedMoviesLoadedState extends SuggestedMoviesState {
  List<SuggestedMoviesModel> suggestedMovies;
  SuggestedMoviesLoadedState({
    required this.suggestedMovies,
  });
}
