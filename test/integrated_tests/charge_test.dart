import 'package:flutter_test/flutter_test.dart';
import 'package:iugu/domain/entities/invoice_item.dart';
import 'package:iugu/infra/repositories/charge.dart';
import 'package:iugu/iugu.dart';
import 'package:iugu/utils/constantes.dart';

import 'data_builder/data_builder.dart';

void main() {
  group("charge_test", () {
    test('valid', () async {
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
  });
}
