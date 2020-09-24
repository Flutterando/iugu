import 'package:dio/dio.dart';
import 'package:iugu/domain/interfaces/diposable_interface.dart';
import 'package:iugu/infra/models/request/account_configuration_request_message.dart';
import 'package:iugu/infra/models/request/bank_verification_request_message.dart';
import 'package:iugu/infra/models/request/verify_account_request_message.dart';
import 'package:iugu/infra/models/response/account_request_withdraw_response.dart';
import 'package:iugu/infra/models/response/get_account_response_message.dart';
import 'package:iugu/infra/models/response/simple_response_message.dart';
import 'package:iugu/infra/models/response/verify_account_response_message.dart';
import 'package:iugu/infra/repositories/api_resource.dart';
import 'package:iugu/utils/constantes.dart';

/// Api de operações em contas
class Account extends IDisposable {
  APIResource apiResource;

  Account(Dio dio) {
    apiResource = APIResource(dio, "/accounts");
  }

  /// Todas as contas devem ter sua documentação verificada antes de poder emitir faturas reais (porém permite criação de dados de teste).
  /// Essa API permite o envio da documentação da sub-conta criada.
  /// Obs: Essa API obriga a utilização do User API Token em vez do API Token de conta. A verificação demora em torno de 1 dia útil
  /// <param name="accountData">Dados da conta</param>
  /// <param name="userToken"> User API Token</param>
  /// <param name="accountId">Id da conta a ser validada</param>
  /// <returns>Resposta da API de validação da conta</returns>
  Future<VerifyAccountResponseMessage> verifyUnderAccount(
      VerifyAccountRequestMessage accountData,
      String accountId,
      String userToken) async {
    var result = await apiResource.post(
        data: accountData.toMap(),
        partOfUrl: "/$accountId/request_verification",
        apiUserToken: userToken);
    return VerifyAccountResponseMessage.fromMap(result);
  }

  /// Retorna as informações de uma conta
  /// <param name="accountId">Id da Conta</param>
  /// <param name="userToken">Token de Usuário</param>
  /// <returns></returns>
  Future<GetAccountResponseMessage> getById(
      String accountId, String userToken) async {
    var result =
        await apiResource.getById(id: accountId, apiUserToken: userToken);
    return GetAccountResponseMessage.fromMap(result);
  }

  /// Faz um pedido de Saque de um valor de uma determinada conta, utilizando um userApiToken customizado da conta de pedido de saque
  /// <param name="targetAccountId">Id da conta a ser validada</param>
  /// <param name="amount">Valor da retirada</param>
  /// <param name="customUserApiToken">Token customizado do usuário, utilizado em marketplaces</param>
  /// <returns>Resposta da API depedido de saque</returns>
  Future<AccountRequestWithdrawResponse> requestWithdraw(
      String targetAccountId, double amount, String customUserApiToken) async {
    var result = await apiResource.post(
      data: {"amount": amount},
      partOfUrl: "/$targetAccountId/request_withdraw",
      apiUserToken: customUserApiToken,
    );
    return AccountRequestWithdrawResponse.fromMap(result);
  }

  /// Faz um pedido de saque de todo saldo de uma conta, utilizando um user token da conta de saque
  /// <param name="targetAccountId">Id da conta a ser validada</param>
  /// <param name="customUserApiToken">User token customizado da Api</param>
  /// <returns>Resposta da API depedido de saque</returns>
  Future<AccountRequestWithdrawResponse> requestWithdrawAll({
    String targetAccountId,
    String customUserApiToken,
  }) async {
    var _resultAccountBalance = await apiResource.getById(id: targetAccountId);
    var _accountBalanceValue =
        GetAccountResponseMessage.fromMap(_resultAccountBalance);
    var _convertedValue = double.parse(_accountBalanceValue.balance
        .replaceAll(CurrencySymbol.BRL, '')
        .replaceAll(",", "."));
    var result = await apiResource.post(
        data: {"amount": _convertedValue},
        partOfUrl: "/$targetAccountId/request_withdraw",
        apiUserToken: customUserApiToken);
    return AccountRequestWithdrawResponse.fromMap(result);
  }

  /// Configura parâmetros de uma sub-conta, utilizando um apiToken customizado
  /// <param name="request">Configurações</param>
  /// <param name="accountApiToken">Live Api Token da conta</param>
  /// <returns></returns>
  Future<GetAccountResponseMessage> configureAccount(
      AccountConfigurationRequestMessage request,
      String accountApiToken) async {
    var result = await apiResource.post(
      data: request.toMap(),
      partOfUrl: "/configuration",
      apiUserToken: accountApiToken,
    );
    return GetAccountResponseMessage.fromMap(result);
  }

  /// Envia dados para alteração de dados bancários.
  /// <param name="request">Requisição com o pedido de atualização dos dados bancários</param>
  /// <param name="accountApiToken">Token customizado da conta onde se quer fazer a atualização</param>
  /// <returns>Mensagem com o status da solicitação de update</returns>
  Future<SimpleResponseMessage> updateBankAccountData(
    BankVerificationRequestMessage request,
    String accountApiToken,
  ) async {
    var result = await apiResource.post(
      data: request.toMap(),
      partOfUrl: "/bank_verification",
      apiUserToken: accountApiToken,
    );

    return SimpleResponseMessage.fromMap(result);
  }

  @override
  void dispose() {
    apiResource.dispose();
  }
}
