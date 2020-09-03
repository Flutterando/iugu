import 'dart:convert';

import 'package:iugu/domain/entities/account_model.dart';

class VerifyAccountRequestMessage {
  /// Informações da conta a ser verificada
  /// Obs: Essas informações serão adicionadas as informações da conta
  AccountModel data;

  /// Habilitar a rerificação automática dos dados bancários
  bool automaticValidation;

  VerifyAccountRequestMessage({
    this.data,
    this.automaticValidation,
  });

  VerifyAccountRequestMessage copyWith({
    AccountModel data,
    bool automaticValidation,
  }) {
    return VerifyAccountRequestMessage(
      data: data ?? this.data,
      automaticValidation: automaticValidation ?? this.automaticValidation,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data?.toMap(),
      'automatic_validation': automaticValidation,
    };
  }

  factory VerifyAccountRequestMessage.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return VerifyAccountRequestMessage(
      data: AccountModel.fromMap(map['data']),
      automaticValidation: map['automatic_validation'],
    );
  }

  String toJson() => json.encode(toMap());

  factory VerifyAccountRequestMessage.fromJson(String source) =>
      VerifyAccountRequestMessage.fromMap(json.decode(source));

  @override
  String toString() =>
      'VerifyAccountRequestMessage(data: $data, automaticValidation: $automaticValidation)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is VerifyAccountRequestMessage &&
        o.data == data &&
        o.automaticValidation == automaticValidation;
  }

  @override
  int get hashCode => data.hashCode ^ automaticValidation.hashCode;
}
