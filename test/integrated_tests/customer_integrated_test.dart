import 'package:test/test.dart';
import 'package:iugu/domain/entities/customer_model.dart';
import 'package:iugu/domain/entities/data_entry/custom_variables.dart';
import 'package:iugu/iugu.dart';

import 'data_builder/data_builder.dart';

void main() {
  group("customer_integrated_test", () {
    test('Create_a_customer_with_success', () async {
      // Arrange
      List<CustomVariables> custom = [];
      custom.add(CustomVariables(name: "Tipo", value: "Developer"));
      custom.add(CustomVariables(name: "Representante", value: "Vilson Dauinheimer (RS)"));

      CustomerModel myCustomer;

      // Act
      var apiClient = Customer(IuguClientData.createClient);

      myCustomer = await apiClient.create(request: CustomerRequestMessage(email: "bwolfnoob@gmail.com", name: "Bwolf Teste 2 Flutter/Dart", notes: "teste da api em Flutter/Dart", customVariables: custom));

      // Assert
      expect(myCustomer.email, equals("bwolfnoob@gmail.com"));
      expect(myCustomer.id, isNotEmpty);
    });

    test('List_customers_with_success', () async {
      // Arrange

      CustomersModel myCustomer;

      // Act
      var apiClient = Customer(IuguClientData.createClient);

      myCustomer = await apiClient.get();

      // Assert
      expect(myCustomer, isNotNull);
      expect(myCustomer.items, isNotEmpty);
    });
  });
}
