// ignore_for_file: constant_identifier_names

class ResourceModel {
  late int id;
  late String name;
  late int year;
  late String color;
  late String pantoneValue;

  ResourceModel(
    this.id,
    this.name,
    this.year,
    this.color,
    this.pantoneValue,
  );

  static const String k_id = "id";
  static const String k_name = "name";
  static const String k_year = "year";
  static const String k_color = "color";
  static const String k_pantone_value = "pantone_value";

  ResourceModel.fromJson(Map<String, dynamic> json) {
    id = json[k_id];
    name = json[k_name];
    year = json[k_year];
    color = json[k_color];
    pantoneValue = json[k_pantone_value];
  }
}
