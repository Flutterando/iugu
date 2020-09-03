import 'dart:convert';

// TODO: Precisa de refatoração, nomes fora do padrão .Net
class CreditCard {
  /// Número do Cartão de Crédito
  int number;

  /// CVV do Cartão de Crédito
  int verificationValue;

  /// Nome do Cliente como está no Cartão
  String firstName;

  /// Sobrenome do Cliente como está no Cartão
  String lastName;

  /// Mês de Vencimento no Formato MM (Ex: 01, 02, 12)
  int month;

  /// Ano de Vencimento no Formato YYYY (2014, 2015, 2016)
  int year;

  CreditCard({
    this.number,
    this.verificationValue,
    this.firstName,
    this.lastName,
    this.month,
    this.year,
  });

  CreditCard copyWith({
    int number,
    int verificationValue,
    String firstName,
    String lastName,
    int month,
    int year,
  }) {
    return CreditCard(
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

  factory CreditCard.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CreditCard(
      number: map['number'],
      verificationValue: map['verification_value'],
      firstName: map['first_name'],
      lastName: map['last_name'],
      month: map['month'],
      year: map['year'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CreditCard.fromJson(String source) =>
      CreditCard.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CreditCard(number: $number, verification_value: $verificationValue, first_name: $firstName, last_name: $lastName, month: $month, year: $year)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CreditCard &&
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
