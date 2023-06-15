import 'dart:convert';

import 'package:http/http.dart';

import 'api_constants.dart';

class ApiClient {
  final Client _client;

  ApiClient(this._client);

  

  String getPath(String path, Map<dynamic, dynamic> params) {
    var paramsString = '';
    if (params.isNotEmpty) {
      params.forEach((key, value) {
        paramsString += '&$key=$value';
      });
    }

    return '${ApiConstants.base_URL}$path?api_key=${ApiConstants.API_key}$paramsString';
  }
}