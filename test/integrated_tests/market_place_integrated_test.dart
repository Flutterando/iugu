import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:iugu/infra/repositories/market_place.dart';
import 'package:iugu/iugu.dart';

import 'data_builder/data_builder.dart';

// Mock class
class DioAdapterMock extends Mock implements HttpClientAdapter {}

class RequestOptionsFake extends Fake implements RequestOptions {}

class StreamUint8ListFake extends Fake implements Stream<Uint8List> {}

void main() {
  final Dio dio = Dio();
  late DioAdapterMock dioAdapterMock;

  setUpAll(() {
    registerFallbackValue<RequestOptions>(RequestOptionsFake());
    registerFallbackValue<Stream<Uint8List>>(StreamUint8ListFake());
  });

  setUp(() {
    dioAdapterMock = DioAdapterMock();
    dio.httpClientAdapter = dioAdapterMock;
  });

  group("market_place_integrated_test", () {
    test('Create_a_under_acoount_with_success', () async {
      final httpResponse = ResponseBody.fromString(
        AccountResponseMessage(accountId: '1', name: 'Vilson Dauinheimer').toJson(),
        200,
      );

      when(() => dioAdapterMock.fetch(any(), any(), any())).thenAnswer((_) async => httpResponse);

      // Arrange
      var request = AccountRequestMessage(name: "any_market_place_under_account@gmail.com", commissionPercent: 10);

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
          MarketPlaceAccountItem(id: "1", name: 'Vilson'),
        ]).toJson(),
        200,
      );

      // when(() => dioAdapterMock.fetch(any(), any(), any())).thenAnswer((_) async => httpResponse);
      when(() => dioAdapterMock.fetch(any(), any(), any())).thenAnswer((_) async => httpResponse);
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

      when(() => dioAdapterMock.fetch(any(), any(), any())).thenAnswer((_) async => httpResponse);

      PaggedResponseMessage<MarketPlaceAccountItem> response;

      // Act
      var client = new MarketPlace(
        IuguClientData.createClient,
        dio,
      );

      response = await client.getAllSubAccountsWithLimit(
        customApiToken: "3d000baf7565027456e5402c9fa1ac64",
      );

      // Assert
      expect(response, isNotNull);
    });
  });
}
