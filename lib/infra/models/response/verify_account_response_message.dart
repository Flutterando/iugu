import 'dart:convert';

import 'package:iugu/domain/entities/account_model.dart';

class VerifyAccountResponseMessage {
  /// Identificação da verificação
  String id;

  /// Identificação da conta
  String accountId;

  /// Dados da conta
  AccountModel data;

  /// Data da criação da verificação
  DateTime? createdAt;

  VerifyAccountResponseMessage({
    required this.id,
    required this.accountId,
    required this.data,
    this.createdAt,
  });

  VerifyAccountResponseMessage copyWith({
    String? id,
    String? accountId,
    AccountModel? data,
    DateTime? createdAt,
  }) {
    return VerifyAccountResponseMessage(
      id: id ?? this.id,
      accountId: accountId ?? this.accountId,
      data: data ?? this.data,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'account_id': accountId,
      'data': data.toMap(),
      'created_at': createdAt?.millisecondsSinceEpoch,
    };
  }

  factory VerifyAccountResponseMessage.fromMap(Map<String, dynamic> map) {
    return VerifyAccountResponseMessage(
      id: map['id'],
      accountId: map['account_id'],
      data: AccountModel.fromMap(map['data']),
      createdAt: map['created_at'] != null ? DateTime.fromMillisecondsSinceEpoch(map['created_at']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory VerifyAccountResponseMessage.fromJson(String source) => VerifyAccountResponseMessage.fromMap(json.decode(source));

  @override
  String toString() {
    return 'VerifyAccountResponseMessage(id: $id, accountId: $accountId, data: $data, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is VerifyAccountResponseMessage && o.id == id && o.accountId == accountId && o.data == data && o.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^ accountId.hashCode ^ data.hashCode ^ createdAt.hashCode;
  }
}
