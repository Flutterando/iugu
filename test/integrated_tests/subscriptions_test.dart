import 'package:test/test.dart';
import 'package:iugu/domain/entities/customer_model.dart';
import 'package:iugu/domain/entities/plan_models_list.dart';
import 'package:iugu/domain/entities/subscription_model.dart';
import 'package:iugu/infra/repositories/plans.dart';
import 'package:iugu/infra/repositories/subscription.dart';
import 'package:iugu/iugu.dart';
import 'package:iugu/utils/constantes.dart';
import 'package:uuid/uuid.dart';

import 'data_builder/data_builder.dart';

//Assinaturas
void main() {
  group("subscriptions_test", () {
    Plans _planApi;
    Subscription _subscriptionApi;
    Customer _customerApi;
    PlanModel _createdPlan;
    CustomerModel _createdCustomer;

    setUp(() async {
      _planApi = Plans(IuguClientData.createClient);
      _subscriptionApi = Subscription(IuguClientData.createClient);
      _customerApi = Customer(IuguClientData.createClient);

      var radomPlan = Uuid().v1();
      _createdPlan = await _planApi.create(
          plan: PlanRequestMessage(
              name: "$radomPlan-12x",
              uniqueIdentifier: "$radomPlan-Plan",
              cycle: 1,
              intervalType: "months",
              valueInCents: 0,
              currencyTypeName: "BRL",
              paymentMethod: PaymentMethod.BANK_SLIP));

      var customer = CustomerRequestMessage(
        email: "anyemail@email.com",
        name: "Client Name",
      );

      _createdCustomer = await _customerApi.create(request: customer);
    });

    tearDown(() {
      _planApi.dispose();
      _subscriptionApi.dispose();
      _customerApi.dispose();
    });

    test('Create_a_new_subscription', () async {
      var subscriptionRequest = await _subscriptionApi.get();

      var subscriptionItems = [
        SubscriptionSubitem(
            description: "Mensalidade",
            priceCents: 65000,
            quantity: 1,
            recurrent: true)
      ];

      var request = new SubscriptionRequestMessage(
          customerId: _createdCustomer.id,
          planId: _createdPlan.identifier,
          isCreditBased: false,
          subitems: subscriptionItems);

      // Act
      var subscription = await _subscriptionApi.create(request: request);

      // Assert
      expect(subscription.id, isNot(null));
      expect(subscription.planIdentifier, _createdPlan.identifier);
    });

    test('Suspended_a_subscription', () async {
      var subscriptionRequest = await _subscriptionApi.get();

      var subscriptionItems = [
        SubscriptionSubitem(
            description: "Mensalidade",
            priceCents: 65000,
            quantity: 1,
            recurrent: true)
      ];

      var request = new SubscriptionRequestMessage(
          customerId: _createdCustomer.id,
          planId: _createdPlan.identifier,
          isCreditBased: false,
          subitems: subscriptionItems);

      // Act
      var subscription = await _subscriptionApi.create(request: request);

      var suspendendSubscription =
          await _subscriptionApi.suspend(subscription.id);

      // Assert
      expect(suspendendSubscription.suspended, true);
    });

    //becarrefull with TimeOut
    test('Change_a_subscription_plan', () async {
      var subscriptionRequest = await _subscriptionApi.get();

      var subscriptionItems = [
        SubscriptionSubitem(
            description: "Mensalidade",
            priceCents: 65000,
            quantity: 1,
            recurrent: true)
      ];

      var request = new SubscriptionRequestMessage(
          customerId: _createdCustomer.id,
          planId: _createdPlan.identifier,
          isCreditBased: false,
          subitems: subscriptionItems);

      // Act
      var currentSubscription = await _subscriptionApi.create(request: request);

      var radomPlan = Uuid().v1();

      var newdPlan = await _planApi.create(
          plan: PlanRequestMessage(
              name: "$radomPlan-12x",
              uniqueIdentifier: "$radomPlan-Plan",
              cycle: 2,
              intervalType: "months",
              valueInCents: 200,
              currencyTypeName: "BRL",
              paymentMethod: PaymentMethod.BANK_SLIP));

      // Act
      var suspendendSubscription = await _subscriptionApi.changePlan(
          currentSubscription.id, newdPlan.identifier);

      // Assert
      expect(suspendendSubscription.priceCents,
          isNot(currentSubscription.priceCents));
    });
  });
}
