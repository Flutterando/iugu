import 'package:iugu/domain/interfaces/diposable_interface.dart';

import '../../iugu.dart';
import 'api_resource.dart';

/// Cobrança Direta
/// Podemos efetuar uma cobrança direta de um valor, utilizando um token de cartão de crédito, uma forma de pagamento de cliente ou gerando um boleto bancário.
class Charge extends IDisposable {
  APIResource apiResource;

  Charge(IuguClient client) {
    apiResource = APIResource(client.properties.dio, "/charge");
  }

  @override
  void dispose() {
    apiResource.dispose();
  }

  /// Cria uma nova cobrança possibilitando envio do token customizado, geralmente de uma subconta, em maketplaces
  /// <param name="request">Parametros para criar uma cobrança</param>
  /// <param name="customApiToken">Token customizado/param>
  /// <returns>Uma cobrança do tipo boleto</returns>
  Future<ChargeResponseMessage> create({
    ChargeRequestMessage request,
    String apiUserToken,
  }) async {
    var result = await apiResource.post(
      data: request.toMap(),
      apiUserToken: apiUserToken,
    );

    if (result.containsKey('errors') && result['errors'].isNotEmpty) {
      throw Exception(result['errors']);
    }

    return ChargeResponseMessage.fromMap(result);
  }
}
