import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:iugu/infra/repositories/market_place.dart';
import 'package:iugu/iugu.dart';
import 'package:mockito/mockito.dart';

import 'data_builder/data_builder.dart';

// Mock class
class DioAdapterMock extends Mock implements HttpClientAdapter {}

void main() {
  final Dio dio = Dio();
  DioAdapterMock dioAdapterMock;

  setUp(() {
    dioAdapterMock = DioAdapterMock();
    dio.httpClientAdapter = dioAdapterMock;
  });

  group("market_place_integrated_test", () {
    test('Create_a_under_acoount_with_success', () async {
      final httpResponse = ResponseBody.fromString(
        AccountResponseMessage(name: 'Vilson Dauinheimer').toJson(),
        200,
      );

      when(dioAdapterMock.fetch(any, any, any))
          .thenAnswer((_) async => httpResponse);

      // Arrange
      var request = AccountRequestMessage(
          name: "any_market_place_under_account@gmail.com",
          commissionPercent: 10);

      AccountResponseMessage response;
      // Act

      var client = new MarketPlace(
        IuguClientData.createClient,
        dio,
      );

      response = await client.createUnderAccount(underAccount: request);

      // Assert
      expect(response.name, equals('Vilson Dauinheimer'));
    });

    test('Get_all_accounts_in_marketplace_with_success', () async {
      // Arrange
      final httpResponse = ResponseBody.fromString(
        MarketplaceAccountsResponse(totalItems: 1, accounts: [
          MarketPlaceAccountItem(id: "1"),
        ]).toJson(),
        200,
      );

      when(dioAdapterMock.fetch(any, any, any))
          .thenAnswer((_) async => httpResponse);

      MarketplaceAccountsResponse response;

      // Act
      var client = new MarketPlace(
        IuguClientData.createClient,
        dio,
      );

      response = await client.getAllSubAccounts();

      // Assert
      expect(response, isNotNull);
    });

    test('Get_all_accounts_in_marketplace_paggeed_with_success', () async {
      // Arrange
      final httpResponse = ResponseBody.fromString(
        '{\"totalItems\":0, \"items\":[]}',
        200,
      );

      when(dioAdapterMock.fetch(any, any, any))
          .thenAnswer((_) async => httpResponse);

      PaggedResponseMessage<MarketPlaceAccountItem> response;

      // Act
      var client = new MarketPlace(
        IuguClientData.createClient,
        dio,
      );

      response = await client.getAllSubAccountsWithLimit(
        customApiToken: "74c265aedbfaea379bc0148fae9b5526",
      );

      // Assert
      expect(response, isNotNull);
    });
  });
}
