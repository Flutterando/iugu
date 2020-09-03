import 'dart:convert';

import 'package:iugu/domain/entities/payment_info_model.dart';

class PaymentTokenRequest {
  /// ID de sua Conta na Iugu (O ID de sua conta pode ser encontrado clicando na referência)
  /// <see cref="https://iugu.com/settings/account"/>
  String accountId;

  /// Método de Pagamento (atualmente somente credit_card)
  String method;

  /// Valor true para criar tokens de teste
  bool test;

  /// Dados do Método de Pagamento
  PaymentInfoModel paymentData;

  PaymentTokenRequest({
    this.accountId,
    this.method,
    this.test,
    this.paymentData,
  });

  PaymentTokenRequest copyWith({
    String accountId,
    String method,
    bool test,
    PaymentInfoModel paymentData,
  }) {
    return PaymentTokenRequest(
      accountId: accountId ?? this.accountId,
      method: method ?? this.method,
      test: test ?? this.test,
      paymentData: paymentData ?? this.paymentData,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'account_id': accountId,
      'method': method,
      'test': test,
      'data': paymentData?.toMap(),
    };
  }

  factory PaymentTokenRequest.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return PaymentTokenRequest(
      accountId: map['account_id'],
      method: map['method'],
      test: map['test'],
      paymentData: PaymentInfoModel.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentTokenRequest.fromJson(String source) =>
      PaymentTokenRequest.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PaymentTokenRequest(accountId: $accountId, method: $method, test: $test, paymentData: $paymentData)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PaymentTokenRequest &&
        o.accountId == accountId &&
        o.method == method &&
        o.test == test &&
        o.paymentData == paymentData;
  }

  @override
  int get hashCode {
    return accountId.hashCode ^
        method.hashCode ^
        test.hashCode ^
        paymentData.hashCode;
  }
}
