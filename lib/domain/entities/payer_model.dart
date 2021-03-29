import 'dart:convert';

import 'address_model.dart';

/// Modelo que representa os dados do cliente que efetua o pagamento
class PayerModel {
  /// CPF ou CNPJ do Cliente
  String? cpfOrCnpj;

  /// Nome (utilizado como sacado em caso de pagamentos em boleto)
  String? name;

  /// Prefixo do Telefone (Ex: 11 para São Paulo)
  String? phonePrefix;

  /// Telefone
  String? phone;

  /// E-mail do Cliente
  String? email;

  /// Endereço do Cliente (utilizado em caso de pagamento em boleto)
  AddressModel? address;

  PayerModel({
    this.cpfOrCnpj,
    this.name,
    this.phonePrefix,
    this.phone,
    this.email,
    this.address,
  });

  PayerModel copyWith({
    String? cpfOrCnpj,
    String? name,
    String? phonePrefix,
    String? phone,
    String? email,
    AddressModel? address,
  }) {
    return PayerModel(
      cpfOrCnpj: cpfOrCnpj ?? this.cpfOrCnpj,
      name: name ?? this.name,
      phonePrefix: phonePrefix ?? this.phonePrefix,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cpf_cnpj': cpfOrCnpj,
      'name': name,
      'phone_prefix': phonePrefix,
      'phone': phone,
      'email': email,
      'address': address?.toMap(),
    };
  }

  factory PayerModel.fromMap(Map<String, dynamic> map) {
    return PayerModel(
      cpfOrCnpj: map['cpf_or_cnpj'],
      name: map['name'],
      phonePrefix: map['phone_prefix'],
      phone: map['phone'],
      email: map['email'],
      address: AddressModel.fromMap(map['address']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PayerModel.fromJson(String source) => PayerModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PayerModel(cpfOrCnpj: $cpfOrCnpj, name: $name, phonePrefix: $phonePrefix, phone: $phone, email: $email, address: $address)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PayerModel && o.cpfOrCnpj == cpfOrCnpj && o.name == name && o.phonePrefix == phonePrefix && o.phone == phone && o.email == email && o.address == address;
  }

  @override
  int get hashCode {
    return cpfOrCnpj.hashCode ^ name.hashCode ^ phonePrefix.hashCode ^ phone.hashCode ^ email.hashCode ^ address.hashCode;
  }
}
