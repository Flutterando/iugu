import 'diposable_interface.dart';

/// <summary>
/// Inteface básica de um recurso de API
/// </summary>
abstract class IApiResources extends IDisposable {
  Future<dynamic> get();
  Future<dynamic> getById({
    String id,
    String partOfUrl,
    String apiUserToken,
  });

  Future<dynamic> getAll({
    String partOfUrl,
    String apiUserToken,
  });

  Future<dynamic> post({
    Map<String, dynamic> data,
    String partOfUrl,
    String apiUserToken,
  });

  Future<dynamic> put({String id, Map<String, dynamic> data});

  Future<dynamic> delete({String id, String apiUserToken});
}
