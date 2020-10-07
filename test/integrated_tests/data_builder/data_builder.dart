import 'package:iugu/domain/entities/address_model.dart';
import 'package:iugu/domain/entities/payer_model.dart';
import 'package:iugu/iugu.dart';

class PayerModelData {
  static PayerModel createValid() {
    return PayerModel(
      cpfOrCnpj: "23687237818",
      address: createValidAddress(),
      name: 'Vilson Dauinheimer',
    );
  }

  static AddressModel createValidAddress() {
    return AddressModel(
        zipCode: "01304-001",
        district: "Consolação",
        state: "São Paulo",
        street: "R. Augusta",
        number: "1598",
        city: "São Paulo",
        country: "Brasil");
  }
}

class IuguClientData {
  static IuguClient get createClient => IuguClient(
        properties: IuguProperties(
          apiKey: "d8c80978cd7fe15c9fcf6dc2f4fdd150",
          urlApi: "https://api.iugu.com/v1/",
        ),
      );
}
