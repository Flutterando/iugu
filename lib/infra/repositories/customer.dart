import 'package:iugu/domain/entities/customer_model.dart';
import 'package:iugu/domain/interfaces/diposable_interface.dart';
import 'package:iugu/infra/models/request/customer_request_message.dart';

import '../../iugu.dart';
import 'api_resource.dart';

/// <summary>
/// Utilizando o objeto cliente você pode controlar os pagamentos feito por um cliente específico, bem como controlar os dados de contato desse cliente.
/// Também permite a criação de formas de pagamento desse cliente para que então o pagamento recorrente (assinatura) possa ser automatizado utilizando a
/// forma de pagamento padrão deste cliente.
/// </summary>
class Customer extends IDisposable {
  APIResource apiResource;

  Customer(IuguClient client) {
    apiResource = APIResource(client.properties.dio, "/customers");
  }

  @override
  void dispose() {
    apiResource.dispose();
  }

  // // [Obsolete("Sera descontinuado na versão 2.x do client, use a versão assincrona do método")]
  // //  CustomersModel Get()
  // // {
  // //     var result = Get().Result;
  // //     return result;
  // // }

  Future<CustomersModel> get() async {
    var result = await apiResource.get();
    return CustomersModel.fromMap(result);
  }

  // [Obsolete("Sera descontinuado na versão 2.x do client, use a versão assincrona do método")]
  //  CustomerModel Get(String id)
  // {
  //     var result = Get(id).Result;
  //     return result;
  // }

  Future<CustomerModel> getById({String id}) async {
    var result = await apiResource.getById(id: id);
    return CustomerModel.fromMap(result);
  }

  Future<CustomerModel> getFromCustomApiToken(String customApiToken) async {
    var result = await apiResource.getById(apiUserToken: customApiToken);
    return CustomerModel.fromMap(result);
  }

  // /// <summary>
  // /// Criar um cliente
  // /// </summary>
  // /// <param name="email">E-Mail do Cliente</param>
  // /// <param name="name">(Opcional) Nome do Cliente</param>
  // /// <param name="notes">(Opcional) Anotações Gerais do Cliente</param>
  // /// <param name="custom_variables">(Opcional) Variáveis Personalizadas</param>
  // /// <param name="withCopyEmail">(Opcional) Endereços de E-mail para cópia separados por vírgula.</param>
  // /// <returns>O cliente criado</returns>
  // [Obsolete("Sera descontinuado na versão 2.x do client, use a versão assincrona que recebe CustomerRequestMessage como parâmetro do método")]
  //  CustomerModel Create(String email, String name = null, String notes = null, List<CustomVariables> custom_variables = null, String withCopyEmail = null)
  // {
  //     var result = Create(email, name, notes, custom_variables, withCopyEmail).Result;
  //     return result;
  // }

  // /// <summary>
  // /// Criar um cliente
  // /// </summary>
  // /// <param name="email">E-Mail do Cliente</param>
  // /// <param name="name">(Opcional) Nome do Cliente</param>
  // /// <param name="notes">(Opcional) Anotações Gerais do Cliente</param>
  // /// <param name="custom_variables">(Opcional) Variáveis Personalizadas</param>
  // /// <param name="withCopyEmail">(Opcional) Endereços de E-mail para cópia separados por vírgula.</param>
  // /// <returns>O cliente criado</returns>
  // [Obsolete("Sera descontinuado na versão 2.x do client, use a versão assincrona que recebe CustomerRequestMessage como parâmetro do método")]
  //   Future<CustomerModel> Create(String email, String name = null, String notes = null, List<CustomVariables> custom_variables = null, String withCopyEmail = null)
  // {
  //     var user = new
  //     {
  //         email = email,
  //         name = name,
  //         notes = notes,
  //         cc_emails = withCopyEmail,
  //         custom_variables = custom_variables
  //     };
  //     var result = await Post<CustomerModel>(user);
  //     return result;
  // }

  /// <summary>
  /// Cria um cliente em uma conta especifica
  /// </summary>
  /// <param name="request"></param>
  /// <param name="customApiToken"></param>
  /// <returns></returns>
  Future<CustomerModel> create({
    CustomerRequestMessage request,
    String customApiToken,
  }) async {
    var result = await apiResource.post(
        data: request.toMap(), apiUserToken: customApiToken);
    return CustomerModel.fromMap(result);
  }

  // [Obsolete("Sera descontinuado na versão 2.x do client, use a versão assincrona do método")]
  //  CustomerModel Delete(String id)
  // {
  //     var result = Delete(id).Result;
  //     return result;
  // }

  Future<CustomerModel> delete({String id, String customApiToken}) async {
    var result = await apiResource.delete(id: id, apiUserToken: customApiToken);
    return CustomerModel.fromMap(result);
  }

  // [Obsolete("Sera descontinuado na versão 2.x do client, use a versão assincrona do método")]
  //  CustomerModel Put(String id, CustomerModel model)
  // {
  //     var result = Put(id, model).Result;
  //     return result;
  // }

  Future<CustomerModel> put({String id, CustomerModel model}) async {
    var result = await apiResource.put(id: id, data: model.toMap());
    return CustomerModel.fromMap(result);
  }
}
