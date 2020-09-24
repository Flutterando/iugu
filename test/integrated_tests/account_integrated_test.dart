import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iugu/domain/entities/account_model.dart';
import 'package:iugu/infra/models/response/verify_account_response_message.dart';
import 'package:iugu/infra/repositories/market_place.dart';
import 'package:iugu/iugu.dart';
import 'package:iugu/utils/constantes.dart';
import 'package:mockito/mockito.dart';

import 'data_builder/data_builder.dart';

// Mock class
class DioAdapterMock extends Mock implements HttpClientAdapter {}

void main() {
  group("account_integrated_test", () {
    AccountResponseMessage _response;
    VerifyAccountResponseMessage _expectedResponse;
    final Dio dio = Dio();
    DioAdapterMock dioAdapterMock;

    setUp(() async {
      dioAdapterMock = DioAdapterMock();
      dio.httpClientAdapter = dioAdapterMock;

      var address = PayerModelData.createValidAddress();
      final httpResponse = ResponseBody.fromString(
        AccountModel(
          address,
          "${address.street}, ${address.number} - ${address.city} - ${address.state}/${address.country}",
        ).toJson(),
        200,
      );

      when(dioAdapterMock.fetch(any, any, any))
          .thenAnswer((_) async => httpResponse);

      var request = AccountRequestMessage(
          name: "test_account@gmail.com", commissionPercent: 10);

      var client = MarketPlace(IuguClientData.createClient, dio);

      _response = await client.createUnderAccount(underAccount: request);

      _expectedResponse = VerifyAccountResponseMessage(
          accountId: _response.accountId,
          data: AccountModel(address,
              "${address.street}, ${address.number} - ${address.city} - ${address.state}/${address.country}",
              priceRange: "Entre R\$ 100,00 e R\$ 500,00",
              physicalProducts: false,
              businessDescription: "Negócios online",
              personType: PersonType.INDIVIDUAL_PERSON,
              acceptAutomaticTransfer: true,
              cpf: "42753418306",
              name: "Meu Cliente",
              phone: "2199999999",
              bank: SupportedBanks.CAIXA_ECONOMICA,
              accountType: BankAccountType.CHECKING_ACCOUNT,
              bankAgency: "1520",
              bankAccountNumber: "00100021066-6"));
    });

    test('Verify_if_account_is_valid', () async {
      // Arrange
      var requestAccountVerify = new VerifyAccountRequestMessage(
          data: _expectedResponse.data, automaticValidation: true);

      final httpResponse = ResponseBody.fromString(
        _expectedResponse.toJson(),
        200,
      );

      when(dioAdapterMock.fetch(any, any, any))
          .thenAnswer((_) async => httpResponse);

      // Act
      var client = Account(dio);

      VerifyAccountResponseMessage verifyAccountResponse =
          await client.verifyUnderAccount(
              requestAccountVerify, _response.accountId, _response.userToken);

      // Assert
      expect(
          _expectedResponse.data.name, equals(verifyAccountResponse.data.name));
      expect(_expectedResponse.data.address,
          equals(verifyAccountResponse.data.address));
      expect(
          _expectedResponse.accountId, equals(verifyAccountResponse.accountId));
    });

    test('Get_a_created_account', () async {
      // Arrange
      var request = GetAccountResponseMessage(accountId: "1");

      GetAccountResponseMessage response;

      // Act
      final httpResponse = ResponseBody.fromString(
        request.toJson(),
        200,
      );

      when(dioAdapterMock.fetch(any, any, any))
          .thenAnswer((_) async => httpResponse);

      var client = Account(dio);

      response = await client.getById(request.accountId, "any-user-token");

      // Assert
      expect(response.accountId, request.accountId);
    });
  });
}
