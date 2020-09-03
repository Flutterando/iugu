import 'dart:convert';

class PaymentTokenResponse {
  /// Token Criado
  String id;

  /// Método de Pagamento (atualmente somente credit_card)
  String method;

  PaymentTokenResponse({
    this.id,
    this.method,
  });

  PaymentTokenResponse copyWith({
    String id,
    String method,
  }) {
    return PaymentTokenResponse(
      id: id ?? this.id,
      method: method ?? this.method,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'method': method,
    };
  }

  factory PaymentTokenResponse.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return PaymentTokenResponse(
      id: map['id'],
      method: map['method'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentTokenResponse.fromJson(String source) =>
      PaymentTokenResponse.fromMap(json.decode(source));

  @override
  String toString() => 'PaymentTokenResponse(id: $id, method: $method)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PaymentTokenResponse && o.id == id && o.method == method;
  }

  @override
  int get hashCode => id.hashCode ^ method.hashCode;
}
