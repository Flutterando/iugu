import 'package:flutter_test/flutter_test.dart';
import 'package:iugu/domain/entities/payment_info_model.dart';
import 'package:iugu/infra/repositories/payment_token.dart';
import 'package:iugu/iugu.dart';
import 'package:iugu/utils/constantes.dart';

import 'data_builder/data_builder.dart';

void main() {
  group("tokenizacao_test", () {
    test('Create_a_new_payment_token_with_success', () async {
      // Arrange
      var expectedResponse = PaymentTokenResponse(
          id: "e06809b9da0a3118fa282a18c1f5dc09",
          method: PaymentMethod.CREDIT_CARD);

      var paymentRequest = PaymentTokenRequest(
          accountId: "FAB1ECBDA24B4242ACCF520272FD8247",
          method: PaymentMethod.CREDIT_CARD,
          test: true,
          paymentData: PaymentInfoModel(
              firstName: "Rodrigo",
              lastName: "Couto",
              month: "12",
              year: "2021",
              number: "4111111111111111",
              verificationValue: "123"));

      PaymentTokenResponse paymentTokenResponse;

      // Act
      var apiClient = PaymentToken(IuguClientData.createClient);
      paymentTokenResponse = await apiClient.create(paymentRequest);

      // Assert
      expect(paymentTokenResponse.id, isNot(null));
      expect(paymentTokenResponse.method, expectedResponse.method);
    });
  });
}
