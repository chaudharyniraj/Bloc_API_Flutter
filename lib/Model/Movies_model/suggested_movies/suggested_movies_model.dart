// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:api_bloc_flutter/Model/Movies_model/torrents_model.dart';

class SuggestedMoviesModel {
  int? id;
  String? url;
  String? imdb_code;
  String? title;
  String? title_english;
  String? title_long;
  String? slug;
  int? year;
  double? rating;
  int? runtime;
  List? genres;
  String? summary;
  String? description_full;
  String? synopsis;
  String? yt_trailer_code;
  String? language;
  String? mpa_rating;
  late String background_image;
  late String background_image_original;
  late String small_cover_image;
  late String medium_cover_image;
  String? state;
  late List<TorrentModel> torrents;
  String? date_uploaded;
  int? date_uploaded_unix;

  SuggestedMoviesModel({
    this.id,
    this.url,
    this.imdb_code,
    this.title,
    this.title_english,
    this.title_long,
    this.slug,
    this.year,
    this.rating,
    this.runtime,
    this.genres,
    this.summary,
    this.description_full,
    this.synopsis,
    this.yt_trailer_code,
    this.language,
    this.mpa_rating,
    required this.background_image,
    required this.background_image_original,
    required this.small_cover_image,
    required this.medium_cover_image,
    this.state,
    required this.torrents,
    this.date_uploaded,
    this.date_uploaded_unix,
  });

  static const String k_id = "id";
  static const String k_url = "url";
  static const String k_imdb_code = "imdb_code";
  static const String k_title = "title";
  static const String k_title_english = "title_english";
  static const String k_title_long = "title_long";
  static const String k_slug = "slug";
  static const String k_year = "year";
  static const String k_rating = "rating";
  static const String k_runtime = "runtime";
  static const String k_genres = "genres";
  static const String k_summary = "summary";
  static const String k_description_full = "description_full";
  static const String k_synopsis = "synopsis";
  static const String k_yt_trailer_code = "yt_trailer_code";
  static const String k_language = "language";
  static const String k_mpa_rating = "mpa_rating";
  static const String k_background_image = "background_image";
  static const String k_background_image_original = "background_image_original";
  static const String k_small_cover_image = "small_cover_image";
  static const String k_medium_cover_image = "medium_cover_image";
  static const String k_state = "state";
  static const String k_torrents = "torrents";
  static const String k_date_uploaded = "date_uploaded";
  static const String k_date_uploaded_unix = "date_uploaded_unix";

  SuggestedMoviesModel.fromJson(Map<String, dynamic> json) {
    id = json[k_id];
    url = json[k_url];
    imdb_code = json[k_imdb_code];
    title = json[k_title];
    title_english = json[k_title_english];
    title_long = json[k_title_long];
    slug = json[k_slug];
    year = json[k_year];
    rating = json[k_rating].toDouble();
    runtime = json[k_runtime];
    genres = json[k_genres];
    summary = json[k_summary];
    description_full = json[k_description_full];
    synopsis = json[k_synopsis];
    yt_trailer_code = json[k_yt_trailer_code];
    language = json[k_language];
    mpa_rating = json[k_mpa_rating];
    background_image = json[k_background_image];
    background_image_original = json[k_background_image_original];
    small_cover_image = json[k_small_cover_image];
    medium_cover_image = json[k_medium_cover_image];
    state = json[k_state];
    if (json[k_torrents] != null) {
      torrents = <TorrentModel>[];
      json[k_torrents].forEach((value) {
        torrents.add(TorrentModel.fromJson(value));
      });
    }
    date_uploaded = json[k_date_uploaded];
    date_uploaded_unix = json[k_date_uploaded_unix];
  }
}
