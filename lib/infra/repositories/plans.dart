import 'package:iugu/domain/entities/plan_models_list.dart';
import 'package:iugu/domain/interfaces/diposable_interface.dart';

import '../../iugu.dart';
import 'api_resource.dart';

class Plans extends IDisposable {
  final APIResource apiResource;

  Plans(IuguClient client) : apiResource = APIResource(client.properties.dio, "/plans");

  //limit (opcional)	Máximo de registros retornados
  //start (opcional)	Quantos registros pular do início da pesquisa (muito utilizado para paginação)
  //created_at_from (opcional)	Registros criados a partir desta data passada no parâmetro
  //created_at_to (opcional)	Registros criados até esta data passada no parâmetro
  //query (opcional)	Neste parâmetro pode ser passado um texto para pesquisa
  //updated_since (opcional)	Registros atualizados desde o valor passado no parâmetro
  //sortBy (opcional)	Um hash sendo a chave o nome do campo para ordenação e o valor sendo DESC ou ASC para descendente e ascendente, respectivamente
  //customer_id (opcional)	ID do Cliente
  Future<PaggedResponseMessage<PlanModel>> getAll({
    String customApiToken = '',
    String filter = "?limit=1000",
  }) async {
    //  var queryStringFilter = filter?.ToQueryStringUrl();
    var retorno = await apiResource.getById(partOfUrl: filter, apiUserToken: customApiToken);

    return PaggedResponseMessage<PlanModel>(
      totalItems: retorno["totalItems"],
      items: (retorno["items"] as List).map((e) => PlanModel.fromMap(e)).toList(),
    );
  }

  Future<PlanModel> get({required String id, String customApiToken = ''}) async {
    var result = await apiResource.getById(id: id, apiUserToken: customApiToken);
    return PlanModel.fromMap(result);
  }

  Future<PlanModel> getByIdentifier({required String planIdentifier, String customApiToken = ''}) async {
    var result = await apiResource.getById(partOfUrl: "/identifier/$planIdentifier", apiUserToken: customApiToken);
    return PlanModel.fromMap(result);
  }

  /// <summary>
  /// Cria um Plano possibilitando enviar um ApiToken customizado
  /// </summary>
  /// <param name="plan">todo: describe plan parameter on CreateAsync</param>
  /// <param name="customApiToken">todo: describe customApiToken parameter on CreateAsync</param>
  Future<PlanModel> create({required PlanRequestMessage plan, String customApiToken = ''}) async {
    var result = await apiResource.post(data: plan.toMap(), apiUserToken: customApiToken);

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
