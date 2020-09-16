import 'package:dio/dio.dart';
import 'package:iugu/domain/interfaces/diposable_interface.dart';

import '../../iugu.dart';
import 'api_resource.dart';

class Reports extends IDisposable {
  final Dio _dio;

  Reports(IuguClient client) : _dio = client.properties.dio;

  void dispose() {}

  //limit (opcional)	Máximo de registros retornados
  //start (opcional)	Quantos registros pular do início da pesquisa (muito utilizado para paginação)
  //created_at_from (opcional)	Registros criados a partir desta data passada no parâmetro
  //created_at_to (opcional)	Registros criados até esta data passada no parâmetro
  //query (opcional)	Neste parâmetro pode ser passado um texto para pesquisa
  //updated_since (opcional)	Registros atualizados desde o valor passado no parâmetro
  //sortBy (opcional)	Um hash sendo a chave o nome do campo para ordenação e o valor sendo DESC ou ASC para descendente e ascendente, respectivamente
  //customer_id (opcional)	ID do Cliente

  /// <summary>
  /// Report com os pedidos de saque realizados e para que conta, com filtros e token customizados
  /// </summary>
  /// <param name="customApiToken">todo: describe customApiToken parameter on ReportAsync</param>
  /// <param name="filter">Opções de filtros e ordenação</param>
  /// <returns>A lista de saques paginada</returns>
  Future<PaggedResponseMessage<RequestWithdrawResponseMessage>>
      reportRequestWithdrawAsync({
    String customApiToken,
    String filter = "?limit=1000",
  }) async {
    var api = APIResource(_dio, "/withdraw_requests");

    var result =
        await api.getById(partOfUrl: filter, apiUserToken: customApiToken);

    return PaggedResponseMessage<RequestWithdrawResponseMessage>(
      totalItems: result["totalItems"],
      items: (result["items"] as List)
          .map((e) => RequestWithdrawResponseMessage.fromMap(e))
          .toList(),
    );
  }

  /// <summary>
  /// Report com as transferências enviadas e recebidas, com token customizado
  /// </summary>
  /// <param name="customApiToken">token customizado</param>
  /// <returns>A lista de transferência</returns>
  Future<TransfersReportResponseMessage> reportTransfersHistoryAsync(
      String customApiToken) async {
    var api = APIResource(_dio, "/transfers");
    var result = await api.getById(apiUserToken: customApiToken);

    return TransfersReportResponseMessage.fromMap(result);
  }
}
