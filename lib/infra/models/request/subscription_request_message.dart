import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:iugu/domain/entities/data_entry/custom_variables.dart';
import 'package:iugu/domain/entities/subscription_model.dart';

class SubscriptionRequestMessage {
  /// ID do Cliente
  String customerId;

  /// Identificador do Plano. Só é enviado para assinaturas que não são credits_based
  String planId;

  /// Data de Expiração (Também é a data da próxima cobrança)
  DateTime expiresAt;

  /// Apenas Cria a Assinatura se a Cobrança for bem sucedida. Isso só funciona caso o cliente já tenha uma forma de pagamento padrão cadastrada
  bool onlyOnChargeSuccess;

  /// Método de pagamento que será disponibilizado para as Faturas desta Assinatura (all, credit_card ou bank_slip).
  /// Obs: Dependendo do valor, este atributo será herdado, pois a prioridade é herdar o valor atribuído ao Plano desta Assinatura;
  /// Caso este esteja atribuído o valor ‘all’, o sistema considerará o payable_with da Assinatura; se não, o sistema considerará o payable_with do Plano
  String payableWith;

  /// É uma assinatura baseada em créditos
  bool isCreditBased;

  /// Preço em centavos da recarga para assinaturas baseadas em crédito
  int priceCents;

  /// Quantidade de créditos adicionados a cada ciclo, só enviado para assinaturas credits_based
  int creditsCycle;

  /// Quantidade de créditos que ativa o ciclo, por ex: Efetuar cobrança cada vez que a assinatura tenha apenas 1 crédito sobrando. Esse 1 crédito é o credits_min
  int creditsMin;

  /// Itens de Assinatura, sendo que estes podem ser recorrentes ou de cobrança única
  List<SubscriptionSubitem> subitems;

  /// Variáveis Personalizadas
  List<CustomVariables> customVariables;

  SubscriptionRequestMessage({
    this.customerId,
    this.planId,
    this.expiresAt,
    this.onlyOnChargeSuccess,
    this.payableWith,
    this.isCreditBased,
    this.priceCents,
    this.creditsCycle,
    this.creditsMin,
    this.subitems,
    this.customVariables,
  });

  SubscriptionRequestMessage copyWith({
    String customerId,
    String planId,
    DateTime expiresAt,
    bool onlyOnChargeSuccess,
    String payableWith,
    bool isCreditBased,
    int priceCents,
    int creditsCycle,
    int creditsMin,
    List<SubscriptionSubitem> subitems,
    List<CustomVariables> customVariables,
  }) {
    return SubscriptionRequestMessage(
      customerId: customerId ?? this.customerId,
      planId: planId ?? this.planId,
      expiresAt: expiresAt ?? this.expiresAt,
      onlyOnChargeSuccess: onlyOnChargeSuccess ?? this.onlyOnChargeSuccess,
      payableWith: payableWith ?? this.payableWith,
      isCreditBased: isCreditBased ?? this.isCreditBased,
      priceCents: priceCents ?? this.priceCents,
      creditsCycle: creditsCycle ?? this.creditsCycle,
      creditsMin: creditsMin ?? this.creditsMin,
      subitems: subitems ?? this.subitems,
      customVariables: customVariables ?? this.customVariables,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'customer_id': customerId,
      'plan_identifier': planId,
      'expires_at': expiresAt?.millisecondsSinceEpoch,
      'only_on_charge_success': onlyOnChargeSuccess,
      'payable_with': payableWith,
      'credits_based': isCreditBased,
      'price_cents': priceCents,
      'credits_cycle': creditsCycle,
      'credits_min': creditsMin,
      'subitems': subitems?.map((x) => x?.toMap())?.toList(),
      'custom_variables': customVariables?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory SubscriptionRequestMessage.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return SubscriptionRequestMessage(
      customerId: map['customer_id'],
      planId: map['plan_identifier'],
      expiresAt: DateTime.fromMillisecondsSinceEpoch(map['expires_at']),
      onlyOnChargeSuccess: map['only_on_charge_success'],
      payableWith: map['payable_with'],
      isCreditBased: map['credits_based'],
      priceCents: map['price_cents'],
      creditsCycle: map['credits_cycle'],
      creditsMin: map['credits_min'],
      subitems: List<SubscriptionSubitem>.from(
          map['subitems']?.map((x) => SubscriptionSubitem.fromMap(x))),
      customVariables: List<CustomVariables>.from(
          map['custom_variables']?.map((x) => CustomVariables.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory SubscriptionRequestMessage.fromJson(String source) =>
      SubscriptionRequestMessage.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SubscriptionRequestMessage(customerId: $customerId, planId: $planId, expiresAt: $expiresAt, onlyOnChargeSuccess: $onlyOnChargeSuccess, payableWith: $payableWith, isCreditBased: $isCreditBased, priceCents: $priceCents, creditsCycle: $creditsCycle, creditsMin: $creditsMin, subitems: $subitems, customVariables: $customVariables)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is SubscriptionRequestMessage &&
        o.customerId == customerId &&
        o.planId == planId &&
        o.expiresAt == expiresAt &&
        o.onlyOnChargeSuccess == onlyOnChargeSuccess &&
        o.payableWith == payableWith &&
        o.isCreditBased == isCreditBased &&
        o.priceCents == priceCents &&
        o.creditsCycle == creditsCycle &&
        o.creditsMin == creditsMin &&
        listEquals(o.subitems, subitems) &&
        listEquals(o.customVariables, customVariables);
  }

  @override
  int get hashCode {
    return customerId.hashCode ^
        planId.hashCode ^
        expiresAt.hashCode ^
        onlyOnChargeSuccess.hashCode ^
        payableWith.hashCode ^
        isCreditBased.hashCode ^
        priceCents.hashCode ^
        creditsCycle.hashCode ^
        creditsMin.hashCode ^
        subitems.hashCode ^
        customVariables.hashCode;
  }
}
