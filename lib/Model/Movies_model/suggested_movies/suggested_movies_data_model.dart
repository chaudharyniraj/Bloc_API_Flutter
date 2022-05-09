// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:api_bloc_flutter/Model/Movies_model/suggested_movies/suggested_movies_model.dart';

class SuggestedMoviesHeaderModel {
  late int movie_count;
  late List<SuggestedMoviesModel> movies;

  SuggestedMoviesHeaderModel({
    required this.movie_count,
    required this.movies,
  });

  static const String k_movie_count = "movie_count";
  static const String k_movies = "movies";

  SuggestedMoviesHeaderModel.fromJson(Map<String, dynamic> json) {
    movie_count = json[k_movie_count];
    if (json[k_movies] != null) {
      movies = <SuggestedMoviesModel>[];
      json[k_movies].forEach((value) {
        movies.add(SuggestedMoviesModel.fromJson(value));
      });
    }
  }
}
