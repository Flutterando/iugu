import 'package:iugu/domain/entities/plan_models_list.dart';
import 'package:iugu/domain/interfaces/diposable_interface.dart';

import '../../iugu.dart';
import 'api_resource.dart';

class Plans extends IDisposable {
  final APIResource apiResource;

  Plans(IuguClient client)
      : apiResource = APIResource(client.properties.dio, "/plans");

  Future<PaggedResponseMessage<PlanModel>> getAll(
      {String customApiToken}) async {
    //  var queryStringFilter = filter?.ToQueryStringUrl();
    var retorno = await apiResource.getById(
        partOfUrl: "?limit=1000", apiUserToken: customApiToken);

    return PaggedResponseMessage<PlanModel>(
      totalItems: retorno["totalItems"],
      items:
          (retorno["items"] as List).map((e) => PlanModel.fromMap(e)).toList(),
    );
  }

  Future<PlanModel> get({String id, String customApiToken}) async {
    var result =
        await apiResource.getById(id: id, apiUserToken: customApiToken);
    return PlanModel.fromMap(result);
  }

  Future<PlanModel> getByIdentifier(
      {String planIdentifier, String customApiToken}) async {
    var result = await apiResource.getById(
        id: null,
        partOfUrl: "identifier/$planIdentifier",
        apiUserToken: customApiToken);
    return PlanModel.fromMap(result);
  }

  /// <summary>
  /// Cria um Plano possibilitando enviar um ApiToken customizado
  /// </summary>
  /// <param name="plan">todo: describe plan parameter on CreateAsync</param>
  /// <param name="customApiToken">todo: describe customApiToken parameter on CreateAsync</param>
  Future<PlanModel> create(
      {PlanRequestMessage plan, String customApiToken}) async {
    var result = await apiResource.post(
        data: plan.toMap(), apiUserToken: customApiToken);

    return PlanModel.fromMap(result);
  }

  Future<PlanModel> delete(String id, String customApiToken) async {
    var result = await apiResource.delete(id: id, apiUserToken: customApiToken);
    return PlanModel.fromMap(result);
  }

  Future<PlanModel> put(String id, PlanModel model) async {
    var result = await apiResource.put(id: id, data: model.toMap());
    return PlanModel.fromMap(result);
  }

  void dispose() {}
}
