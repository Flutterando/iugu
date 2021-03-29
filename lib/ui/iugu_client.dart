import 'package:dio/dio.dart';

class IuguClient {
  final IuguProperties properties;
  IuguClient({required this.properties});
}

class IuguProperties {
  final String apiKey;
  final String urlApi;
  late Dio _dio;

  IuguProperties({required this.apiKey, required this.urlApi})
      : assert(
          apiKey.trim() != "",
          "You need to set API Key",
        ),
        assert(
          urlApi.trim() != "",
          "You need to set a valid url",
        ) {
    _dio = Dio(
      BaseOptions(
        baseUrl: urlApi,
        queryParameters: {
          'api_token': apiKey
        },
      ),
    );
  }

  Dio get dio => _dio;
}
