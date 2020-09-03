import 'dart:convert';

import 'package:flutter/foundation.dart';

class FinancialTransactionRequestMessage {
  ///  Variáveis Personalizadas
  List<Transactions> transactions;

  FinancialTransactionRequestMessage({
    this.transactions,
  });

  FinancialTransactionRequestMessage copyWith({
    List<Transactions> transactions,
  }) {
    return FinancialTransactionRequestMessage(
      transactions: transactions ?? this.transactions,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'transactions': transactions?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory FinancialTransactionRequestMessage.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return FinancialTransactionRequestMessage(
      transactions: List<Transactions>.from(
          map['transactions']?.map((x) => Transactions.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory FinancialTransactionRequestMessage.fromJson(String source) =>
      FinancialTransactionRequestMessage.fromMap(json.decode(source));

  @override
  String toString() =>
      'FinancialTransactionRequestMessage(transactions: $transactions)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is FinancialTransactionRequestMessage &&
        listEquals(o.transactions, transactions);
  }

  @override
  int get hashCode => transactions.hashCode;
}

class Transactions {
  int id;

  Transactions({
    this.id,
  });

  Transactions copyWith({
    int id,
  }) {
    return Transactions(
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
    };
  }

  factory Transactions.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Transactions(
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Transactions.fromJson(String source) =>
      Transactions.fromMap(json.decode(source));

  @override
  String toString() => 'Transactions(id: $id)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Transactions && o.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
