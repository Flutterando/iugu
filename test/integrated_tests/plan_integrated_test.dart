import 'package:test/test.dart';
import 'package:iugu/domain/entities/plan_models_list.dart';
import 'package:iugu/infra/repositories/plans.dart';
import 'package:iugu/iugu.dart';
import 'package:iugu/utils/constantes.dart';
import 'package:uuid/uuid.dart';

import 'data_builder/data_builder.dart';

void main() {
  group("plan_integrated_tests", () {
    test('List_all_plans', () async {
      // Arrange
      // Arrange
      var radomPlan = Uuid().v1();
      var planId = "$radomPlan-Plan";
      int originalCountPlans;
      var newCountPlans = 0;

      // Act
      var apiPlan = Plans(IuguClientData.createClient);

      var planRequest = PlanRequestMessage(
          name: "$radomPlan-12x",
          uniqueIdentifier: planId,
          cycle: 1,
          intervalType: GenerateCycleType.MONTHLY,
          valueInCents: 0,
          paymentMethod: PaymentMethod.BANK_SLIP);

      var currentPlans = await apiPlan.getAll(
          customApiToken: "74c265aedbfaea379bc0148fae9b5526");
      originalCountPlans = currentPlans.totalItems;
      var response = await apiPlan.create(
          plan: planRequest,
          customApiToken: "74c265aedbfaea379bc0148fae9b5526");

      var newPlan =
          await apiPlan.getByIdentifier(planIdentifier: response.identifier);
      newCountPlans = newPlan != null ? originalCountPlans + 1 : newCountPlans;

      // Assert
      expect(newCountPlans, greaterThan(originalCountPlans));
    });

    test('Create_a_valid_plan', () async {
      // Arrange
      // Arrange
      var radomPlan = Uuid().v1();
      var planId = "$radomPlan-Plan";
      PlanModel plan;

      // Act
      var apiPlan = Plans(IuguClientData.createClient);

      plan = await apiPlan.create(
        plan: PlanRequestMessage(
            name: "$radomPlan-12x",
            uniqueIdentifier: planId,
            cycle: 1,
            intervalType: GenerateCycleType.MONTHLY,
            valueInCents: 0,
            currencyTypeName: "BRL",
            paymentMethod: PaymentMethod.BANK_SLIP),
      );

      // Assert
      expect(plan, isNotNull);
      expect(plan.identifier, equals(planId));
    });
  });
}
