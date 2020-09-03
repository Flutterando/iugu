import 'dart:convert';

class BankVerificationRequestMessage {
  /// Nome da instituição bancária
  /// Suportados : "001" para Banco do Brasil, "033" para Santander, "104" para Caixa Econômica, "237" para Bradesco, "341" para Itaú e "399" para HSBC
  String bankNumber;

  /// Agência da Conta
  /// Formatos com validação automática(9999-D, 9999)
  String bankAgency;

  /// Tipo da Conta ("cc" para Conta Corrente e "cp" para Conta Poupança)
  String accountType;

  /// Número da Conta
  /// Formatos com validação automática(99999999-D, XXX99999999-D onde X é Operação, 	9999999-D, 99999-D)
  String bankAccountNumber;

  /// Para validar os dados bancários através do dígito verificador
  bool automaticValidation;

  BankVerificationRequestMessage({
    this.bankNumber,
    this.bankAgency,
    this.accountType,
    this.bankAccountNumber,
    this.automaticValidation,
  });

  BankVerificationRequestMessage copyWith({
    String bankNumber,
    String bankAgency,
    String accountType,
    String bankAccountNumber,
    bool automaticValidation,
  }) {
    return BankVerificationRequestMessage(
      bankNumber: bankNumber ?? this.bankNumber,
      bankAgency: bankAgency ?? this.bankAgency,
      accountType: accountType ?? this.accountType,
      bankAccountNumber: bankAccountNumber ?? this.bankAccountNumber,
      automaticValidation: automaticValidation ?? this.automaticValidation,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'bank': bankNumber,
      'agency': bankAgency,
      'account_type': accountType,
      'account': bankAccountNumber,
      'automatic_validation': automaticValidation,
    };
  }

  factory BankVerificationRequestMessage.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return BankVerificationRequestMessage(
      bankNumber: map['bank'],
      bankAgency: map['agency'],
      accountType: map['account_type'],
      bankAccountNumber: map['account'],
      automaticValidation: map['automatic_validation'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BankVerificationRequestMessage.fromJson(String source) =>
      BankVerificationRequestMessage.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BankVerificationRequestMessage(bankNumber: $bankNumber, bankAgency: $bankAgency, accountType: $accountType, bankAccountNumber: $bankAccountNumber, automaticValidation: $automaticValidation)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is BankVerificationRequestMessage &&
        o.bankNumber == bankNumber &&
        o.bankAgency == bankAgency &&
        o.accountType == accountType &&
        o.bankAccountNumber == bankAccountNumber &&
        o.automaticValidation == automaticValidation;
  }

  @override
  int get hashCode {
    return bankNumber.hashCode ^
        bankAgency.hashCode ^
        accountType.hashCode ^
        bankAccountNumber.hashCode ^
        automaticValidation.hashCode;
  }
}
