import 'dart:convert';

class RequestWithdrawResponseMessage {
  String operationId;

  String status;

  DateTime createdAt;

  DateTime updatedAt;

  Object reference;

  String amount;

  String accountName;

  String accountId;

  BankInfo bankInfo;

  RequestWithdrawResponseMessage({
    required this.operationId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.reference,
    required this.amount,
    required this.accountName,
    required this.accountId,
    required this.bankInfo,
  });

  RequestWithdrawResponseMessage copyWith({
    String? operationId,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    Object? reference,
    String? amount,
    String? accountName,
    String? accountId,
    BankInfo? bankInfo,
  }) {
    return RequestWithdrawResponseMessage(
      operationId: operationId ?? this.operationId,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      reference: reference ?? this.reference,
      amount: amount ?? this.amount,
      accountName: accountName ?? this.accountName,
      accountId: accountId ?? this.accountId,
      bankInfo: bankInfo ?? this.bankInfo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': operationId,
      'status': status,
      'created_at': createdAt.millisecondsSinceEpoch,
      'updated_at': updatedAt.millisecondsSinceEpoch,
      'reference': reference,
      'amount': amount,
      'account_name': accountName,
      'account_id': accountId,
      'bank_address': bankInfo.toMap(),
    };
  }

  factory RequestWithdrawResponseMessage.fromMap(Map<String, dynamic> map) {
    return RequestWithdrawResponseMessage(
      operationId: map['id'],
      status: map['status'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['created_at']),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updated_at']),
      reference: map['reference'],
      amount: map['amount'],
      accountName: map['account_name'],
      accountId: map['account_id'],
      bankInfo: BankInfo.fromMap(map['bank_address']),
    );
  }

  String toJson() => json.encode(toMap());

  factory RequestWithdrawResponseMessage.fromJson(String source) => RequestWithdrawResponseMessage.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RequestWithdrawResponseMessage(operationId: $operationId, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, reference: $reference, amount: $amount, accountName: $accountName, accountId: $accountId, bankInfo: $bankInfo)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is RequestWithdrawResponseMessage && o.operationId == operationId && o.status == status && o.createdAt == createdAt && o.updatedAt == updatedAt && o.reference == reference && o.amount == amount && o.accountName == accountName && o.accountId == accountId && o.bankInfo == bankInfo;
  }

  @override
  int get hashCode {
    return operationId.hashCode ^ status.hashCode ^ createdAt.hashCode ^ updatedAt.hashCode ^ reference.hashCode ^ amount.hashCode ^ accountName.hashCode ^ accountId.hashCode ^ bankInfo.hashCode;
  }
}

class BankInfo {
  /// Nome da instituição bancária
  /// Suportados : 'Itaú', 'Bradesco', 'Caixa Econômica', 'Banco do Brasil', 'Santander'
  String name;

  /// Número da Conta
  /// Formatos (99999999-D, XXX99999999-D onde X é Operação, 	9999999-D, 99999-D)
  String accountNumber;

  /// Agência da Conta
  /// Formatos (9999-D, 9999)
  String agencyNumber;

  /// Tipo da conta: 'Corrente', 'Poupança'
  String accountType;

  BankInfo({
    required this.name,
    required this.accountNumber,
    required this.agencyNumber,
    required this.accountType,
  });

  BankInfo copyWith({
    String? name,
    String? accountNumber,
    String? agencyNumber,
    String? accountType,
  }) {
    return BankInfo(
      name: name ?? this.name,
      accountNumber: accountNumber ?? this.accountNumber,
      agencyNumber: agencyNumber ?? this.agencyNumber,
      accountType: accountType ?? this.accountType,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'bank': name,
      'bank_cc': accountNumber,
      'bank_ag': agencyNumber,
      'account_type': accountType,
    };
  }

  factory BankInfo.fromMap(Map<String, dynamic> map) {
    return BankInfo(
      name: map['bank'],
      accountNumber: map['bank_cc'],
      agencyNumber: map['bank_ag'],
      accountType: map['account_type'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BankInfo.fromJson(String source) => BankInfo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BankInfo(name: $name, accountNumber: $accountNumber, agencyNumber: $agencyNumber, accountType: $accountType)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is BankInfo && o.name == name && o.accountNumber == accountNumber && o.agencyNumber == agencyNumber && o.accountType == accountType;
  }

  @override
  int get hashCode {
    return name.hashCode ^ accountNumber.hashCode ^ agencyNumber.hashCode ^ accountType.hashCode;
  }
}
