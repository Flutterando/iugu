import 'dart:convert';

// TODO: Precisa de refatoração, nomes fora do padrão .Net
class Prices {
  /// Moeda do Preço (Somente "BRL" por enquanto)
  String currency;

  /// Preço do Plano em Centavos
  int valueCents;

  Prices({
    this.currency,
    this.valueCents,
  });

  Prices copyWith({
    String currency,
    int valueCents,
  }) {
    return Prices(
      currency: currency ?? this.currency,
      valueCents: valueCents ?? this.valueCents,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'currency': currency,
      'value_cents': valueCents,
    };
  }

  factory Prices.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Prices(
      currency: map['currency'],
      valueCents: map['value_cents'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Prices.fromJson(String source) => Prices.fromMap(json.decode(source));

  @override
  String toString() => 'Prices(currency: $currency, value_cents: $valueCents)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Prices && o.currency == currency && o.valueCents == valueCents;
  }

  @override
  int get hashCode => currency.hashCode ^ valueCents.hashCode;
}
