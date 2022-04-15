import 'dart:convert';

import 'package:api_bloc_flutter/Model/response_model.dart';
import 'package:api_bloc_flutter/Model/user_model.dart';
import 'package:http/http.dart';

import '../Model/resource_header_model.dart';
import '../Model/resource_model.dart';
import '../Model/user_header_model.dart';
import '../Model/user_register_model.dart';
import '../Utils/base_url.dart';
import '../Utils/server_utils.dart';

class Manager extends BaseUrl {
  Future<ResponseModel> registerUser(UserRegisterModel uData) async {
    String url = ServerUtils().getApiUrl(apiBaseUrl, "api/register");
    Map<String, String> headers = {"Content-type": "application/json"};
    String body = json.encode(uData.toMap());
    Response response =
        await post(Uri.parse(url), headers: headers, body: body);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      ResponseModel datas = ResponseModel.fromJson(data);
      return datas;
    } else {
      throw Exception();
    }
  }

  Future<List<UserModel>> getUserData() async {
    String url = ServerUtils().getApiUrl(apiBaseUrl, "api/users?page=2");
    Response response = await get(Uri.parse(url));
    print(response.statusCode);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      List<UserModel> datas = UserHeaderModel.fromJson(data).datas;
      return datas;
    } else {
      throw Exception();
    }
  }

  Future<List<ResourceModel>> getResourceData() async {
    String url = ServerUtils().getApiUrl(apiBaseUrl, "api/unknown");
    Response response = await get(Uri.parse(url));
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      List<ResourceModel> resourceDatas =
          ResourceHeaderModel.fromJson(data).resourceDatas;
      return resourceDatas;
    } else {
      throw Exception();
    }
  }
}
