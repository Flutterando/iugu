import 'package:iugu/infra/repositories/payment_method.dart';
import 'package:test/test.dart';
import 'package:iugu/domain/entities/invoice_item.dart';
import 'package:iugu/domain/entities/payment_info_model.dart';
import 'package:iugu/infra/repositories/charge.dart';
import 'package:iugu/infra/repositories/payment_token.dart';
import 'package:iugu/iugu.dart';
import 'package:iugu/utils/constantes.dart' as Consts;
import 'data_builder/data_builder.dart';

void main() {
  group("charge_test", () {
    test('valid bank_slip', () async {
      // Arrange
      var paymentMethod = PaymentMethod(IuguClientData.createClient, '6DD884D094E74F0B9762267EDC7A8FA0');

      var paymentRequest = PaymentTokenRequest(
        accountId: "FAB1ECBDA24B4242ACCF520272FD8247",
        method: Consts.PaymentMethod.CREDIT_CARD,
        test: true,
        paymentData: PaymentInfoModel(
          firstName: "Rodrigo",
          lastName: "Couto",
          month: "01",
          year: "2028",
          number: "38520000023237",
          verificationValue: "123",
        ),
      );

      PaymentTokenResponse paymentTokenResponse;

      // // Act
      var apiPaymentToken = PaymentToken(IuguClientData.createClient);
      paymentTokenResponse = await apiPaymentToken.create(paymentRequest);

      var result = await paymentMethod.create('Teste 1', null, true, paymentTokenResponse.id, null);

      //
      var chargeRequest = new ChargeRequestMessage(
          //  method: PaymentMethod.CREDIT_CARD,
          customerPaymentMethodId: result.id ?? '',
          // customerId: "6DD884D094E74F0B9762267EDC7A8FA0",
          email: "bwolfnoob@gmail.com",
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

      chargeTokenResponse = await apiClient.create(
        request: chargeRequest,
        apiUserToken: '29bba3f12bfcbaccb069a6e490b29f16',
      );

      // Assert
      expect(chargeTokenResponse.url, isNot(null));
    });

    test('valid credit_cart_token', () async {
      // Arrange
      PaymentTokenResponse paymentTokenResponse;
      // // Act
      var paymentRequest = PaymentTokenRequest(accountId: "D3652156004B44D9A638232B1EC787B1", method: Consts.PaymentMethod.CREDIT_CARD, test: true, paymentData: PaymentInfoModel(firstName: "Rodrigo", lastName: "Couto", month: "01", year: "2028", number: "4111111111111111", verificationValue: "123"));

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
      // try {
      //   chargeTokenResponse = await apiCharge.create(
      //       request: chargeRequest,
      //       apiUserToken: '3d000baf7565027456e5402c9fa1ac64');
      // } catch (e) {}

      chargeTokenResponse = await apiCharge.create(request: chargeRequest);

      // Assert
      expect(chargeTokenResponse.success, true);
      expect(chargeTokenResponse.url, isNot(null));
    });
  });
}
