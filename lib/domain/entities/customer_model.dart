import 'dart:convert';

import 'package:iugu/domain/entities/data_entry/custom_variables.dart';
import 'package:iugu/domain/entities/payment_method_model.dart';

class CustomersModel {
  int totalItems;
  List<CustomerModel>? items;
  CustomersModel({
    this.totalItems = 0,
    this.items,
  });

  CustomersModel copyWith({
    int? totalItems,
    List<CustomerModel>? items,
  }) {
    return CustomersModel(
      totalItems: totalItems ?? this.totalItems,
      items: items ?? this.items,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'total_items': totalItems,
      'items': items?.map((x) => x.toMap()).toList(),
    };
  }

  factory CustomersModel.fromMap(Map<String, dynamic> map) {
    return CustomersModel(
      totalItems: map['total_items'] ?? map['totalItems'],
      items: List<CustomerModel>.from(map['items']?.map((x) => CustomerModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomersModel.fromJson(String source) => CustomersModel.fromMap(json.decode(source));

  @override
  String toString() => 'CustomersModel(totalItems: $totalItems, items: $items)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CustomersModel && o.totalItems == totalItems;
  }

  @override
  int get hashCode => totalItems.hashCode ^ items.hashCode;
}

class CustomerModel {
  String? id;
  String? email;
  String? name;
  String? notes;
  String? createdAt;
  String? updatedAt;
  List<CustomVariables>? customVariables;
  String? zipCode;
  String? number;
  String? complement;
  String? cpfCnpj;
  String? ccEmails;
  String? phone;
  String? phonePrefix;
  String? defaultPaymentMethodId;
  String? proxyPaymentsFromCustomerId;
  String? city;
  String? state;
  String? district;
  String? street;
  List<PaymentMethodModel>? paymentMethods;

  CustomerModel({
    this.id,
    this.email,
    this.name,
    this.notes,
    this.createdAt,
    this.updatedAt,
    this.customVariables,
    this.zipCode,
    this.number,
    this.complement,
    this.cpfCnpj,
    this.ccEmails,
    this.phone,
    this.phonePrefix,
    this.defaultPaymentMethodId,
    this.proxyPaymentsFromCustomerId,
    this.city,
    this.state,
    this.district,
    this.street,
    this.paymentMethods,
  });

  CustomerModel copyWith({
    String? id,
    String? email,
    String? name,
    String? notes,
    String? createdAt,
    String? updatedAt,
    List<CustomVariables>? customVariables,
    String? zipCode,
    String? number,
    String? complement,
    String? cpfCnpj,
    String? ccEmails,
    String? phone,
    String? phonePrefix,
    String? defaultPaymentMethodId,
    String? proxyPaymentsFromCustomerId,
    String? city,
    String? state,
    String? district,
    String? street,
    List<PaymentMethodModel>? paymentMethods,
  }) {
    return CustomerModel(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      customVariables: customVariables ?? this.customVariables,
      zipCode: zipCode ?? this.zipCode,
      number: number ?? this.number,
      complement: complement ?? this.complement,
      cpfCnpj: cpfCnpj ?? this.cpfCnpj,
      ccEmails: ccEmails ?? this.ccEmails,
      phone: phone ?? this.phone,
      phonePrefix: phonePrefix ?? this.phonePrefix,
      defaultPaymentMethodId:
          defaultPaymentMethodId ?? this.defaultPaymentMethodId,
      proxyPaymentsFromCustomerId:
          proxyPaymentsFromCustomerId ?? this.proxyPaymentsFromCustomerId,
      city: city ?? this.city,
      state: state ?? this.state,
      district: district ?? this.district,
      street: street ?? this.street,
      paymentMethods: paymentMethods ?? this.paymentMethods,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'notes': notes,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'custom_variables': customVariables?.map((x) => x.toJson()).toList(),
      'zip_code': zipCode,
      'number': number,
      'complement': complement,
      'cpf_cnpj': cpfCnpj,
      'cc_emails': ccEmails,
      'phone': phone,
      'phone_prefix': phonePrefix,
      'default_payment_method_id': defaultPaymentMethodId,
      'proxy_payments_from_customer_id': proxyPaymentsFromCustomerId,
      'city': city,
      'state': state,
      'district': district,
      'street': street,
      'payment_methods': paymentMethods?.map((x) => x.toJson()).toList(),
    };
  }

  factory CustomerModel.fromMap(Map<String, dynamic> map) {
    return CustomerModel(
      id: map['id'],
      email: map['email'],
      name: map['name'],
      notes: map['notes'],
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
      customVariables: List<CustomVariables>.from(map['custom_variables']?.map((x) => CustomVariables.fromMap(x))),
      zipCode: map['zip_code'],
      number: map['number'] != null
          ? map['number'] is String
              ? int.parse(map['number'])
              : map['number']
          : null,
      complement: map['complement'],
      cpfCnpj: map['cpf_cnpj'],
      ccEmails: map['cc_emails'],
      phone: map['phone'],
      phonePrefix: map['phone_prefix'],
      defaultPaymentMethodId: map['default_payment_method_id'],
      proxyPaymentsFromCustomerId: map['proxy_payments_from_customer_id'],
      city: map['city'],
      state: map['state'],
      district: map['district'],
      street: map['street'],
      paymentMethods: List<PaymentMethodModel>.from(
          map['payment_methods']?.map((x) => PaymentMethodModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerModel.fromJson(String source) => CustomerModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CustomerModel(id: $id, email: $email, name: $name, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt, customVariables: $customVariables, zipCode: $zipCode, number: $number, complement: $complement, cpfCnpj: $cpfCnpj, ccEmails: $ccEmails, phone: $phone, phonePrefix: $phonePrefix, defaultPaymentMethodId: $defaultPaymentMethodId, proxyPaymentsFromCustomerId: $proxyPaymentsFromCustomerId, city: $city, state: $state, district: $district, street: $street, paymentMethods: $paymentMethods)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CustomerModel &&
        o.id == id &&
        o.email == email &&
        o.name == name &&
        o.notes == notes &&
        o.createdAt == createdAt &&
        o.updatedAt == updatedAt &&
        o.zipCode == zipCode &&
        o.number == number &&
        o.complement == complement &&
        o.cpfCnpj == cpfCnpj &&
        o.ccEmails == ccEmails &&
        o.phone == phone &&
        o.phonePrefix == phonePrefix &&
        o.defaultPaymentMethodId == defaultPaymentMethodId &&
        o.proxyPaymentsFromCustomerId == proxyPaymentsFromCustomerId &&
        o.city == city &&
        o.state == state &&
        o.district == district &&
        o.street == street &&
        o.paymentMethods == paymentMethods;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        email.hashCode ^
        name.hashCode ^
        notes.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        customVariables.hashCode ^
        zipCode.hashCode ^
        number.hashCode ^
        complement.hashCode ^
        cpfCnpj.hashCode ^
        ccEmails.hashCode ^
        phone.hashCode ^
        phonePrefix.hashCode ^
        defaultPaymentMethodId.hashCode ^
        proxyPaymentsFromCustomerId.hashCode ^
        city.hashCode ^
        state.hashCode ^
        district.hashCode ^
        street.hashCode ^
        paymentMethods.hashCode;
  }
}
