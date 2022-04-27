// ignore_for_file: non_constant_identifier_names, constant_identifier_names
class TorrentModel {
  late String url;
  late String hash;
  late String quality;
  late String type;
  late double seeds;
  late double peers;
  late String size;
  late double size_bytes;
  late String date_uploaded;
  late double date_uploaded_unix;

  TorrentModel({
    required this.url,
    required this.hash,
    required this.quality,
    required this.type,
    required this.seeds,
    required this.peers,
    required this.size,
    required this.size_bytes,
    required this.date_uploaded,
    required this.date_uploaded_unix,
  });

  static const String k_url = "url";
  static const String k_hash = "hash";
  static const String k_quality = "quality";
  static const String k_type = "type";
  static const String k_seeds = "seeds";
  static const String k_peers = "peers";
  static const String k_size = "size";
  static const String k_size_bytes = "size_bytes";
  static const String k_date_uploaded = "date_uploaded";
  static const String k_date_uploaded_unix = "date_uploaded_unix";

  TorrentModel.fromJson(Map<String, dynamic> json) {
    url = json[k_url];
    hash = json[k_hash];
    quality = json[k_quality];
    type = json[k_type];
    seeds = json[k_seeds].toDouble();
    peers = json[k_peers].toDouble();
    size = json[k_size];
    size_bytes = json[k_size_bytes].toDouble();
    date_uploaded = json[k_date_uploaded];
    date_uploaded_unix = json[k_date_uploaded_unix].toDouble();
  }
}
