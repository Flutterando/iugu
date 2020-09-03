import 'dart:convert';

/// Model que representa dados de endereço
class AddressModel {
  /// Rua
  String street;

  /// Número
  String number;

  /// Cidade
  String city;

  /// Estado (Ex: SP)
  String state;

  /// País
  String country;

  /// CEP
  String zipCode;

  /// Bairro. Obrigatório caso CEP seja incompleto.
  String district;

  AddressModel({
    this.street,
    this.number,
    this.city,
    this.state,
    this.country,
    this.zipCode,
    this.district,
  });

  AddressModel copyWith({
    String street,
    String number,
    String city,
    String state,
    String country,
    String zipCode,
    String district,
  }) {
    return AddressModel(
      street: street ?? this.street,
      number: number ?? this.number,
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
      zipCode: zipCode ?? this.zipCode,
      district: district ?? this.district,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'street': street,
      'number': number,
      'city': city,
      'state': state,
      'country': country,
      'zip_code': zipCode,
      'district': district,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return AddressModel(
      street: map['street'],
      number: map['number'],
      city: map['city'],
      state: map['state'],
      country: map['country'],
      zipCode: map['zip_code'],
      district: map['district'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AddressModel(street: $street, number: $number, city: $city, state: $state, country: $country, zipCode: $zipCode, district: $district)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is AddressModel &&
        o.street == street &&
        o.number == number &&
        o.city == city &&
        o.state == state &&
        o.country == country &&
        o.zipCode == zipCode &&
        o.district == district;
  }

  @override
  int get hashCode {
    return street.hashCode ^
        number.hashCode ^
        city.hashCode ^
        state.hashCode ^
        country.hashCode ^
        zipCode.hashCode ^
        district.hashCode;
  }
}
