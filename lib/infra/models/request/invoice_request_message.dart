import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:iugu/domain/entities/data_entry/custom_variables.dart';
import 'package:iugu/domain/entities/data_entry/logs.dart';
import 'package:iugu/domain/entities/invoice_model.dart';
import 'package:iugu/domain/entities/payer_model.dart';

class InvoiceRequestMessage {
  /// E-Mail do cliente
  String email; // { get; }

  /// Data de Expiração (DD/MM/AAAA)
  String dueDate; // { get; }

  ///  Itens da Fatura
  List<Item> items; // { get; }

  /// Informações do Cliente para o Anti Fraude ou Boleto
  PayerModel payer;

  /// (opcional) Cliente é redirecionado para essa URL após efetuar o pagamento da Fatura pela página de Fatura da Iugu
  String returnUrl;

  /// (opcional) Cliente é redirecionado para essa URL se a Fatura que estiver acessando estiver expirada
  String expiredUrl;

  /// (opcional) URL chamada para todas as notificações de Fatura, assim como os webhooks (Gatilhos) são chamados
  String notificationUrl;

  /// (opcional) Valor dos Impostos em centavos
  int taxCents;

  /// (opcional) Booleano para Habilitar ou Desabilitar multa por atraso de pagamento
  bool enableLateFine;

  /// (opcional) Determine a multa a ser cobrada para pagamentos efetuados após a data de vencimento
  String latePaymentFine;

  /// (opcional) Booleano que determina se cobra ou não juros por dia de atraso. 1% ao mês pro rata.
  bool enableProportionalDailyTax;

  /// (opcional) Valor dos Descontos em centavos
  int discountCents;

  /// (opcional) ID do Cliente
  String customerId;

  /// (opcional) Booleano que ignora o envio do e-mail de cobrança
  bool ignoreDueDateMail;

  /// (opcional) Amarra esta Fatura com a Assinatura especificada
  String subscriptionId;

  /// (opcional) Método de pagamento que será disponibilizado para esta Fatura (‘all’, ‘credit_card’ ou ‘bank_slip’).
  /// Obs: Caso esta Fatura esteja atrelada à uma Assinatura, a prioridade é herdar o valor atribuído na Assinatura;
  /// caso esta esteja atribuído o valor ‘all’, o sistema considerará o payable_with da Fatura; se não, o sistema considerará o payable_with da Assinatura.
  String paymentMethod;

  /// (opcional) Caso tenha o subscription_id, pode-se enviar o número de créditos a adicionar nessa Assinatura quando a Fatura for paga
  int credits;

  /// (opcional) Logs da Fatura
  List<Logs> logs;

  /// (opcional) Ativa ou desativa o desconto por pagamento antecipado
  bool enableEarlyPaymentDiscount;

  /// (opcional) Quantidade de dias de antecedência para o pagamento receber o desconto
  List<EarlyPaymentDiscounts> earlyPaymentDiscounts;

  /// (opcional) Variáveis Personalizadas
  List<CustomVariables> customVariables;

  InvoiceRequestMessage({
    this.payer,
    this.returnUrl,
    this.expiredUrl,
    this.notificationUrl,
    this.taxCents,
    this.enableLateFine,
    this.latePaymentFine,
    this.enableProportionalDailyTax,
    this.discountCents,
    this.customerId,
    this.ignoreDueDateMail,
    this.subscriptionId,
    this.paymentMethod,
    this.credits,
    this.logs,
    this.enableEarlyPaymentDiscount,
    this.earlyPaymentDiscounts,
    this.customVariables,
  });

  //  InvoiceRequestMessage(String email, DateTime dueDate, Item[] items)
  // {
  //     Email = email;
  //     DueDate = dueDate.ToString("dd/MM/yyyy");
  //     Items = items;
  // }

  InvoiceRequestMessage copyWith({
    PayerModel payer,
    String returnUrl,
    String expiredUrl,
    String notificationUrl,
    int taxCents,
    bool enableLateFine,
    String latePaymentFine,
    bool enableProportionalDailyTax,
    int discountCents,
    String customerId,
    bool ignoreDueDateMail,
    String subscriptionId,
    String paymentMethod,
    int credits,
    List<Logs> logs,
    bool enableEarlyPaymentDiscount,
    List<EarlyPaymentDiscounts> earlyPaymentDiscounts,
    List<CustomVariables> customVariables,
  }) {
    return InvoiceRequestMessage(
      payer: payer ?? this.payer,
      returnUrl: returnUrl ?? this.returnUrl,
      expiredUrl: expiredUrl ?? this.expiredUrl,
      notificationUrl: notificationUrl ?? this.notificationUrl,
      taxCents: taxCents ?? this.taxCents,
      enableLateFine: enableLateFine ?? this.enableLateFine,
      latePaymentFine: latePaymentFine ?? this.latePaymentFine,
      enableProportionalDailyTax:
          enableProportionalDailyTax ?? this.enableProportionalDailyTax,
      discountCents: discountCents ?? this.discountCents,
      customerId: customerId ?? this.customerId,
      ignoreDueDateMail: ignoreDueDateMail ?? this.ignoreDueDateMail,
      subscriptionId: subscriptionId ?? this.subscriptionId,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      credits: credits ?? this.credits,
      logs: logs ?? this.logs,
      enableEarlyPaymentDiscount:
          enableEarlyPaymentDiscount ?? this.enableEarlyPaymentDiscount,
      earlyPaymentDiscounts:
          earlyPaymentDiscounts ?? this.earlyPaymentDiscounts,
      customVariables: customVariables ?? this.customVariables,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'payer': payer?.toMap(),
      'return_url': returnUrl,
      'expired_url': expiredUrl,
      'notification_url': notificationUrl,
      'tax_cents': taxCents,
      'fines': enableLateFine,
      'late_payment_fine': latePaymentFine,
      'per_day_interest': enableProportionalDailyTax,
      'discount_cents': discountCents,
      'customer_id': customerId,
      'ignore_due_date_mail': ignoreDueDateMail,
      'subscription_id': subscriptionId,
      'payable_with': paymentMethod,
      'credits': credits,
      'logs': logs?.map((x) => x?.toMap())?.toList(),
      'early_payment_discount': enableEarlyPaymentDiscount,
      'early_payment_discounts':
          earlyPaymentDiscounts?.map((x) => x?.toMap())?.toList(),
      'custom_variables': customVariables?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory InvoiceRequestMessage.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return InvoiceRequestMessage(
      payer: PayerModel.fromMap(map['payer']),
      returnUrl: map['return_url'],
      expiredUrl: map['expired_url'],
      notificationUrl: map['notification_url'],
      taxCents: map['tax_cents'],
      enableLateFine: map['fines'],
      latePaymentFine: map['late_payment_fine'],
      enableProportionalDailyTax: map['per_day_interest'],
      discountCents: map['discount_cents'],
      customerId: map['customer_id'],
      ignoreDueDateMail: map['ignore_due_date_mail'],
      subscriptionId: map['subscription_id'],
      paymentMethod: map['payable_with'],
      credits: map['credits'],
      logs: List<Logs>.from(map['logs']?.map((x) => Logs.fromMap(x))),
      enableEarlyPaymentDiscount: map['early_payment_discount'],
      earlyPaymentDiscounts: List<EarlyPaymentDiscounts>.from(
          map['early_payment_discounts']
              ?.map((x) => EarlyPaymentDiscounts.fromMap(x))),
      customVariables: List<CustomVariables>.from(
          map['custom_variables']?.map((x) => CustomVariables.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory InvoiceRequestMessage.fromJson(String source) =>
      InvoiceRequestMessage.fromMap(json.decode(source));

  @override
  String toString() {
    return 'InvoiceRequestMessage(payer: $payer, returnUrl: $returnUrl, expiredUrl: $expiredUrl, notificationUrl: $notificationUrl, taxCents: $taxCents, enableLateFine: $enableLateFine, latePaymentFine: $latePaymentFine, enableProportionalDailyTax: $enableProportionalDailyTax, discountCents: $discountCents, customerId: $customerId, ignoreDueDateMail: $ignoreDueDateMail, subscriptionId: $subscriptionId, paymentMethod: $paymentMethod, credits: $credits, logs: $logs, enableEarlyPaymentDiscount: $enableEarlyPaymentDiscount, earlyPaymentDiscounts: $earlyPaymentDiscounts, customVariables: $customVariables)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is InvoiceRequestMessage &&
        o.payer == payer &&
        o.returnUrl == returnUrl &&
        o.expiredUrl == expiredUrl &&
        o.notificationUrl == notificationUrl &&
        o.taxCents == taxCents &&
        o.enableLateFine == enableLateFine &&
        o.latePaymentFine == latePaymentFine &&
        o.enableProportionalDailyTax == enableProportionalDailyTax &&
        o.discountCents == discountCents &&
        o.customerId == customerId &&
        o.ignoreDueDateMail == ignoreDueDateMail &&
        o.subscriptionId == subscriptionId &&
        o.paymentMethod == paymentMethod &&
        o.credits == credits &&
        listEquals(o.logs, logs) &&
        o.enableEarlyPaymentDiscount == enableEarlyPaymentDiscount &&
        listEquals(o.earlyPaymentDiscounts, earlyPaymentDiscounts) &&
        listEquals(o.customVariables, customVariables);
  }

  @override
  int get hashCode {
    return payer.hashCode ^
        returnUrl.hashCode ^
        expiredUrl.hashCode ^
        notificationUrl.hashCode ^
        taxCents.hashCode ^
        enableLateFine.hashCode ^
        latePaymentFine.hashCode ^
        enableProportionalDailyTax.hashCode ^
        discountCents.hashCode ^
        customerId.hashCode ^
        ignoreDueDateMail.hashCode ^
        subscriptionId.hashCode ^
        paymentMethod.hashCode ^
        credits.hashCode ^
        logs.hashCode ^
        enableEarlyPaymentDiscount.hashCode ^
        earlyPaymentDiscounts.hashCode ^
        customVariables.hashCode;
  }
}
