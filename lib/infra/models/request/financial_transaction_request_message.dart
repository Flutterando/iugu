import 'dart:convert';

class FinancialTransactionRequestMessage {
  ///  Variáveis Personalizadas
  List<TransactionsRequest>? transactions;

  FinancialTransactionRequestMessage({
    this.transactions,
  });

  FinancialTransactionRequestMessage copyWith({
    List<TransactionsRequest>? transactions,
  }) {
    return FinancialTransactionRequestMessage(
      transactions: transactions ?? this.transactions,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'transactions': transactions?.map((x) => x.toMap()).toList(),
    };
  }

  factory FinancialTransactionRequestMessage.fromMap(Map<String, dynamic> map) {
    return FinancialTransactionRequestMessage(
      transactions: List<TransactionsRequest>.from(map['transactions']?.map((x) => TransactionsRequest.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory FinancialTransactionRequestMessage.fromJson(String source) => FinancialTransactionRequestMessage.fromMap(json.decode(source));

  @override
  String toString() => 'FinancialTransactionRequestMessage(transactions: $transactions)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is FinancialTransactionRequestMessage;
  }

  @override
  int get hashCode => transactions.hashCode;
}

class TransactionsRequest {
  int? id;

  TransactionsRequest({
    this.id,
  });

  TransactionsRequest copyWith({
    int? id,
  }) {
    return TransactionsRequest(
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
    };
  }

  factory TransactionsRequest.fromMap(Map<String, dynamic> map) {
    return TransactionsRequest(
      id: map['id'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionsRequest.fromJson(String source) => TransactionsRequest.fromMap(json.decode(source));

  @override
  String toString() => 'Transactions(id: $id)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is TransactionsRequest && o.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
