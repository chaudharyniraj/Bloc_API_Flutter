// ignore_for_file: constant_identifier_names

import 'package:api_bloc_flutter/Model/user_model.dart';

class UserHeaderModel {
  late int page;
  late int perPage;
  late int total;
  late int totalPages;
  late List<UserModel> datas;

  UserHeaderModel({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.datas,
  });

  static const String k_page = "page";
  static const String k_perpage = "per_page";
  static const String k_total = "total";
  static const String k_totalPages = "total_pages";
  static const String k_data = "data";

  UserHeaderModel.fromJson(Map<String, dynamic> json) {
    page = json[k_page];
    perPage = json[k_perpage];
    total = json[k_total];
    totalPages = json[k_totalPages];
    if (json[k_data] != null) {
      datas = <UserModel>[];
      json[k_data].forEach((v) {
        datas.add(UserModel.fromJson(v));
      });
    }
  }
}
