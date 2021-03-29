import 'dart:convert';

class Feature {
  /// Nome da Funcionalidade
  String? name;

  /// Identificador único da funcionalidade
  String? identifier;

  /// Valor da Funcionalidade (número maior que 0)
  int? value;

  Feature({
    this.name,
    this.identifier,
    this.value,
  });

  Feature copyWith({
    String? name,
    String? identifier,
    int? value,
  }) {
    return Feature(
      name: name ?? this.name,
      identifier: identifier ?? this.identifier,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'identifier': identifier,
      'value': value,
    };
  }

  factory Feature.fromMap(Map<String, dynamic> map) {
    return Feature(
      name: map['name'],
      identifier: map['identifier'],
      value: map['value'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Feature.fromJson(String source) => Feature.fromMap(json.decode(source));

  @override
  String toString() => 'Feature(name: $name, identifier: $identifier, value: $value)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Feature && o.name == name && o.identifier == identifier && o.value == value;
  }

  @override
  int get hashCode => name.hashCode ^ identifier.hashCode ^ value.hashCode;
}
