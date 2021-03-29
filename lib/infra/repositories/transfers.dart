import 'package:iugu/domain/entities/transfer_model.dart';
import 'package:iugu/domain/interfaces/diposable_interface.dart';

import '../../iugu.dart';
import 'api_resource.dart';

/// <summary>
/// Transfere um determinado valor de sua conta para a conta destino
/// </summary>
class Transfers extends IDisposable {
  late APIResource apiResource;

  Transfers(IuguClient client) {
    apiResource = APIResource(client.properties.dio, "/transfers");
  }

  /// <summary>
  /// Lista com todas as transferências efetuadas.
  /// </summary>
  /// <returns>A lista de transferência</returns>
  Future<TransferModel> get() async {
    var result = await apiResource.get();
    return TransferModel.fromMap(result);
  }

  /// <summary>
  /// Transfere um determinado valor de uma conta origem para uma conta destino.
  /// </summary>
  /// <param name="receiverAccountId">Account ID da conta que irá receber o valor</param>
  /// <param name="amountInCents">Valor a transferir em centavos</param>
  /// <param name="customSourceAccountApiToken">Token da conta de onde está saindo a quantia</param>
  /// <returns></returns>
  Future<TransferModel> create(
    String receiverAccountId,
    int amountInCents,
    String customSourceAccountApiToken,
  ) async {
    var user = {
      "receiver_id": receiverAccountId,
      "amount_cents": amountInCents
    };

    var result = await apiResource.post(data: user, apiUserToken: customSourceAccountApiToken);
    return TransferModel.fromMap(result);
  }

  @override
  void dispose() {
    apiResource.dispose();
  }
}
