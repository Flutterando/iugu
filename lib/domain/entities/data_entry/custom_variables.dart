import 'dart:convert';

class CustomVariables {
  String name;
  String value;
  CustomVariables({
    this.name,
    this.value,
  });

  CustomVariables copyWith({
    String name,
    String value,
  }) {
    return CustomVariables(
      name: name ?? this.name,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'value': value,
    };
  }

  factory CustomVariables.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CustomVariables(
      name: map['name'],
      value: map['value'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomVariables.fromJson(String source) =>
      CustomVariables.fromMap(json.decode(source));

  @override
  String toString() => 'CustomVariables(name: $name, value: $value)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CustomVariables && o.name == name && o.value == value;
  }

  @override
  int get hashCode => name.hashCode ^ value.hashCode;
}
