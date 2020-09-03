import 'dart:convert';

class PaymentMethodModel {
  String id;
  String description;
  String itemType;
  PaymentMethodData data;

  PaymentMethodModel({
    this.id,
    this.description,
    this.itemType,
    this.data,
  });

  PaymentMethodModel copyWith({
    String id,
    String description,
    String itemType,
    PaymentMethodData data,
  }) {
    return PaymentMethodModel(
      id: id ?? this.id,
      description: description ?? this.description,
      itemType: itemType ?? this.itemType,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'item_type': itemType,
      'data': data?.toMap(),
    };
  }

  factory PaymentMethodModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return PaymentMethodModel(
      id: map['id'],
      description: map['description'],
      itemType: map['item_type'],
      data: PaymentMethodData.fromMap(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentMethodModel.fromJson(String source) =>
      PaymentMethodModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PaymentMethodModel(id: $id, description: $description, item_type: $itemType, data: $data)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PaymentMethodModel &&
        o.id == id &&
        o.description == description &&
        o.itemType == itemType &&
        o.data == data;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        description.hashCode ^
        itemType.hashCode ^
        data.hashCode;
  }
}

// TODO: Precisa de refatoração, nomes fora do padrão .Net, sem documentação também
class PaymentMethodData {
  String token;
  String displayNumber;
  String brand;

  PaymentMethodData({
    this.token,
    this.displayNumber,
    this.brand,
  });

  PaymentMethodData copyWith({
    String token,
    String displayNumber,
    String brand,
  }) {
    return PaymentMethodData(
      token: token ?? this.token,
      displayNumber: displayNumber ?? this.displayNumber,
      brand: brand ?? this.brand,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'display_number': displayNumber,
      'brand': brand,
    };
  }

  factory PaymentMethodData.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return PaymentMethodData(
      token: map['token'],
      displayNumber: map['display_number'],
      brand: map['brand'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentMethodData.fromJson(String source) =>
      PaymentMethodData.fromMap(json.decode(source));

  @override
  String toString() =>
      'PaymentMethodData(token: $token, display_number: $displayNumber, brand: $brand)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PaymentMethodData &&
        o.token == token &&
        o.displayNumber == displayNumber &&
        o.brand == brand;
  }

  @override
  int get hashCode => token.hashCode ^ displayNumber.hashCode ^ brand.hashCode;
}
