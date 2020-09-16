import 'package:iugu/domain/interfaces/diposable_interface.dart';

import '../../iugu.dart';
import 'api_resource.dart';

/// <summary>
/// O processo para cobrança transparente funciona da seguinte maneira:
/// Primeiramente, os dados de cartão de crédito do cliente são enviados a Iugu através que conexão segura SSL.A Iugu então retorna um token que representa o meio de pagamento desse cliente.
/// Esse token é então utilizado para que seja feita uma cobrança através deste meio de pagamento.
/// Pronto! Pagamento efetuado!
/// </summary>
class PaymentToken extends IDisposable {
  final APIResource apiResource;

  PaymentToken(IuguClient client)
      : apiResource = APIResource(client.properties.dio, "/payment_token");

  /// <summary>
  /// O Token é uma representação do meio de pagamento do cliente (por ex: seu cartão de crédito), sendo totalmente seguro, de forma que não é possível que
  /// alguém consiga as informações do cartão de crédito do cliente utilizando esse token. O token é gerado para uma transação específica, tornando-o ainda mais seguro.
  /// <see cref="https://iugu.com/referencias/api#tokens-e-cobranca-direta"/>
  /// </summary>
  /// <param name="request">Parametros de entrada da request</param>
  /// <returns>Resposta da Api para o PaymentToken</returns>
  Future<PaymentTokenResponse> create(PaymentTokenRequest request) async {
    var result = await apiResource.post(data: request.toMap());
    return PaymentTokenResponse.fromMap(result);
  }

  void dispose() {}
}
