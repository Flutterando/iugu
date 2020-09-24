import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:iugu/domain/interfaces/api_resources_interface.dart';

class APIResource extends IApiResources {
  final Dio dio;
  final String baseURI;

  APIResource(this.dio, this.baseURI);

  @override
  Future<Map<String, dynamic>> delete({String id, String apiUserToken}) async {
    Map<String, dynamic> queryParameters = dio.options.queryParameters;

    if (apiUserToken != null && apiUserToken.trim() != "") {
      queryParameters?.putIfAbsent(
        "api_token",
        () => "$apiUserToken",
      );
      dio.options.queryParameters = queryParameters;
    }

    var url = '$baseURI';

    if (id != null) {
      url += "/$id";
    }

    var result = await dio.delete(url);

    return result.data is String ? json.decode(result.data) : result.data;
  }

  @override
  Future<Map<String, dynamic>> get() async {
    var result = await dio.get("$baseURI");
    return result.data is String ? json.decode(result.data) : result.data;
  }

  @override
  Future<Map<String, dynamic>> getById({
    String id,
    String partOfUrl,
    String apiUserToken,
  }) async {
    Map<String, dynamic> queryParameters = dio.options.queryParameters;

    if (apiUserToken != null && apiUserToken.trim() != "") {
      queryParameters?.putIfAbsent(
        "api_token",
        () => "$apiUserToken",
      );
      dio.options.queryParameters = queryParameters;
    }

    var url = "$baseURI";

    if (partOfUrl != null) {
      url += '$partOfUrl';
    }

    if (id != null) {
      url += "/$id";
    }

    var result = await dio.get(url);

    return result.data is String ? json.decode(result.data) : result.data;
  }

  @override
  Future<Map<String, dynamic>> put({
    String id,
    String partOfUrl,
    Map<String, dynamic> data,
    String apiUserToken,
  }) async {
    Map<String, dynamic> queryParameters = dio.options.queryParameters;

    if (apiUserToken != null && apiUserToken.trim() != "") {
      queryParameters?.putIfAbsent(
        "api_token",
        () => "$apiUserToken",
      );
      dio.options.queryParameters = queryParameters;
    }

    var url = "$baseURI";
    if (partOfUrl != null) {
      url += '/$partOfUrl';
    }

    if (id != null) {
      url += "/$id";
    }

    var result = await dio.put(
      "$url",
      data: data,
    );

    return result.data is String ? json.decode(result.data) : result.data;
  }

  @override
  Future<Map<String, dynamic>> post({
    dynamic data,
    String partOfUrl,
    String apiUserToken,
  }) async {
    Map<String, dynamic> queryParameters = dio.options.queryParameters;

    if (apiUserToken != null && apiUserToken.trim() != "") {
      queryParameters?.putIfAbsent(
        "api_token",
        () => "$apiUserToken",
      );
      dio.options.queryParameters = queryParameters;
    }

    var url = "$baseURI";

    if (partOfUrl != null) {
      url += '$partOfUrl';
    }

    var result = await dio.post(url, data: data);

    return result.data is String ? json.decode(result.data) : result.data;
  }

  @override
  void dispose() {}
}
