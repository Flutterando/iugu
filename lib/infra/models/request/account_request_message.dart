import 'dart:convert';

/// Requisição para a API de contas
class AccountRequestMessage {
  /// Nome da Conta. Caso não seja enviado, um valor padrão com o ID da conta é atribuído
  String name;

  /// Percentual de comissionamento enviado para a conta que gerencia o marketplace (Valor entre 0 e 70)
  int commissionPercent;
  AccountRequestMessage({
    this.name = '',
    this.commissionPercent = 0,
  });

  AccountRequestMessage copyWith({
    String? name,
    int? commissionPercent,
  }) {
    return AccountRequestMessage(
      name: name ?? this.name,
      commissionPercent: commissionPercent ?? this.commissionPercent,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'commission_percent': commissionPercent,
    };
  }

  factory AccountRequestMessage.fromMap(Map<String, dynamic> map) {
    return AccountRequestMessage(
      name: map['name'],
      commissionPercent: map['commission_percent'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AccountRequestMessage.fromJson(String source) => AccountRequestMessage.fromMap(json.decode(source));

  @override
  String toString() => 'AccountRequestMessage(name: $name, commissionPercent: $commissionPercent)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is AccountRequestMessage && o.name == name && o.commissionPercent == commissionPercent;
  }

  @override
  int get hashCode => name.hashCode ^ commissionPercent.hashCode;
}
