import 'package:test/test.dart';
import 'package:iugu/domain/entities/customer_model.dart';
import 'package:iugu/domain/entities/data_entry/custom_variables.dart';
import 'package:iugu/domain/entities/payment_info_model.dart';
import 'package:iugu/infra/repositories/customer.dart';
import 'package:iugu/infra/repositories/payment_method.dart';
import 'package:iugu/infra/repositories/payment_token.dart';
import 'package:iugu/iugu.dart';
import 'package:iugu/utils/constantes.dart' as Consts;

import 'data_builder/data_builder.dart';

void main() {
  group("customer_integrated_test", () {
    test('Create_payment_methods_from_token', () async {
      // Arrange
      var paymentMethod = PaymentMethod(
          IuguClientData.createClient, '6DD884D094E74F0B9762267EDC7A8FA0');

      var paymentRequest = PaymentTokenRequest(
          accountId: "FAB1ECBDA24B4242ACCF520272FD8247",
          method: Consts.PaymentMethod.CREDIT_CARD,
          test: true,
          paymentData: PaymentInfoModel(
              firstName: "Rodrigo",
              lastName: "Couto",
              month: "01",
              year: "2028",
              number: "4111111111111111",
              verificationValue: "123"));

      PaymentTokenResponse paymentTokenResponse;

      // // Act
      var apiClient = PaymentToken(IuguClientData.createClient);
      paymentTokenResponse = await apiClient.create(paymentRequest);

      var result = await paymentMethod.create(
          'Teste 1', null, true, paymentTokenResponse.id, null);

      var paymentMethods = await paymentMethod.getAll();
      // Assert
      expect(paymentMethods, isNotEmpty);
    });

    test('Create_recover_payment_methods', () async {
      // Arrange
      var paymentMethod = PaymentMethod(
          IuguClientData.createClient, '385770B5795E4603A395DA9F2DE7AA05');

      var paymentMethods = await paymentMethod.getAll();
      // Assert
      expect(paymentMethods, isNotEmpty);
    });
  });
}
