import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:iugu/domain/entities/plan_models_list.dart';

class PlanRequestMessage {
  /// Nome do Plano
  String name;

  /// Identificador do Plano
  String uniqueIdentifier;

  /// Ciclo do Plano (Número inteiro maior que 0)
  int cycle;

  /// Tipo de Interval ("weeks" ou "months")
  String intervalType;

  /// Moeda do Preço (Somente "BRL" por enquanto)
  String currencyTypeName;

  /// Preço do Plano em Centavos
  int valueInCents;

  /// Método de pagamento que será disponibilizado para as Faturas pertencentes a Assinaturas deste Plano ('all', 'credit_card' ou 'bank_slip')
  String paymentMethod;

  /// Preços do Plano
  List<PlanPrice> prices;

  /// Funcionalidades do Plano
  List<PlanFeature> features;

  PlanRequestMessage({
    this.name,
    this.uniqueIdentifier,
    this.cycle,
    this.intervalType,
    this.currencyTypeName,
    this.valueInCents,
    this.paymentMethod,
    this.prices,
    this.features,
  });

  //  static Map<PlanIntervalType, String> _iuguAvailableInterval = new Dictionary<PlanIntervalType, String>
  // {
  //     [PlanIntervalType.Weekly] = Constants.GenerateCycleType.WEEKLY,
  //     [PlanIntervalType.Monthly] = Constants.GenerateCycleType.MONTHLY
  // };

  // private static readonly Dictionary<CurrencyType, String> _iuguAvailableCurrency = new Dictionary<CurrencyType, String>
  // {
  //     [CurrencyType.BRL] = Constants.CurrencyTypes.BRL,
  // };

  /// <summary>
  /// Plan request message
  /// </summary>
  /// <param name="name">Nome do plano</param>
  /// <param name="uniqueIdentifier">Identificador do plano Ex: basic_plan, 1x</param>
  /// <param name="cycle">Valor positivo, que representa de quanto em quanto tempo se aplica o intervalo Ex: ciclo 1, intervalo mensal (a cada mês)</param>
  /// <param name="interval">Tipo do intervalo, Mensal ou Semanal</param>
  /// <param name="valueInCents">valor do plano em centavos</param>
  /// <param name="currency">moeda utilizada, atualmente suportamos apenas Real</param>
  //  PlanRequestMessage(String name, String uniqueIdentifier, int cycle, PlanIntervalType interval, int valueInCents, CurrencyType currency)
  // {
  //     Name = name;
  //     UniqueIdentifier = uniqueIdentifier;
  //     Cycle = cycle;
  //     IntervalType = _iuguAvailableInterval[interval];
  //     ValueInCents = valueInCents;
  //     CurrencyTypeName = _iuguAvailableCurrency[currency];
  // }

  /// <summary>
  /// Plan request message
  /// </summary>
  /// <param name="name">Nome do plano</param>
  /// <param name="uniqueIdentifier">Identificador do plano Ex: basic_plan, 1x</param>
  /// <param name="cycle">De quanto em quanto tempo se aplica o intervalo Ex: ciclo 1, intervalo mensal (a cada mês)</param>
  /// <param name="interval">Tipo do intervalo, Mensal ou Semanal</param>
  /// <param name="valueInCents">valor do plano em centavos</param>
  //  PlanRequestMessage(String name, String uniqueIdentifier, int cycle, PlanIntervalType interval, int valueInCents) :
  //     this(name, uniqueIdentifier, cycle, interval, valueInCents, CurrencyType.BRL)
  // {
  // }

  PlanRequestMessage copyWith({
    String name,
    String uniqueIdentifier,
    int cycle,
    String intervalType,
    String currencyTypeName,
    int valueInCents,
    String paymentMethod,
    List<PlanPrice> prices,
    List<PlanFeature> features,
  }) {
    return PlanRequestMessage(
      name: name ?? this.name,
      uniqueIdentifier: uniqueIdentifier ?? this.uniqueIdentifier,
      cycle: cycle ?? this.cycle,
      intervalType: intervalType ?? this.intervalType,
      currencyTypeName: currencyTypeName ?? this.currencyTypeName,
      valueInCents: valueInCents ?? this.valueInCents,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      prices: prices ?? this.prices,
      features: features ?? this.features,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'identifier': uniqueIdentifier,
      'interval': cycle,
      'interval_type': intervalType,
      'currency': currencyTypeName,
      'value_cents': valueInCents,
      'payable_with': paymentMethod,
      'prices': prices?.map((x) => x?.toMap())?.toList(),
      'features': features?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory PlanRequestMessage.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return PlanRequestMessage(
      name: map['name'],
      uniqueIdentifier: map['identifier'],
      cycle: map['interval'],
      intervalType: map['interval_type'],
      currencyTypeName: map['currency'],
      valueInCents: map['value_cents'],
      paymentMethod: map['payable_with'],
      prices:
          List<PlanPrice>.from(map['prices']?.map((x) => PlanPrice.fromMap(x))),
      features: List<PlanFeature>.from(
          map['features']?.map((x) => PlanFeature.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory PlanRequestMessage.fromJson(String source) =>
      PlanRequestMessage.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PlanRequestMessage(name: $name, uniqueIdentifier: $uniqueIdentifier, cycle: $cycle, intervalType: $intervalType, currencyTypeName: $currencyTypeName, valueInCents: $valueInCents, paymentMethod: $paymentMethod, prices: $prices, features: $features)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PlanRequestMessage &&
        o.name == name &&
        o.uniqueIdentifier == uniqueIdentifier &&
        o.cycle == cycle &&
        o.intervalType == intervalType &&
        o.currencyTypeName == currencyTypeName &&
        o.valueInCents == valueInCents &&
        o.paymentMethod == paymentMethod &&
        listEquals(o.prices, prices) &&
        listEquals(o.features, features);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        uniqueIdentifier.hashCode ^
        cycle.hashCode ^
        intervalType.hashCode ^
        currencyTypeName.hashCode ^
        valueInCents.hashCode ^
        paymentMethod.hashCode ^
        prices.hashCode ^
        features.hashCode;
  }
}
