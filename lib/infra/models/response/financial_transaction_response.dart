import 'dart:convert';

import 'package:flutter/foundation.dart';

class FinancialTransactionResponse {
  String totalItems;

  List<Items> items;

  List<Transactions> transactions;

  Total total;

  FinancialTransactionResponse({
    this.totalItems,
    this.items,
    this.transactions,
    this.total,
  });

  FinancialTransactionResponse copyWith({
    String totalItems,
    List<Items> items,
    List<Transactions> transactions,
    Total total,
  }) {
    return FinancialTransactionResponse(
      totalItems: totalItems ?? this.totalItems,
      items: items ?? this.items,
      transactions: transactions ?? this.transactions,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'totalItems': totalItems,
      'items': items?.map((x) => x?.toMap())?.toList(),
      'transactions': transactions?.map((x) => x?.toMap())?.toList(),
      'total': total?.toMap(),
    };
  }

  factory FinancialTransactionResponse.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return FinancialTransactionResponse(
      totalItems: map['totalItems'],
      items: List<Items>.from(map['items']?.map((x) => Items.fromMap(x))),
      transactions: List<Transactions>.from(
          map['transactions']?.map((x) => Transactions.fromMap(x))),
      total: Total.fromMap(map['total']),
    );
  }

  String toJson() => json.encode(toMap());

  factory FinancialTransactionResponse.fromJson(String source) =>
      FinancialTransactionResponse.fromMap(json.decode(source));

  @override
  String toString() {
    return 'FinancialTransactionResponse(totalItems: $totalItems, items: $items, transactions: $transactions, total: $total)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is FinancialTransactionResponse &&
        o.totalItems == totalItems &&
        listEquals(o.items, items) &&
        listEquals(o.transactions, transactions) &&
        o.total == total;
  }

  @override
  int get hashCode {
    return totalItems.hashCode ^
        items.hashCode ^
        transactions.hashCode ^
        total.hashCode;
  }
}

class Total {
  String advancedValue;

  String advanceFee;

  String receivedValue;

  Total({
    this.advancedValue,
    this.advanceFee,
    this.receivedValue,
  });

  Total copyWith({
    String advancedValue,
    String advanceFee,
    String receivedValue,
  }) {
    return Total(
      advancedValue: advancedValue ?? this.advancedValue,
      advanceFee: advanceFee ?? this.advanceFee,
      receivedValue: receivedValue ?? this.receivedValue,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'advanced_value': advancedValue,
      'advance_fee': advanceFee,
      'received_value': receivedValue,
    };
  }

  factory Total.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Total(
      advancedValue: map['advanced_value'],
      advanceFee: map['advance_fee'],
      receivedValue: map['received_value'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Total.fromJson(String source) => Total.fromMap(json.decode(source));

  @override
  String toString() =>
      'Total(advancedValue: $advancedValue, advanceFee: $advanceFee, receivedValue: $receivedValue)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Total &&
        o.advancedValue == advancedValue &&
        o.advanceFee == advanceFee &&
        o.receivedValue == receivedValue;
  }

  @override
  int get hashCode =>
      advancedValue.hashCode ^ advanceFee.hashCode ^ receivedValue.hashCode;
}

class Transactions extends Items {
  String advancedValue;

  String advanceFee;

  String receivedValue;

  Transactions({
    this.advancedValue,
    this.advanceFee,
    this.receivedValue,
  });

  Map<String, dynamic> toMap() {
    return {
      'advancedValue': advancedValue,
      'advanceFee': advanceFee,
      'receivedValue': receivedValue,
    };
  }

  factory Transactions.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Transactions(
      advancedValue: map['advancedValue'],
      advanceFee: map['advanceFee'],
      receivedValue: map['receivedValue'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Transactions.fromJson(String source) =>
      Transactions.fromMap(json.decode(source));

  @override
  String toString() =>
      'Transactions(advancedValue: $advancedValue, advanceFee: $advanceFee, receivedValue: $receivedValue)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Transactions &&
        o.advancedValue == advancedValue &&
        o.advanceFee == advanceFee &&
        o.receivedValue == receivedValue;
  }

  @override
  int get hashCode =>
      advancedValue.hashCode ^ advanceFee.hashCode ^ receivedValue.hashCode;
}

class Items {
  String id;

  String description;

  String scheduledDate;

  String invoiceId;

  String customerRef;

  String total;

  String taxes;

  String clientShare;

  String commission;

  String numberOfInstallments;

  String installment;

  Items({
    this.id,
    this.description,
    this.scheduledDate,
    this.invoiceId,
    this.customerRef,
    this.total,
    this.taxes,
    this.clientShare,
    this.commission,
    this.numberOfInstallments,
    this.installment,
  });

  Items copyWith({
    String id,
    String description,
    String scheduledDate,
    String invoiceId,
    String customerRef,
    String total,
    String taxes,
    String clientShare,
    String commission,
    String numberOfInstallments,
    String installment,
  }) {
    return Items(
      id: id ?? this.id,
      description: description ?? this.description,
      scheduledDate: scheduledDate ?? this.scheduledDate,
      invoiceId: invoiceId ?? this.invoiceId,
      customerRef: customerRef ?? this.customerRef,
      total: total ?? this.total,
      taxes: taxes ?? this.taxes,
      clientShare: clientShare ?? this.clientShare,
      commission: commission ?? this.commission,
      numberOfInstallments: numberOfInstallments ?? this.numberOfInstallments,
      installment: installment ?? this.installment,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'scheduled_date': scheduledDate,
      'invoice_id': invoiceId,
      'customer_ref': customerRef,
      'total': total,
      'taxes': taxes,
      'client_share': clientShare,
      'commission': commission,
      'number_of_installments': numberOfInstallments,
      'installment': installment,
    };
  }

  factory Items.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Items(
      id: map['id'],
      description: map['description'],
      scheduledDate: map['scheduled_date'],
      invoiceId: map['invoice_id'],
      customerRef: map['customer_ref'],
      total: map['total'],
      taxes: map['taxes'],
      clientShare: map['client_share'],
      commission: map['commission'],
      numberOfInstallments: map['number_of_installments'],
      installment: map['installment'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Items.fromJson(String source) => Items.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Items(id: $id, description: $description, scheduledDate: $scheduledDate, invoiceId: $invoiceId, customerRef: $customerRef, total: $total, taxes: $taxes, clientShare: $clientShare, commission: $commission, numberOfInstallments: $numberOfInstallments, installment: $installment)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Items &&
        o.id == id &&
        o.description == description &&
        o.scheduledDate == scheduledDate &&
        o.invoiceId == invoiceId &&
        o.customerRef == customerRef &&
        o.total == total &&
        o.taxes == taxes &&
        o.clientShare == clientShare &&
        o.commission == commission &&
        o.numberOfInstallments == numberOfInstallments &&
        o.installment == installment;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        description.hashCode ^
        scheduledDate.hashCode ^
        invoiceId.hashCode ^
        customerRef.hashCode ^
        total.hashCode ^
        taxes.hashCode ^
        clientShare.hashCode ^
        commission.hashCode ^
        numberOfInstallments.hashCode ^
        installment.hashCode;
  }
}
