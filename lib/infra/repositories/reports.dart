import 'package:dio/dio.dart';
import 'package:iugu/domain/interfaces/diposable_interface.dart';

import '../../iugu.dart';
import 'api_resource.dart';

class Reports extends IDisposable {
  final Dio _dio;

  Reports(IuguClient client) : _dio = client.properties.dio;

  void dispose() {}

  /// <summary>
  /// Report com os pedidos de saque realizados e para que conta, com filtros e token customizados
  /// </summary>
  /// <param name="customApiToken">todo: describe customApiToken parameter on ReportAsync</param>
  /// <param name="filter">Opções de filtros e ordenação</param>
  /// <returns>A lista de saques paginada</returns>
  Future<PaggedResponseMessage<RequestWithdrawResponseMessage>>
      reportRequestWithdrawAsync(String customApiToken, String filter) async {
    var api = APIResource(_dio, "/withdraw_requests");

    var result = await api.getById(
        partOfUrl: "?limit=1000", apiUserToken: customApiToken);

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
