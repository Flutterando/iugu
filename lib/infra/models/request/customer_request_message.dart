import 'dart:convert';

import 'package:iugu/domain/entities/data_entry/custom_variables.dart';

class CustomerRequestMessage {
  /// E-Mail do Cliente
  String email;

  /// Nome do Cliente
  String name;

  /// E-Mail do Cliente
  String cpfOrCnpj;

  /// Endereços de E-mail para cópia separados por vírgula.
  String withCopyEmails;

  /// Anotações Gerais do Cliente
  String notes;

  ///  Variáveis Personalizadas
  List<CustomVariables> customVariables;

  /// CEP do cliente
  String zipCode;

  /// Número do endereço do cliente
  int number;

  /// Complemento do endereço
  String complement;

  CustomerRequestMessage({
    this.email,
    this.name,
    this.cpfOrCnpj,
    this.withCopyEmails,
    this.notes,
    this.customVariables,
    this.zipCode,
    this.number,
    this.complement,
  });

  CustomerRequestMessage copyWith({
    String email,
    String name,
    String cpfOrCnpj,
    String withCopyEmails,
    String notes,
    List<CustomVariables> customVariables,
    String zipCode,
    int number,
    String complement,
  }) {
    return CustomerRequestMessage(
      email: email ?? this.email,
      name: name ?? this.name,
      cpfOrCnpj: cpfOrCnpj ?? this.cpfOrCnpj,
      withCopyEmails: withCopyEmails ?? this.withCopyEmails,
      notes: notes ?? this.notes,
      customVariables: customVariables ?? this.customVariables,
      zipCode: zipCode ?? this.zipCode,
      number: number ?? this.number,
      complement: complement ?? this.complement,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'cpf_cnpj': cpfOrCnpj,
      'cc_emails': withCopyEmails,
      'notes': notes,
      'custom_variables': customVariables?.map((x) => x?.toMap())?.toList(),
      'zip_code': zipCode,
      'number': number,
      'complement': complement,
    };
  }

  factory CustomerRequestMessage.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CustomerRequestMessage(
      email: map['email'],
      name: map['name'],
      cpfOrCnpj: map['cpf_cnpj'],
      withCopyEmails: map['cc_emails'],
      notes: map['notes'],
      customVariables: List<CustomVariables>.from(
          map['custom_variables']?.map((x) => CustomVariables.fromMap(x))),
      zipCode: map['zip_code'],
      number: map['number'],
      complement: map['complement'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerRequestMessage.fromJson(String source) =>
      CustomerRequestMessage.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CustomerRequestMessage(email: $email, name: $name, cpfOrCnpj: $cpfOrCnpj, withCopyEmails: $withCopyEmails, notes: $notes, customVariables: $customVariables, zipCode: $zipCode, number: $number, complement: $complement)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CustomerRequestMessage &&
        o.email == email &&
        o.name == name &&
        o.cpfOrCnpj == cpfOrCnpj &&
        o.withCopyEmails == withCopyEmails &&
        o.notes == notes &&
        o.zipCode == zipCode &&
        o.number == number &&
        o.complement == complement;
  }

  @override
  int get hashCode {
    return email.hashCode ^
        name.hashCode ^
        cpfOrCnpj.hashCode ^
        withCopyEmails.hashCode ^
        notes.hashCode ^
        customVariables.hashCode ^
        zipCode.hashCode ^
        number.hashCode ^
        complement.hashCode;
  }
}
