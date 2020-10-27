import 'package:test/test.dart';
import 'package:iugu/domain/entities/invoice_item.dart';
import 'package:iugu/domain/entities/payment_info_model.dart';
import 'package:iugu/infra/repositories/charge.dart';
import 'package:iugu/infra/repositories/payment_token.dart';
import 'package:iugu/iugu.dart';
import 'package:iugu/utils/constantes.dart';

import 'data_builder/data_builder.dart';

void main() {
  group("charge_test", () {
    test('valid bank_slip', () async {
      // Arrange
      var chargeRequest = new ChargeRequestMessage(
          method: PaymentMethod.BANK_SLIP,
          customerId: "D3652156004B44D9A638232B1EC787B1",
          email: "anyemail@gmail.com",
          invoiceItems: [
            InvoiceItem(
              description: "Mensalidade",
              priceCents: 100000,
              quantity: 1,
            )
          ],
          payerCustomer: PayerModelData.createValid());

      ChargeResponseMessage chargeTokenResponse;

      // Act
      var apiClient = Charge(IuguClientData.createClient);

      chargeTokenResponse = await apiClient.create(request: chargeRequest);

      // Assert
      expect(chargeTokenResponse.success, true);
      expect(chargeTokenResponse.url, isNot(null));
    });

    test('valid credit_cart_token', () async {
      // Arrange
      PaymentTokenResponse paymentTokenResponse;

      // // Act

      var paymentRequest = PaymentTokenRequest(
          accountId: "D3652156004B44D9A638232B1EC787B1",
          method: PaymentMethod.CREDIT_CARD,
          test: true,
          paymentData: PaymentInfoModel(
              firstName: "Rodrigo",
              lastName: "Couto",
              month: "01",
              year: "2028",
              number: "4111111111111111",
              verificationValue: "123"));

      var apiClient = PaymentToken(IuguClientData.createClient);
      paymentTokenResponse = await apiClient.create(paymentRequest);

      var chargeRequest = ChargeRequestMessage(
          // method: PaymentMethod.CREDIT_CARD,
          token: paymentTokenResponse.id,
          customerId: "6DD884D094E74F0B9762267EDC7A8FA0",
          email: "anyemail@gmail.com",
          invoiceItems: [
            InvoiceItem(
              description: "Mensalidade",
              priceCents: 100000,
              quantity: 1,
            )
          ],
          payerCustomer: PayerModelData.createValid());

      ChargeResponseMessage chargeTokenResponse;

      // Act

      var apiCharge = Charge(IuguClientData.createClient);

      chargeTokenResponse = await apiCharge.create(request: chargeRequest);

      // Assert
      expect(chargeTokenResponse.success, true);
      expect(chargeTokenResponse.url, isNot(null));
    });
  });
}
