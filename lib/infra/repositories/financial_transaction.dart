import 'package:iugu/domain/interfaces/diposable_interface.dart';

import '../../iugu.dart';
import 'api_resource.dart';

/// Cobrança Direta
/// Podemos efetuar uma cobrança direta de um valor, utilizando um token de cartão de crédito, uma forma de pagamento de cliente ou gerando um boleto bancário.
class FinancialTransaction extends IDisposable {
  late APIResource apiResource;

  FinancialTransaction(IuguClient client) {
    apiResource = APIResource(client.properties.dio, "/financial_transaction_requests");
  }

  @override
  void dispose() {
    apiResource.dispose();
  }

  /// Listas todas as transações de uma conta
  /// <returns></returns>
  Future<FinancialTransactionResponse> getAllTransactions() async {
    var result = await apiResource.get();
    return FinancialTransactionResponse.fromMap(result);
  }

  /// <summary>
  /// Listas todas as transações dentro de um marketplace
  /// </summary>
  /// <param name="customApiToken">api token customizado</param>
  /// <returns></returns>
  Future<FinancialTransactionResponse> getAllTransactionsSubAccounts(String apiUserToken) async {
    var result = await apiResource.getById(apiUserToken: apiUserToken);
    return FinancialTransactionResponse.fromMap(result);
  }

  /// Simular um adiantamento de transações para a conta principal configurada
  /// <param name="transactionsIDs">String contendo os Ids no formato (transactions[]=1&transactions[]=2)</param>
  /// <returns>FinancialTransactionResponse com taxas e informações como se fosse executar o adiantamento</returns>
  Future<FinancialTransactionResponse> getSimulAdvanceTransactions(String transactionsIDs) async {
    var result = await apiResource.getById(id: "$transactionsIDs", partOfUrl: "advance_simulation");
    return FinancialTransactionResponse.fromMap(result);
  }

  /// Simular um adiantamento de uma subconta
  /// <param name="transactionsIDs">String contendo os Ids no formato (transactions[]=1&transactions[]=2)</param>
  /// <param name="customApiToken">api token customizado</param>
  /// <returns>FinancialTransactionResponse com taxas e informações como se fosse executar o adiantamento</returns>
  Future<FinancialTransactionResponse> getSimulAdvanceTransactionsSubAccounts(String transactionsIDs, String apiUserToken) async {
    var result = await apiResource.getById(id: "$transactionsIDs", partOfUrl: "advance_simulation", apiUserToken: apiUserToken);
    return FinancialTransactionResponse.fromMap(result);
  }

  /// Faz um pedido de adiantamento para de transações para uma subconta
  /// <param name="transactionsIDs">String contendo os Ids no formato (transactions[]=1&transactions[]=2)</param>
  /// <param name="customApiToken">api token customizado</param>
  /// <returns>FinancialTransactionResponse com taxas e informações como se fosse executar o adiantamento</returns>

  /// Faz um pedido de adiantamento para de transações para a conta principal
  /// <param name="transactionsIDs">String contendo os Ids no formato (transactions[]=1&transactions[]=2)</param>
  /// <returns>FinancialTransactionResponse com taxas e informações </returns>
  Future<FinancialTransactionResponse> postAdvanceTransactionsSubAccounts(String transactionsIDs, String apiUserToken) async {
    var result = await apiResource.post(data: "$transactionsIDs", partOfUrl: "advance", apiUserToken: apiUserToken);
    return FinancialTransactionResponse.fromMap(result);
  }
}
