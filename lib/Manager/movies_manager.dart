import 'dart:convert';
import 'dart:developer';

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
      log(movies.toString());
      return movies;
    } else {
      throw Exception();
    }
  }
}
