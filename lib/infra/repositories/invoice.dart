import 'package:iugu/domain/entities/data_entry/custom_variables.dart';
import 'package:iugu/domain/entities/data_entry/logs.dart';
import 'package:iugu/domain/entities/invoice_model.dart';
import 'package:iugu/domain/entities/payer_model.dart';
import 'package:iugu/domain/interfaces/diposable_interface.dart';

import '../../iugu.dart';
import 'api_resource.dart';

/// Os clientes efetuam pagamentos através das faturas.
/// As faturas contém itens que representam o que o cliente está pagando, o serviço ou produto.
class Invoice extends IDisposable {
  APIResource apiResource;

  Invoice(IuguClient client) {
    apiResource = APIResource(client.properties.dio, "/invoices");
  }

  @override
  void dispose() {
    apiResource.dispose();
  }

  //limit (opcional)	Máximo de registros retornados
  //start (opcional)	Quantos registros pular do início da pesquisa (muito utilizado para paginação)
  //created_at_from (opcional)	Registros criados a partir desta data passada no parâmetro
  //created_at_to (opcional)	Registros criados até esta data passada no parâmetro
  //query (opcional)	Neste parâmetro pode ser passado um texto para pesquisa
  //updated_since (opcional)	Registros atualizados desde o valor passado no parâmetro
  //sortBy (opcional)	Um hash sendo a chave o nome do campo para ordenação e o valor sendo DESC ou ASC para descendente e ascendente, respectivamente
  //customer_id (opcional)	ID do Cliente

  /// <summary>
  /// Lista todas as ultimas(1000) faturas possibilitando enviar um ApiToken de subconta, geralmente utilizado em marketplaces
  /// </summary>
  /// <param name="customApiToken">ApiToken customizado</param>
  /// <returns></returns>

  /// <summary>
  /// Lista todas as faturas possibilitando enviar um ApiToken de subconta, geralmente utilizado em marketplaces e filtros customizaveis.
  /// </summary>
  /// <param name="customApiToken">ApiToken customizado</param>
  /// <param name="filter">Opções de filtros, para paginação e ordenação</param>
  /// <returns></returns>
  ///Future<PaggedResponseMessage<InvoiceModel>> getAll(String customApiToken, QueryStringFilter filter) async
  Future<PaggedResponseMessage<InvoiceModel>> getAll({
    String filter = "?limit=1000",
    String customApiToken,
  }) async {
    //  var queryStringFilter = filter?.ToQueryStringUrl();
    var result = await apiResource.getById(
        partOfUrl: filter, apiUserToken: customApiToken);
    return PaggedResponseMessage<InvoiceModel>(
      totalItems: result["totalItems"],
      items: (result["items"] as List)
          .map((e) => InvoiceModel.fromMap(e))
          .toList(),
    );
  }

  Future<InvoiceModel> getById({String id, String apiUserToken}) async {
    var retorno = await apiResource.getById(
      id: id,
      apiUserToken: apiUserToken,
    );

    return InvoiceModel.fromMap(retorno);
  }

  /// <summary>
  /// Cria uma Fatura para um Cliente (Podendo ser apenas um e-mail).
  /// </summary>
  /// <param name="email">E-Mail do cliente</param>
  /// <param name="due_date">Data de Expiração (DD/MM/AAAA)</param>
  /// <param name="items"> Itens da Fatura</param>
  /// <param name="return_url">(opcional)	Cliente é redirecionado para essa URL após efetuar o pagamento da Fatura pela página de Fatura da Iugu</param>
  /// <param name="expired_url">(opcional) Cliente é redirecionado para essa URL se a Fatura que estiver acessando estiver expirada</param>
  /// <param name="notification_url">(opcional) URL chamada para todas as notificações de Fatura, assim como os webhooks (Gatilhos) são chamados</param>
  /// <param name="tax_cents">(opcional) Valor dos Impostos em centavos</param>
  /// <param name="discount_cents">(opcional)	Valor dos Descontos em centavos</param>
  /// <param name="customer_id">(opcional) ID do Cliente</param>
  /// <param name="ignore_due_email">(opcional) Booleano que ignora o envio do e-mail de cobrança</param>
  /// <param name="subscription_id">(opcional) Amarra essa Fatura numa Assinatura</param>
  /// <param name="credits">(opcional) Caso tenha o subscription_id, pode-se enviar o número de créditos a adicionar nessa Assinatura quando a Fatura for paga</param>
  /// <param name="logs">(opcional) Logs da Fatura</param>
  /// <param name="custom_variables">(opcional) Variáveis Personalizadas</param>
  /// <param name="payer">Dados do pagador, obrigatórios para boletos registrados</param>
  /// <param name="customApiToken">Token customizado opcional, mais utilizado em marketplaces</param>
  /// <returns></returns>

  Future<InvoiceModel> create({
    String email,
    DateTime dueDate,
    List<Item> items,
    String returnUrl,
    String expiredUrl,
    String notificationUrl,
    int taxCents = 0,
    int discountCents = 0,
    String customerId,
    bool ignoreDueEmail = false,
    String subscriptionId,
    int credits,
    Logs logs,
    List<CustomVariables> customVariables,
    PayerModel payer,
    bool earlyPaymentDiscount = false,
    List<EarlyPaymentDiscounts> earlyPaymentDiscounts,
    String customApiToken,
  }) async {
    var invoice = InvoiceRequestMessage(
        email: email,
        dueDate: dueDate.toString(),
        items: items,
        returnUrl: returnUrl,
        expiredUrl: expiredUrl,
        taxCents: taxCents,
        discountCents: discountCents,
        customerId: customerId,
        ignoreDueDateMail: ignoreDueEmail,
        subscriptionId: subscriptionId,
        credits: credits,
        logs: [logs],
        customVariables: customVariables,
        notificationUrl: notificationUrl,
        enableEarlyPaymentDiscount: earlyPaymentDiscount,
        earlyPaymentDiscounts: earlyPaymentDiscounts,
        payer: payer);

    var retorno = await apiResource.post(
        data: invoice.toMap(), apiUserToken: customApiToken);
    return InvoiceModel.fromMap(retorno);
  }

  Future<InvoiceModel> delete({String id}) async {
    var retorno = await apiResource.delete(id: id);
    return InvoiceModel.fromMap(retorno);
  }

  Future<InvoiceModel> put({String id, InvoiceModel model}) async {
    var retorno = await apiResource.put(id: id, data: model.toMap());
    return InvoiceModel.fromMap(retorno);
  }

  Future<InvoiceModel> refund({String id}) async {
    var retorno = await apiResource.post(partOfUrl: "/$id/refund");
    return InvoiceModel.fromMap(retorno);
  }

  Future<InvoiceModel> cancel({String id, String customApiToken}) async {
    var retorno = await apiResource.put(
        partOfUrl: "/$id/cancel", apiUserToken: customApiToken);
    return InvoiceModel.fromMap(retorno);
  }

  /// <summary>
  /// Gera segunda via de uma Fatura. Somente faturas pendentes podem ter segunda via gerada. A fatura atual é cancelada e uma nova é gerada com status ‘pending’.
  /// </summary>
  /// <param name="id">Identificador da fatura</param>
  /// <param name="data">Informações da nova fatura</param>
  /// <returns>Objeto invoice resultante da requisição</returns>
  /// <param name="customApiToken">Token customizado geralmente passado quando está se trabalhando como marketplace</param>

  Future<InvoiceModel> duplicate(
      {String id,
      InvoiceDuplicateRequestMessage data,
      String customApiToken}) async {
    var retorno = await apiResource.post(
        data: data?.toMap(),
        partOfUrl: "/$id/duplicate",
        apiUserToken: customApiToken);
    return InvoiceModel.fromMap(retorno);
  }

  /// <summary>
  /// Captura uma fatura com estado 'Em Análise'
  /// </summary>
  /// <param name="id">Identificador da fatura</param>
  /// <returns>Objeto invoice resultante da requisição</returns>
  Future<InvoiceModel> capture({String id}) async {
    var retorno = await apiResource.post(partOfUrl: "/$id/capture");
    return InvoiceModel.fromMap(retorno);
  }

  /// <summary>
  /// Reenviar fatura para o email do cliente
  /// </summary>
  /// <param name="id">Identificador da fatura</param>
  /// <returns>Objeto invoice resultante da requisição</returns>
  /// <param name="customApiToken">Token customizado geralmente passado quando está se trabalhando como marketplace</param>

  Future<InvoiceModel> resendInvoiceMail(
      {String id, String customApiToken}) async {
    var retorno = await apiResource.post(
        partOfUrl: "/$id/send_email", apiUserToken: customApiToken);
    return InvoiceModel.fromMap(retorno);
  }
}
