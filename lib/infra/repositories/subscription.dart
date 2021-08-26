import 'package:iugu/domain/entities/subscription_model.dart';
import 'package:iugu/domain/interfaces/diposable_interface.dart';

import '../../iugu.dart';
import 'api_resource.dart';

class Subscription extends IDisposable {
  late APIResource apiResource;

  Subscription(IuguClient client) {
    apiResource = APIResource(client.properties.dio, "/subscriptions");
  }

  Future<PaggedResponseMessage<SubscriptionModel>> get({
    String id = '',
    String partOfUrl = '',
    String apiUserToken = '',
  }) async {
    var result = await apiResource.getById(
      id: id,
      partOfUrl: partOfUrl,
      apiUserToken: apiUserToken,
    );
    return PaggedResponseMessage<SubscriptionModel>(
      totalItems: result["totalItems"],
      items: (result["items"] as List).map((e) => SubscriptionModel.fromMap(e)).toList(),
    );
  }

  Future<SubscriptionModel> getById({
    required String id,
    String apiUserToken = '',
  }) async {
    var result = await apiResource.getById(
      id: id,
      apiUserToken: apiUserToken,
    );
    return SubscriptionModel.fromMap(result);
  }

  /// <summary>
  /// Cria uma assinatura para um cliente cadastrado
  /// </summary>
  /// <param name="request">Request para criar uma assinatura</param>
  /// <param name="customApiToken">Um token customizado, por exemplo, de um cliente de uma subconta, comum em marketplaces</param>
  Future<SubscriptionModel> create({required SubscriptionRequestMessage request, String customApiToken = ''}) async {
    var result = await apiResource.post(data: request.toMap(), apiUserToken: customApiToken);
    return SubscriptionModel.fromMap(result);
  }

  Future<SubscriptionModel> delete({required String id, String customApiToken = ''}) async {
    var result = await apiResource.delete(id: id, apiUserToken: customApiToken);
    return SubscriptionModel.fromMap(result);
  }

  Future<SubscriptionModel> put({required String id, required SubscriptionModel model}) async {
    var result = await apiResource.put(id: id, data: model.toMap());
    return SubscriptionModel.fromMap(result);
  }

  Future<SubscriptionModel> suspend(String id) async {
    var result = await apiResource.post(partOfUrl: "/$id/suspend");
    return SubscriptionModel.fromMap(result);
  }

  Future<SubscriptionModel> activate(String id) async {
    var result = await apiResource.post(partOfUrl: "/$id/activate");
    return SubscriptionModel.fromMap(result);
  }

  Future<SubscriptionModel> changePlan(String id, String planIdentifier) async {
    var result = await apiResource.post(partOfUrl: "/$id/change_plan/$planIdentifier");
    return SubscriptionModel.fromMap(result);
  }

  Future<SubscriptionModel> addCreditsAsync(String id, int quantity) async {
    var result = await apiResource.post(partOfUrl: "/$id/add_credits/$quantity");
    return SubscriptionModel.fromMap(result);
  }

  @override
  void dispose() {}
}
