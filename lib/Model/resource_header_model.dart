// ignore_for_file: constant_identifier_names

import 'resource_model.dart';

class ResourceHeaderModel {
  late int page;
  late int perPage;
  late int total;
  late int totalPages;
  late List<ResourceModel> resourceDatas;

  ResourceHeaderModel({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.resourceDatas,
  });

  static const String k_page = "page";
  static const String k_perpage = "per_page";
  static const String k_total = "total";
  static const String k_totalPages = "total_pages";
  static const String k_data = "data";

  ResourceHeaderModel.fromJson(Map<String, dynamic> json) {
    page = json[k_page];
    perPage = json[k_perpage];
    total = json[k_total];
    totalPages = json[k_totalPages];
    if (json[k_data] != null) {
      resourceDatas = <ResourceModel>[];
      json[k_data].forEach((value) {
        resourceDatas.add(ResourceModel.fromJson(value));
      });
    }
  }
}
