import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:iugu/domain/entities/invoice_item.dart';
import 'package:iugu/domain/entities/payer_model.dart';

class ChargeRequestMessage {
  /// Método de Pagamento (Atualmente só suporta bank_slip, que é o boleto) - Opicional se enviar o Token
  String method;

  /// ID do Token. Em caso de Marketplace, é possível enviar um token criado pela conta mestre - Opicional caso method seja bank_slip
  String token;

  /// ID da Forma de Pagamento do Cliente. Em caso de Marketplace, é possível enviar um customer_payment_method_id de um Cliente criado pela conta mestre
  /// Opcional caso method seja bank_slip ou utilize token)
  String customerPaymentMethodId;

  /// ID do Cliente. Utilizado para vincular a Fatura a um Cliente - Opcional
  String customerId;

  /// ID da Fatura a ser utilizada para pagamento - Opcional
  String invoiceId;

  /// E-mail do Cliente - Opcional caso seja enviado um invoice_id
  String email;

  /// Número de Parcelas (2 até 12), não é necessário passar 1 - Opcional
  int months;

  /// Valor dos Descontos em centavos. Funciona apenas para Cobranças Diretas criadas com Itens - Opcional
  int discountCents;

  /// Itens da Fatura que será gerada - Opcional caso seja enviado um invoice_id
  List<InvoiceItem> invoiceItems;

  /// Informações do Cliente para o Anti Fraude ou Boleto
  /// Necessário caso sua conta necessite de anti fraude ou para informações do boleto
  PayerModel payerCustomer;

  ChargeRequestMessage({
    this.method,
    this.token,
    this.customerPaymentMethodId,
    this.customerId,
    this.invoiceId,
    this.email,
    this.months,
    this.discountCents,
    this.invoiceItems,
    this.payerCustomer,
  });
  ChargeRequestMessage copyWith({
    String method,
    String token,
    String customerPaymentMethodId,
    String customerId,
    String invoiceId,
    String email,
    int months,
    int discountCents,
    List<InvoiceItem> invoiceItems,
    PayerModel payerCustomer,
  }) {
    return ChargeRequestMessage(
      method: method ?? this.method,
      token: token ?? this.token,
      customerPaymentMethodId:
          customerPaymentMethodId ?? this.customerPaymentMethodId,
      customerId: customerId ?? this.customerId,
      invoiceId: invoiceId ?? this.invoiceId,
      email: email ?? this.email,
      months: months ?? this.months,
      discountCents: discountCents ?? this.discountCents,
      invoiceItems: invoiceItems ?? this.invoiceItems,
      payerCustomer: payerCustomer ?? this.payerCustomer,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'method': method,
      'token': token,
      'customer_payment_method_id': customerPaymentMethodId,
      'customer_id': customerId,
      'invoice_id': invoiceId,
      'email': email,
      'months': months,
      'discount_cents': discountCents,
      'items': invoiceItems?.map((x) => x?.toMap())?.toList(),
      'payer': payerCustomer?.toMap(),
    };
  }

  factory ChargeRequestMessage.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ChargeRequestMessage(
      method: map['method'],
      token: map['token'],
      customerPaymentMethodId: map['customer_payment_method_id'],
      customerId: map['customer_id'],
      invoiceId: map['invoice_id'],
      email: map['email'],
      months: map['months'],
      discountCents: map['discount_cents'],
      invoiceItems: List<InvoiceItem>.from(
          map['items']?.map((x) => InvoiceItem.fromMap(x))),
      payerCustomer: PayerModel.fromMap(map['payer']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChargeRequestMessage.fromJson(String source) =>
      ChargeRequestMessage.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChargeRequestMessage(method: $method, token: $token, customerPaymentMethodId: $customerPaymentMethodId, customerId: $customerId, invoiceId: $invoiceId, email: $email, months: $months, discountCents: $discountCents, invoiceItems: $invoiceItems, payerCustomer: $payerCustomer)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ChargeRequestMessage &&
        o.method == method &&
        o.token == token &&
        o.customerPaymentMethodId == customerPaymentMethodId &&
        o.customerId == customerId &&
        o.invoiceId == invoiceId &&
        o.email == email &&
        o.months == months &&
        o.discountCents == discountCents &&
        listEquals(o.invoiceItems, invoiceItems) &&
        o.payerCustomer == payerCustomer;
  }

  @override
  int get hashCode {
    return method.hashCode ^
        token.hashCode ^
        customerPaymentMethodId.hashCode ^
        customerId.hashCode ^
        invoiceId.hashCode ^
        email.hashCode ^
        months.hashCode ^
        discountCents.hashCode ^
        invoiceItems.hashCode ^
        payerCustomer.hashCode;
  }
}
