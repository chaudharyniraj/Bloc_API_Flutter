import 'dart:convert';

import 'package:api_bloc_flutter/Model/Movies_model/movies_list_model.dart';
import 'package:api_bloc_flutter/Utils/movies_base_url.dart';
import 'package:api_bloc_flutter/Utils/movies_server_utils.dart';
import 'package:http/http.dart';

import '../Model/Movies_model/movies_data_model.dart';

class MoviesManager extends MoviesBaseUrl {
  Future<List<MoviesListModel>> getMoviesList() async {
    String url =
        MoviesServerUtils().getApiUrl(moviesApiBaseUrl, "list_movies.json");
    Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map<String, dynamic> datas = jsonDecode(response.body);
      Map<String, dynamic> data = datas['data'];
      List<MoviesListModel> movies = MoviesDataModel.fromJson(data).movies;
      // log(movies.toString());
      return movies;
    } else {
      throw Exception();
    }
  }

  Future<Map<String, dynamic>> getMovieDetails(id) async {
    String url = MoviesServerUtils()
        .getApiUrl(moviesApiBaseUrl, "movie_details.json?movie_id=$id");
    Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map<String, dynamic> datas = jsonDecode(response.body);
      Map<String, dynamic> data = datas['data']['movie'];
      return data;
    } else {
      throw Exception();
    }
  }

  Future<List<MoviesListModel>> getMoviesList3D() async {
    String url = MoviesServerUtils()
        .getApiUrl(moviesApiBaseUrl, "list_movies.json?quality=3D");
    Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map<String, dynamic> datas = jsonDecode(response.body);
      Map<String, dynamic> data = datas['data'];
      // log(data['movies'].toString());
      List<MoviesListModel> movies = MoviesDataModel.fromJson(data).movies;
      return movies;
    } else {
      throw Exception();
    }
  }
}
