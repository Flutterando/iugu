import 'dart:convert';

import 'data_entry/custom_variables.dart';

class SubscriptionModel {
  String id;
  bool suspended;
  String planIdentifier;
  int priceCents;
  String currency;
  SubscriptionFeatures features;
  Object expiresAt;
  String createdAt;
  String updatedAt;
  String customerName;
  String customerEmail;
  Object cycledAt;
  int creditsMin;
  Object creditsCycle;
  String customerId;
  String planName;
  String customerRef;
  String planRef;
  bool active;
  Object inTrial;
  int credits;
  bool creditsBased;
  Object recentInvoices;
  List<SubscriptionSubitem> subitems;
  List<SubscriptionLog> logs;
  List<CustomVariables> customVariables;

  SubscriptionModel({
    this.id,
    this.suspended,
    this.planIdentifier,
    this.priceCents,
    this.currency,
    this.features,
    this.expiresAt,
    this.createdAt,
    this.updatedAt,
    this.customerName,
    this.customerEmail,
    this.cycledAt,
    this.creditsMin,
    this.creditsCycle,
    this.customerId,
    this.planName,
    this.customerRef,
    this.planRef,
    this.active,
    this.inTrial,
    this.credits,
    this.creditsBased,
    this.recentInvoices,
    this.subitems,
    this.logs,
    this.customVariables,
  });

  SubscriptionModel copyWith({
    String id,
    bool suspended,
    String planIdentifier,
    int priceCents,
    String currency,
    SubscriptionFeatures features,
    Object expiresAt,
    String createdAt,
    String updatedAt,
    String customerName,
    String customerEmail,
    Object cycledAt,
    int creditsMin,
    Object creditsCycle,
    String customerId,
    String planName,
    String customerRef,
    String planRef,
    bool active,
    Object inTrial,
    int credits,
    bool creditsBased,
    Object recentInvoices,
    List<SubscriptionSubitem> subitems,
    List<SubscriptionLog> logs,
    List<CustomVariables> customVariables,
  }) {
    return SubscriptionModel(
      id: id ?? this.id,
      suspended: suspended ?? this.suspended,
      planIdentifier: planIdentifier ?? this.planIdentifier,
      priceCents: priceCents ?? this.priceCents,
      currency: currency ?? this.currency,
      features: features ?? this.features,
      expiresAt: expiresAt ?? this.expiresAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      customerName: customerName ?? this.customerName,
      customerEmail: customerEmail ?? this.customerEmail,
      cycledAt: cycledAt ?? this.cycledAt,
      creditsMin: creditsMin ?? this.creditsMin,
      creditsCycle: creditsCycle ?? this.creditsCycle,
      customerId: customerId ?? this.customerId,
      planName: planName ?? this.planName,
      customerRef: customerRef ?? this.customerRef,
      planRef: planRef ?? this.planRef,
      active: active ?? this.active,
      inTrial: inTrial ?? this.inTrial,
      credits: credits ?? this.credits,
      creditsBased: creditsBased ?? this.creditsBased,
      recentInvoices: recentInvoices ?? this.recentInvoices,
      subitems: subitems ?? this.subitems,
      logs: logs ?? this.logs,
      customVariables: customVariables ?? this.customVariables,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'suspended': suspended,
      'plan_identifier': planIdentifier,
      'price_cents': priceCents,
      'currency': currency,
      'features': features?.toMap(),
      'expires_at': expiresAt,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'customer_name': customerName,
      'customer_email': customerEmail,
      'cycled_at': cycledAt,
      'credits_min': creditsMin,
      'credits_cycle': creditsCycle,
      'customer_id': customerId,
      'plan_name': planName,
      'customer_ref': customerRef,
      'plan_ref': planRef,
      'active': active,
      'in_trial': inTrial,
      'credits': credits,
      'credits_based': creditsBased,
      'recent_invoices': recentInvoices,
      'subitems': subitems?.map((x) => x?.toMap())?.toList(),
      'logs': logs?.map((x) => x?.toMap())?.toList(),
      'custom_variables': customVariables?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory SubscriptionModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return SubscriptionModel(
      id: map['id'],
      suspended: map['suspended'],
      planIdentifier: map['plan_identifier'],
      priceCents: map['price_cents'],
      currency: map['currency'],
      features: SubscriptionFeatures.fromMap(map['features']),
      expiresAt: map['expires_at'],
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
      customerName: map['customer_name'],
      customerEmail: map['customer_email'],
      cycledAt: map['cycled_at'],
      creditsMin: map['credits_min'],
      creditsCycle: map['credits_cycle'],
      customerId: map['customer_id'],
      planName: map['plan_name'],
      customerRef: map['customer_ref'],
      planRef: map['plan_ref'],
      active: map['active'],
      inTrial: map['in_trial'],
      credits: map['credits'],
      creditsBased: map['credits_based'],
      recentInvoices: map['recent_invoices'],
      subitems: List<SubscriptionSubitem>.from(
          map['subitems']?.map((x) => SubscriptionSubitem.fromMap(x))),
      logs: List<SubscriptionLog>.from(
          map['logs']?.map((x) => SubscriptionLog.fromMap(x))),
      customVariables: List<CustomVariables>.from(
          map['custom_variables']?.map((x) => CustomVariables.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory SubscriptionModel.fromJson(String source) =>
      SubscriptionModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SubscriptionModel(id: $id, suspended: $suspended, plan_identifier: $planIdentifier, price_cents: $priceCents, currency: $currency, features: $features, expires_at: $expiresAt, created_at: $createdAt, updated_at: $updatedAt, customer_name: $customerName, customer_email: $customerEmail, cycled_at: $cycledAt, credits_min: $creditsMin, credits_cycle: $creditsCycle, customer_id: $customerId, plan_name: $planName, customer_ref: $customerRef, plan_ref: $planRef, active: $active, in_trial: $inTrial, credits: $credits, credits_based: $creditsBased, recent_invoices: $recentInvoices, subitems: $subitems, logs: $logs, custom_variables: $customVariables)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SubscriptionModel &&
        o.id == id &&
        o.suspended == suspended &&
        o.planIdentifier == planIdentifier &&
        o.priceCents == priceCents &&
        o.currency == currency &&
        o.features == features &&
        o.expiresAt == expiresAt &&
        o.createdAt == createdAt &&
        o.updatedAt == updatedAt &&
        o.customerName == customerName &&
        o.customerEmail == customerEmail &&
        o.cycledAt == cycledAt &&
        o.creditsMin == creditsMin &&
        o.creditsCycle == creditsCycle &&
        o.customerId == customerId &&
        o.planName == planName &&
        o.customerRef == customerRef &&
        o.planRef == planRef &&
        o.active == active &&
        o.inTrial == inTrial &&
        o.credits == credits &&
        o.creditsBased == creditsBased &&
        o.recentInvoices == recentInvoices;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        suspended.hashCode ^
        planIdentifier.hashCode ^
        priceCents.hashCode ^
        currency.hashCode ^
        features.hashCode ^
        expiresAt.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        customerName.hashCode ^
        customerEmail.hashCode ^
        cycledAt.hashCode ^
        creditsMin.hashCode ^
        creditsCycle.hashCode ^
        customerId.hashCode ^
        planName.hashCode ^
        customerRef.hashCode ^
        planRef.hashCode ^
        active.hashCode ^
        inTrial.hashCode ^
        credits.hashCode ^
        creditsBased.hashCode ^
        recentInvoices.hashCode ^
        subitems.hashCode ^
        logs.hashCode ^
        customVariables.hashCode;
  }
}

class Feat {
  String name;
  int value;

  Feat({
    this.name,
    this.value,
  });

  Feat copyWith({
    String name,
    int value,
  }) {
    return Feat(
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

  factory Feat.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Feat(
      name: map['name'],
      value: map['value'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Feat.fromJson(String source) => Feat.fromMap(json.decode(source));

  @override
  String toString() => 'Feat(name: $name, value: $value)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Feat && o.name == name && o.value == value;
  }

  @override
  int get hashCode => name.hashCode ^ value.hashCode;
}

class SubscriptionFeatures {
  Feat feat;

  SubscriptionFeatures({
    this.feat,
  });

  SubscriptionFeatures copyWith({
    Feat feat,
  }) {
    return SubscriptionFeatures(
      feat: feat ?? this.feat,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'feat': feat?.toMap(),
    };
  }

  factory SubscriptionFeatures.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return SubscriptionFeatures(
      feat: Feat.fromMap(map['feat']),
    );
  }

  String toJson() => json.encode(toMap());

  factory SubscriptionFeatures.fromJson(String source) =>
      SubscriptionFeatures.fromMap(json.decode(source));

  @override
  String toString() => 'SubscriptionFeatures(feat: $feat)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SubscriptionFeatures && o.feat == feat;
  }

  @override
  int get hashCode => feat.hashCode;
}

class SubscriptionSubitem {
  String id;
  String description;
  int quantity;
  int priceCents;
  String price;
  String total;
  bool recurrent;
  bool destroy;

  SubscriptionSubitem({
    this.id,
    this.description,
    this.quantity,
    this.priceCents,
    this.price,
    this.total,
    this.recurrent,
    this.destroy,
  });

  SubscriptionSubitem copyWith({
    String id,
    String description,
    int quantity,
    int priceCents,
    String price,
    String total,
    bool recurrent,
    bool destroy,
  }) {
    return SubscriptionSubitem(
      id: id ?? this.id,
      description: description ?? this.description,
      quantity: quantity ?? this.quantity,
      priceCents: priceCents ?? this.priceCents,
      price: price ?? this.price,
      total: total ?? this.total,
      recurrent: recurrent ?? this.recurrent,
      destroy: destroy ?? this.destroy,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'quantity': quantity,
      'price_cents': priceCents,
      'price': price,
      'total': total,
      'recurrent': recurrent,
      '_destroy': destroy,
    };
  }

  factory SubscriptionSubitem.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return SubscriptionSubitem(
      id: map['id'],
      description: map['description'],
      quantity: map['quantity'],
      priceCents: map['price_cents'],
      price: map['price'],
      total: map['total'],
      recurrent: map['recurrent'],
      destroy: map['_destroy'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SubscriptionSubitem.fromJson(String source) =>
      SubscriptionSubitem.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SubscriptionSubitem(id: $id, description: $description, quantity: $quantity, price_cents: $priceCents, price: $price, total: $total, recurrent: $recurrent, _destroy: $destroy)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SubscriptionSubitem &&
        o.id == id &&
        o.description == description &&
        o.quantity == quantity &&
        o.priceCents == priceCents &&
        o.price == price &&
        o.total == total &&
        o.recurrent == recurrent &&
        o.destroy == destroy;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        description.hashCode ^
        quantity.hashCode ^
        priceCents.hashCode ^
        price.hashCode ^
        total.hashCode ^
        recurrent.hashCode ^
        destroy.hashCode;
  }
}

class SubscriptionLog {
  String id;
  String description;
  String notes;
  String createdAt;

  SubscriptionLog({
    this.id,
    this.description,
    this.notes,
    this.createdAt,
  });

  SubscriptionLog copyWith({
    String id,
    String description,
    String notes,
    String createdat,
  }) {
    return SubscriptionLog(
      id: id ?? this.id,
      description: description ?? this.description,
      notes: notes ?? this.notes,
      createdAt: createdat ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'notes': notes,
      'created_at': createdAt,
    };
  }

  factory SubscriptionLog.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return SubscriptionLog(
      id: map['id'],
      description: map['description'],
      notes: map['notes'],
      createdAt: map['created_at'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SubscriptionLog.fromJson(String source) =>
      SubscriptionLog.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SubscriptionLog(id: $id, description: $description, notes: $notes, created_at: $createdAt)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SubscriptionLog &&
        o.id == id &&
        o.description == description &&
        o.notes == notes &&
        o.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        description.hashCode ^
        notes.hashCode ^
        createdAt.hashCode;
  }
}
