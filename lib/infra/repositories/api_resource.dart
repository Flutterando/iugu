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
      if (queryParameters.containsKey("api_token")) {
        queryParameters?.remove('api_token');
        queryParameters?.addAll({'api_token': apiUserToken});
      }

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
      if (queryParameters.containsKey("api_token")) {
        queryParameters?.remove('api_token');
        queryParameters?.addAll({'api_token': apiUserToken});
      }

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
  Future<List<dynamic>> getAll({
    String partOfUrl,
    String apiUserToken,
  }) async {
    Map<String, dynamic> queryParameters = dio.options.queryParameters;

    if (apiUserToken != null && apiUserToken.trim() != "") {
      if (queryParameters.containsKey("api_token")) {
        queryParameters?.remove('api_token');
        queryParameters?.addAll({'api_token': apiUserToken});
      }

      dio.options.queryParameters = queryParameters;
    }

    var url = "$baseURI";

    if (partOfUrl != null) {
      url += '$partOfUrl';
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
      if (queryParameters.containsKey("api_token")) {
        queryParameters?.remove('api_token');
        queryParameters?.addAll({'api_token': apiUserToken});
      }

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
    Map<String, dynamic> queryParameters =
        dio.options.queryParameters.map((key, value) => MapEntry(key, value));

    var opt = dio.options;
    Dio _dio = Dio(BaseOptions(
      baseUrl: opt.baseUrl,
      extra: opt.extra,
      headers: opt.headers,
      contentType: opt.contentType,
      connectTimeout: opt.connectTimeout,
      followRedirects: opt.followRedirects,
      maxRedirects: opt.maxRedirects,
      method: opt.method,
      queryParameters: queryParameters,
      receiveDataWhenStatusError: opt.receiveDataWhenStatusError,
      receiveTimeout: opt.receiveTimeout,
      requestEncoder: opt.requestEncoder,
      responseDecoder: opt.responseDecoder,
      responseType: opt.responseType,
      sendTimeout: opt.sendTimeout,
      validateStatus: opt.validateStatus,
    ));

    if (apiUserToken != null && apiUserToken.trim() != "") {
      if (queryParameters.containsKey("api_token")) {
        queryParameters?.remove('api_token');
        queryParameters?.addAll({'api_token': apiUserToken});
      }

      _dio.options.queryParameters = queryParameters;
    }

    var url = "$baseURI";

    if (partOfUrl != null) {
      url += '$partOfUrl';
    }

    var result = await _dio.post(url, data: data);

    return result.data is String ? json.decode(result.data) : result.data;
  }

  @override
  void dispose() {}
}
