import 'dart:convert';

class PaymentTokenResponse {
  /// Token Criado
  String id;

  /// Método de Pagamento (atualmente somente credit_card)
  String method;

  ExtraInfo extraInfo;

  PaymentTokenResponse({
    this.id,
    this.method,
    this.extraInfo,
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
      'extra_info': extraInfo.toMap(),
    };
  }

  factory PaymentTokenResponse.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return PaymentTokenResponse(
        id: map['id'],
        method: map['method'],
        extraInfo: ExtraInfo.fromMap(map['extra_info']));
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

class ExtraInfo {
  ExtraInfo({
    this.bin,
    this.year,
    this.month,
    this.brand,
    this.holderName,
    this.displayNumber,
  });

  final String bin;
  final int year;
  final int month;
  final String brand;
  final String holderName;
  final String displayNumber;

  ExtraInfo copyWith({
    String bin,
    int year,
    int month,
    String brand,
    String holderName,
    String displayNumber,
  }) =>
      ExtraInfo(
        bin: bin ?? this.bin,
        year: year ?? this.year,
        month: month ?? this.month,
        brand: brand ?? this.brand,
        holderName: holderName ?? this.holderName,
        displayNumber: displayNumber ?? this.displayNumber,
      );

  factory ExtraInfo.fromJson(String str) => ExtraInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ExtraInfo.fromMap(Map<String, dynamic> json) => ExtraInfo(
        bin: json["bin"],
        year: json["year"],
        month: json["month"],
        brand: json["brand"],
        holderName: json["holder_name"],
        displayNumber: json["display_number"],
      );

  Map<String, dynamic> toMap() => {
        "bin": bin,
        "year": year,
        "month": month,
        "brand": brand,
        "holder_name": holderName,
        "display_number": displayNumber,
      };
}
