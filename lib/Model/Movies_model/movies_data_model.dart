// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:api_bloc_flutter/Model/Movies_model/movies_model.dart';

class MoviesDataModel {
  late int movie_count;
  late int limit;
  late int page_number;
  late List<MoviesModel> movies;

  MoviesDataModel({
    required this.movie_count,
    required this.limit,
    required this.page_number,
    required this.movies,
  });

  static const String k_movie_count = "movie_count";
  static const String k_limit = "limit";
  static const String k_page_number = "page_number";
  static const String k_movies = "movies";

  MoviesDataModel.fromJson(Map<String, dynamic> json) {
    movie_count = json[k_movie_count];
    limit = json[k_limit];
    page_number = json[k_page_number];
    if (json[k_movies] != null) {
      movies = <MoviesModel>[];
      json[k_movies].forEach((value) {
        movies.add(MoviesModel.fromJson(value));
      });
    }
  }
}
