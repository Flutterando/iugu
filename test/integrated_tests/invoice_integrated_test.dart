import 'package:flutter_test/flutter_test.dart';
import 'package:iugu/domain/entities/data_entry/custom_variables.dart';
import 'package:iugu/domain/entities/invoice_model.dart';
import 'package:iugu/domain/entities/payer_model.dart';
import 'package:iugu/domain/entities/subscription_model.dart';
import 'package:iugu/infra/repositories/plans.dart';
import 'package:iugu/infra/repositories/subscription.dart';
import 'package:iugu/iugu.dart';
import 'package:iugu/utils/constantes.dart';
import 'package:uuid/uuid.dart';

import 'data_builder/data_builder.dart';

void main() {
  group("invoice_integrated_test", () {
    PayerModel _payer = PayerModelData.createValid();
    test('Create_a_valid_invoice', () async {
      // Arrange
      InvoiceModel invoice;

      var customVariables = [
        CustomVariables(name: "TaxaIugu", value: "2,50"),
        CustomVariables(name: "TaxaPlataformaEdux", value: "1,00"),
      ];

      var earlyPaymentDiscounts = [
        EarlyPaymentDiscounts(days: 10, percent: "8.2"),
        EarlyPaymentDiscounts(days: 5, percent: "5")
      ];

      var invoiceDate = DateTime.now().add(Duration(days: 2));

      var customer = CustomerRequestMessage(
          email: "anyemail@email.com",
          name: "Client Name",
          customVariables: customVariables);

      // Act
      var apiInvoice = Invoice(IuguClientData.createClient);
      var apiCustomer = Customer(IuguClientData.createClient);
      var apiSubscription = Subscription(IuguClientData.createClient);
      var apiPlan = Plans(IuguClientData.createClient);

      var customerResponse = await apiCustomer.create(request: customer);
      var radomPlan = Uuid().v1();
      var plan = await apiPlan.create(
          plan: PlanRequestMessage(
              name: "$radomPlan-12x",
              uniqueIdentifier: "$radomPlan-Plan",
              cycle: 1,
              intervalType: "months",
              valueInCents: 0,
              currencyTypeName: "BRL",
              paymentMethod: PaymentMethod.BANK_SLIP));

      var subscriptionItems = [
        SubscriptionSubitem(
            description: "Mensalidade",
            priceCents: 65000,
            quantity: 1,
            recurrent: true)
      ];
      var subscription = await apiSubscription.create(
          request: SubscriptionRequestMessage(
              customerId: customerResponse.id,
              planId: plan.identifier,
              isCreditBased: false,
              customVariables: customVariables,
              subitems: subscriptionItems));

      var invoiceItems = [
        Item(description: "Mensalidade", priceCents: 65000, quantity: 1)
      ];

      invoice = await apiInvoice.create(
        email: "anyemail@gmail.com.br",
        dueDate: invoiceDate,
        items: invoiceItems,
        subscriptionId: subscription.id,
        customVariables: customVariables,
        payer: _payer,
        earlyPaymentDiscount: true,
        earlyPaymentDiscounts: earlyPaymentDiscounts,
      );

      // Assert
      var date = DateTime.parse(invoice.dueDate);
      expect(invoice, isNotNull);
      expect(date.day, equals(invoiceDate.day));
      expect(date.month, equals(invoiceDate.month));
      expect(date.year, equals(invoiceDate.year));
    });

    test('Create_a_new_invoice_and_cancel_after', () async {
      // Arrange
      InvoiceModel invoice;

      var customVariables = [
        CustomVariables(name: "TaxaIugu", value: "2,50"),
        CustomVariables(name: "TaxaPlataformaEdux", value: "1,00"),
      ];

      var invoiceDate = DateTime.now().add(Duration(days: 2));

      var dtTemp = invoiceDate.add(Duration(days: 3));
      var newDate = '${dtTemp.year}-${dtTemp.month}-${dtTemp.day}';

      var customer = CustomerRequestMessage(
          email: "anyemail@email.com",
          name: "Client Name",
          customVariables: customVariables);

      // Act
      var apiInvoice = Invoice(IuguClientData.createClient);
      var apiCustomer = Customer(IuguClientData.createClient);
      var apiSubscription = Subscription(IuguClientData.createClient);
      var apiPlan = Plans(IuguClientData.createClient);

      var customerResponse = await apiCustomer.create(request: customer);

      var radomPlan = Uuid().v1();

      var plan = await apiPlan.create(
          plan: PlanRequestMessage(
              name: "$radomPlan-12x",
              uniqueIdentifier: "$radomPlan-Plan",
              cycle: 1,
              intervalType: "months",
              valueInCents: 0,
              currencyTypeName: "BRL",
              paymentMethod: PaymentMethod.BANK_SLIP));

      var subscriptionItems = [
        SubscriptionSubitem(
            description: "Mensalidade",
            priceCents: 65000,
            quantity: 1,
            recurrent: true)
      ];
      var subscription = await apiSubscription.create(
          request: SubscriptionRequestMessage(
              customerId: customerResponse.id,
              planId: plan.identifier,
              isCreditBased: false,
              customVariables: customVariables,
              subitems: subscriptionItems));

      var invoiceItems = [
        Item(description: "Mensalidade", priceCents: 65000, quantity: 1)
      ];

      var current = await apiInvoice.create(
        email: "anyemail@gmail.com.br",
        dueDate: invoiceDate,
        items: invoiceItems,
        subscriptionId: subscription.id,
        customVariables: customVariables,
        payer: _payer,
        earlyPaymentDiscount: false,
      );

      invoice = await apiInvoice.duplicate(
          id: current.id,
          data: InvoiceDuplicateRequestMessage(newDueDate: newDate));

      // Assert
      expect(invoice, isNotNull);
    });
  });
}
