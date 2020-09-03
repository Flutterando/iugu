import 'dart:convert';

/// Modelo que contém informações de pagamento
class PaymentInfoModel {
  /// Número do Cartão de Crédito
  String number;

  /// CVV do Cartão de Crédito
  String verificationValue;

  /// Nome do Cliente como está no Cartão
  String firstName;

  /// Sobrenome do Cliente como está no Cartão
  String lastName;

  /// Mês de Vencimento no Formato MM (Ex: 01, 02, 12)
  String month;

  /// Ano de Vencimento no Formato YYYY (2014, 2015, 2016)
  String year;

  PaymentInfoModel({
    this.number,
    this.verificationValue,
    this.firstName,
    this.lastName,
    this.month,
    this.year,
  });

  PaymentInfoModel copyWith({
    String number,
    String verificationValue,
    String firstName,
    String lastName,
    String month,
    String year,
  }) {
    return PaymentInfoModel(
      number: number ?? this.number,
      verificationValue: verificationValue ?? this.verificationValue,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      month: month ?? this.month,
      year: year ?? this.year,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'verification_value': verificationValue,
      'first_name': firstName,
      'last_name': lastName,
      'month': month,
      'year': year,
    };
  }

  factory PaymentInfoModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return PaymentInfoModel(
      number: map['number'],
      verificationValue: map['verificationValue'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      month: map['month'],
      year: map['year'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentInfoModel.fromJson(String source) =>
      PaymentInfoModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PaymentInfoModel(number: $number, verificationValue: $verificationValue, firstName: $firstName, lastName: $lastName, month: $month, year: $year)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PaymentInfoModel &&
        o.number == number &&
        o.verificationValue == verificationValue &&
        o.firstName == firstName &&
        o.lastName == lastName &&
        o.month == month &&
        o.year == year;
  }

  @override
  int get hashCode {
    return number.hashCode ^
        verificationValue.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        month.hashCode ^
        year.hashCode;
  }
}
