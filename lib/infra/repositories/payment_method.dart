import 'package:iugu/domain/entities/data_entry/credit_card.dart';
import 'package:iugu/domain/entities/payment_method_model.dart';
import 'package:iugu/domain/interfaces/diposable_interface.dart';

import '../../iugu.dart';
import 'api_resource.dart';

class PaymentMethod extends IDisposable {
  final APIResource apiResource;
  final String customerId;

  PaymentMethod(IuguClient client, this.customerId)
      : apiResource = APIResource(
            client.properties.dio, "/customers/$customerId/payment_methods");

  Future<PaymentMethodModel> get({String id}) async {
    var result = await apiResource.getById(id: id);
    return PaymentMethodModel.fromMap(result);
  }

  /// <summary>
  /// Cria uma Forma de Pagamento de Cliente.
  /// </summary>
  /// <param name="description">Descrição</param>
  /// <param name="data">(opcional se enviar o token)	Dados da Forma de Pagamento (Em breve, este parâmetro será descontinuado. Para evitar problemas, use a partir de agora o parâmetro  token)</param>
  /// <param name="set_as_default">(opcional)	Tipo da Forma de Pagamento. Atualmente suportamos apenas Cartão de Crédito (tipo credit_card). Só deve ser enviado caso não envie token.</param>
  /// <param name="token">(opcional)	Token de Pagamento, pode ser utilizado em vez de enviar os dados da forma de pagamento</param>
  /// <param name="item_type">(opcional)	Tipo da Forma de Pagamento. Atualmente suportamos apenas Cartão de Crédito (tipo credit_card). Só deve ser enviado caso não envie token.</param>
  Future<PaymentMethodModel> create(
    String description,
    CreditCard data,
    bool setAsDefault,
    String token,
    String itemType,
  ) async {
    Object paymentmethod;

    if (data == null && token != null) {
      paymentmethod = {
        description: description,
        setAsDefault: setAsDefault,
        token: token,
      };
    } else {
      paymentmethod = {
        description: description,
        data: data.toMap(),
        setAsDefault: setAsDefault,
        itemType: itemType,
      };
    }

    var result = await apiResource.post(data: paymentmethod);

    return PaymentMethodModel.fromMap(result);
  }

  Future<PaymentMethodModel> delete(String id) async {
    var result = await apiResource.delete(id: id);
    return PaymentMethodModel.fromMap(result);
  }

  //[Obsolete("Sera descontinuado na versão 2.x do client, use a versão assincrona do método")]
  Future<PaymentMethodModel> put(String id, PaymentMethodModel model) async {
    var result = await apiResource.put(id: id, data: model.toMap());
    return PaymentMethodModel.fromMap(result);
  }

  void dispose() {}
}
