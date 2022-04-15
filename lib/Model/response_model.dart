// ignore_for_file: constant_identifier_names

class ResponseModel {
  late String id;
  late String token;

  static const String k_id = 'id';
  static const String k_token = 'token';

  // Response({
  //   required this.id,
  //   required this.token,
  // });

  Map<String, dynamic> toMap() => {
        k_id: id,
        k_token: token,
      };

  ResponseModel.fromJson(Map<String, dynamic> json) {
    id = json[k_id];
    token = json[k_token];
  }
}
