import 'dart:convert';

import 'package:flutter/foundation.dart';

class PlanModelsList {
  int totalItems;
  List<PlanModel> items;
  PlanModelsList({
    this.totalItems,
    this.items,
  });

  PlanModelsList copyWith({
    int totalItems,
    List<PlanModel> items,
  }) {
    return PlanModelsList(
      totalItems: totalItems ?? this.totalItems,
      items: items ?? this.items,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'totalItems': totalItems,
      'items': items?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory PlanModelsList.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return PlanModelsList(
      totalItems: map['totalItems'],
      items:
          List<PlanModel>.from(map['items']?.map((x) => PlanModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory PlanModelsList.fromJson(String source) =>
      PlanModelsList.fromMap(json.decode(source));

  @override
  String toString() => 'PlanModelsList(totalItems: $totalItems, items: $items)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PlanModelsList &&
        o.totalItems == totalItems &&
        listEquals(o.items, items);
  }

  @override
  int get hashCode => totalItems.hashCode ^ items.hashCode;
}

class PlanModel {
  String id;
  String name;
  String identifier;
  int interval;
  String intervalType;
  String createdAt;
  String updatedAt;
  List<PlanPrice> prices;
  List<PlanFeature> features;

  PlanModel({
    this.id,
    this.name,
    this.identifier,
    this.interval,
    this.intervalType,
    this.createdAt,
    this.updatedAt,
    this.prices,
    this.features,
  });

  PlanModel copyWith({
    String id,
    String name,
    String identifier,
    int interval,
    String intervalType,
    String createdAt,
    String updatedAt,
    List<PlanPrice> prices,
    List<PlanFeature> features,
  }) {
    return PlanModel(
      id: id ?? this.id,
      name: name ?? this.name,
      identifier: identifier ?? this.identifier,
      interval: interval ?? this.interval,
      intervalType: intervalType ?? this.intervalType,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      prices: prices ?? this.prices,
      features: features ?? this.features,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'identifier': identifier,
      'interval': interval,
      'interval_type': intervalType,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'prices': prices?.map((x) => x?.toMap())?.toList(),
      'features': features?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory PlanModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return PlanModel(
      id: map['id'],
      name: map['name'],
      identifier: map['identifier'],
      interval: map['interval'],
      intervalType: map['interval_type'],
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
      prices:
          List<PlanPrice>.from(map['prices']?.map((x) => PlanPrice.fromMap(x))),
      features: List<PlanFeature>.from(
          map['features']?.map((x) => PlanFeature.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory PlanModel.fromJson(String source) =>
      PlanModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PlanModel(id: $id, name: $name, identifier: $identifier, interval: $interval, interval_type: $intervalType, created_at: $createdAt, updated_at: $updatedAt, prices: $prices, features: $features)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PlanModel &&
        o.id == id &&
        o.name == name &&
        o.identifier == identifier &&
        o.interval == interval &&
        o.intervalType == intervalType &&
        o.createdAt == createdAt &&
        o.updatedAt == updatedAt &&
        listEquals(o.prices, prices) &&
        listEquals(o.features, features);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        identifier.hashCode ^
        interval.hashCode ^
        intervalType.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        prices.hashCode ^
        features.hashCode;
  }
}

class PlanPrice {
  String createdAt;
  String currency;
  String id;
  String planId;
  String updatedAt;
  int valueCents;

  PlanPrice({
    this.createdAt,
    this.currency,
    this.id,
    this.planId,
    this.updatedAt,
    this.valueCents,
  });

  PlanPrice copyWith({
    String createdAt,
    String currency,
    String id,
    String planId,
    String updatedAt,
    int valueCents,
  }) {
    return PlanPrice(
      createdAt: createdAt ?? this.createdAt,
      currency: currency ?? this.currency,
      id: id ?? this.id,
      planId: planId ?? this.planId,
      updatedAt: updatedAt ?? this.updatedAt,
      valueCents: valueCents ?? this.valueCents,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'created_at': createdAt,
      'currency': currency,
      'id': id,
      'plan_id': planId,
      'updated_at': updatedAt,
      'value_cents': valueCents,
    };
  }

  factory PlanPrice.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return PlanPrice(
      createdAt: map['created_at'],
      currency: map['currency'],
      id: map['id'],
      planId: map['plan_id'],
      updatedAt: map['updated_at'],
      valueCents: map['value_cents'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PlanPrice.fromJson(String source) =>
      PlanPrice.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PlanPrice(created_at: $createdAt, currency: $currency, id: $id, plan_id: $planId, updated_at: $updatedAt, value_cents: $valueCents)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PlanPrice &&
        o.createdAt == createdAt &&
        o.currency == currency &&
        o.id == id &&
        o.planId == planId &&
        o.updatedAt == updatedAt &&
        o.valueCents == valueCents;
  }

  @override
  int get hashCode {
    return createdAt.hashCode ^
        currency.hashCode ^
        id.hashCode ^
        planId.hashCode ^
        updatedAt.hashCode ^
        valueCents.hashCode;
  }
}

class PlanFeature {
  String createdAt;
  String id;
  String identifier;
  Object important;
  String name;
  String planId;
  int position;
  String updatedAt;
  int value;

  PlanFeature({
    this.createdAt,
    this.id,
    this.identifier,
    this.important,
    this.name,
    this.planId,
    this.position,
    this.updatedAt,
    this.value,
  });

  PlanFeature copyWith({
    String createdAt,
    String id,
    String identifier,
    Object important,
    String name,
    String planId,
    int position,
    String updatedAt,
    int value,
  }) {
    return PlanFeature(
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
      identifier: identifier ?? this.identifier,
      important: important ?? this.important,
      name: name ?? this.name,
      planId: planId ?? this.planId,
      position: position ?? this.position,
      updatedAt: updatedAt ?? this.updatedAt,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'created_at': createdAt,
      'id': id,
      'identifier': identifier,
      'important': important,
      'name': name,
      'plan_id': planId,
      'position': position,
      'updated_at': updatedAt,
      'value': value,
    };
  }

  factory PlanFeature.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return PlanFeature(
      createdAt: map['created_at'],
      id: map['id'],
      identifier: map['identifier'],
      important: map['important'],
      name: map['name'],
      planId: map['plan_id'],
      position: map['position'],
      updatedAt: map['updated_at'],
      value: map['value'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PlanFeature.fromJson(String source) =>
      PlanFeature.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PlanFeature(created_at: $createdAt, id: $id, identifier: $identifier, important: $important, name: $name, plan_id: $planId, position: $position, updated_at: $updatedAt, value: $value)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PlanFeature &&
        o.createdAt == createdAt &&
        o.id == id &&
        o.identifier == identifier &&
        o.important == important &&
        o.name == name &&
        o.planId == planId &&
        o.position == position &&
        o.updatedAt == updatedAt &&
        o.value == value;
  }

  @override
  int get hashCode {
    return createdAt.hashCode ^
        id.hashCode ^
        identifier.hashCode ^
        important.hashCode ^
        name.hashCode ^
        planId.hashCode ^
        position.hashCode ^
        updatedAt.hashCode ^
        value.hashCode;
  }
}
