import 'dart:convert';

class TokenModel {
  String? id;
  String? method;

  TokenModel({
    this.id,
    this.method,
  });

  TokenModel copyWith({
    String? id,
    String? method,
  }) {
    return TokenModel(
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

  factory TokenModel.fromMap(Map<String, dynamic> map) {
    return TokenModel(
      id: map['id'],
      method: map['method'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TokenModel.fromJson(String source) => TokenModel.fromMap(json.decode(source));

  @override
  String toString() => 'TokenModel(id: $id, method: $method)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is TokenModel && o.id == id && o.method == method;
  }

  @override
  int get hashCode => id.hashCode ^ method.hashCode;
}
