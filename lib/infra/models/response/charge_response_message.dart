import 'dart:convert';

import 'package:flutter/foundation.dart';

/// Representa a resposta da API para uma requisição de cobrança direta
class ChargeResponseMessage {
  /// Erros
  Map<String, Object> errors;

  /// Url do boleto
  String url;

  /// Informa se a cobrança foi gerada com sucesso
  bool success;

  /// Número da fatura da cobrança
  String invoiceId;

  /// Mensagem de resposta
  String message;

  ChargeResponseMessage({
    this.errors,
    this.url,
    this.success,
    this.invoiceId,
    this.message,
  });

  ChargeResponseMessage copyWith({
    Map<String, Object> errors,
    String url,
    bool success,
    String invoiceId,
    String message,
  }) {
    return ChargeResponseMessage(
      errors: errors ?? this.errors,
      url: url ?? this.url,
      success: success ?? this.success,
      invoiceId: invoiceId ?? this.invoiceId,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'errors': errors,
      'url': url,
      'success': success,
      'invoice_id': invoiceId,
      'message': message,
    };
  }

  factory ChargeResponseMessage.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return ChargeResponseMessage(
      errors: Map<String, Object>.from(map['errors']),
      url: map['url'],
      success: map['success'],
      invoiceId: map['invoice_id'],
      message: map['message'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ChargeResponseMessage.fromJson(String source) =>
      ChargeResponseMessage.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChargeResponseMessage(errors: $errors, url: $url, success: $success, invoiceId: $invoiceId, message: $message)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ChargeResponseMessage &&
        mapEquals(o.errors, errors) &&
        o.url == url &&
        o.success == success &&
        o.invoiceId == invoiceId &&
        o.message == message;
  }

  @override
  int get hashCode {
    return errors.hashCode ^
        url.hashCode ^
        success.hashCode ^
        invoiceId.hashCode ^
        message.hashCode;
  }
}
