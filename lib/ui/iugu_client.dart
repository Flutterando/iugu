import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

class IuguClient {
  final IuguProperties properties;
  IuguClient({@required this.properties});
}

class IuguProperties {
  final String apiKey;
  final String urlApi;

  IuguProperties({@required this.apiKey, @required this.urlApi})
      : assert(
          apiKey != null && apiKey.trim() != "",
          "You need to set API Key",
        ),
        assert(
          urlApi != null && urlApi.trim() != "",
          "You need to set a valid url",
        ) {
    _dio = Dio(
      BaseOptions(
        baseUrl: urlApi,
        queryParameters: {'api_token': apiKey},
      ),
    );
  }

  Dio _dio;
  Dio get dio => _dio;
}
