import 'dart:convert';
import 'package:iugu/domain/entities/account_model.dart';

class GetAccountResponseMessage {
  /// Identificação da conta
  //[JsonProperty("id")]
  String accountId;

  /// Nome da conta
  //[JsonProperty("name")]
  String name;

  /// Data de criação
  //[JsonProperty("created_at")]
  DateTime createdAt;

  /// Data da ultima atualização
  //[JsonProperty("updated_at")]
  DateTime updatedAt;

  /// Pode receber pagamentos
  //[JsonProperty("can_receive")]
  bool canReceive;

  /// Conta já foi verificada
  //[JsonProperty("is_verified")]
  bool isVerified;

  /// Último status de verificação da conta
  //[JsonProperty("last_verification_request_status")]
  String lastAccountVerificationRequestStatus;

  /// Dados enviados na última requisição de verificação
  //[JsonProperty("last_verification_request_data")]
  AccountModel lastAccountVerificationRequestData;

  /// Descrição do motivo de rejeição da verificação da conta, caso contrário é nulo
  //[JsonProperty("last_verification_request_feedback")]
  String lastAccountVerificationRequestDataFeedback;

  /// Tipo do plano
  //[JsonProperty("change_plan_type")]
  int changePlanType;

  /// Dias do periodo trieal
  //[JsonProperty("subscriptions_trial_period")]
  int subscriptionsTrialPeriod;

  /// Desabilitar envio de emails
  //[JsonProperty("disable_emails")]
  bool disableEmails;

  /// Último saque
  //[JsonProperty("last_withdraw")]
  WithdrawModel lastWithdraw;

  /// Total de assinantes
  //[JsonProperty("total_subscriptions")]
  int totalSubscriptions;

  /// Email de reply
  //[JsonProperty("reply_to")]
  String replyToEmail;

  /// Está executando em modo teste
  //[JsonProperty("webapp_on_test_mode")]
  bool runningInTestMode;

  /// Identifica se a conta é de um marketplace
  //[JsonProperty("marketplace")]
  bool isMarketplace;

  /// Retirada automática habilitada
  //[JsonProperty("auto_withdraw")]
  bool enableAutoWithdraw;

  /// Balanço do periodo
  //[JsonProperty("balance")]
  String balance;

  /// Balanço protegido
  //[JsonProperty("protected_balance")]
  String protectedBalance;

  /// Balanço a pagar
  //[JsonProperty("payable_balance")]
  String payableBalance;

  /// Balanço a receber
  //[JsonProperty("receivable_balance")]
  String receivableBalance;

  /// Balanço de comissões
  //[JsonProperty("commission_balance")]
  String commissionBalance;

  /// Volume do último mês
  //[JsonProperty("volume_last_month")]
  String lastMonthVolume;

  /// Volume do mês
  //[JsonProperty("volume_this_month")]
  String currentVolume;

  /// Taxas pagas no ultimo mês
  //[JsonProperty("taxes_paid_last_month")]
  String taxesPaidLastMonth;

  /// Taxas pagas no mês
  //[JsonProperty("taxes_paid_this_month")]
  String taxesPaidMonth;

  /// Url da logo do cliente em tamanho padrão
  //[JsonProperty("custom_logo_url")]
  String clientLogoUrl;

  /// Url da logo do cliente em tamanho pequeno
  //[JsonProperty("custom_logo_small_url")]
  String clientSmallLogoUrl;

  /// Informações extras da conta, baseadas em chave valor
  List<Information> extraInformations;

  GetAccountResponseMessage({
    this.accountId,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.canReceive,
    this.isVerified,
    this.lastAccountVerificationRequestStatus,
    this.lastAccountVerificationRequestData,
    this.lastAccountVerificationRequestDataFeedback,
    this.changePlanType,
    this.subscriptionsTrialPeriod,
    this.disableEmails,
    this.lastWithdraw,
    this.totalSubscriptions,
    this.replyToEmail,
    this.runningInTestMode,
    this.isMarketplace,
    this.enableAutoWithdraw,
    this.balance,
    this.protectedBalance,
    this.payableBalance,
    this.receivableBalance,
    this.commissionBalance,
    this.lastMonthVolume,
    this.currentVolume,
    this.taxesPaidLastMonth,
    this.taxesPaidMonth,
    this.clientLogoUrl,
    this.clientSmallLogoUrl,
    this.extraInformations,
  });

  GetAccountResponseMessage copyWith({
    String accountId,
    String name,
    DateTime createdAt,
    DateTime updatedAt,
    bool canReceive,
    bool isVerified,
    String lastAccountVerificationRequestStatus,
    AccountModel lastAccountVerificationRequestData,
    String lastAccountVerificationRequestDataFeedback,
    int changePlanType,
    int subscriptionsTrialPeriod,
    bool disableEmails,
    WithdrawModel lastWithdraw,
    int totalSubscriptions,
    String replyToEmail,
    bool runningInTestMode,
    bool isMarketplace,
    bool enableAutoWithdraw,
    String balance,
    String protectedBalance,
    String payableBalance,
    String receivableBalance,
    String commissionBalance,
    String lastMonthVolume,
    String currentVolume,
    String taxesPaidLastMonth,
    String taxesPaidMonth,
    String clientLogoUrl,
    String clientSmallLogoUrl,
    List<Information> extraInformations,
  }) {
    return GetAccountResponseMessage(
      accountId: accountId ?? this.accountId,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      canReceive: canReceive ?? this.canReceive,
      isVerified: isVerified ?? this.isVerified,
      lastAccountVerificationRequestStatus:
          lastAccountVerificationRequestStatus ??
              this.lastAccountVerificationRequestStatus,
      lastAccountVerificationRequestData: lastAccountVerificationRequestData ??
          this.lastAccountVerificationRequestData,
      lastAccountVerificationRequestDataFeedback:
          lastAccountVerificationRequestDataFeedback ??
              this.lastAccountVerificationRequestDataFeedback,
      changePlanType: changePlanType ?? this.changePlanType,
      subscriptionsTrialPeriod:
          subscriptionsTrialPeriod ?? this.subscriptionsTrialPeriod,
      disableEmails: disableEmails ?? this.disableEmails,
      lastWithdraw: lastWithdraw ?? this.lastWithdraw,
      totalSubscriptions: totalSubscriptions ?? this.totalSubscriptions,
      replyToEmail: replyToEmail ?? this.replyToEmail,
      runningInTestMode: runningInTestMode ?? this.runningInTestMode,
      isMarketplace: isMarketplace ?? this.isMarketplace,
      enableAutoWithdraw: enableAutoWithdraw ?? this.enableAutoWithdraw,
      balance: balance ?? this.balance,
      protectedBalance: protectedBalance ?? this.protectedBalance,
      payableBalance: payableBalance ?? this.payableBalance,
      receivableBalance: receivableBalance ?? this.receivableBalance,
      commissionBalance: commissionBalance ?? this.commissionBalance,
      lastMonthVolume: lastMonthVolume ?? this.lastMonthVolume,
      currentVolume: currentVolume ?? this.currentVolume,
      taxesPaidLastMonth: taxesPaidLastMonth ?? this.taxesPaidLastMonth,
      taxesPaidMonth: taxesPaidMonth ?? this.taxesPaidMonth,
      clientLogoUrl: clientLogoUrl ?? this.clientLogoUrl,
      clientSmallLogoUrl: clientSmallLogoUrl ?? this.clientSmallLogoUrl,
      extraInformations: extraInformations ?? this.extraInformations,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': accountId,
      'name': name,
      'created_at': createdAt?.millisecondsSinceEpoch,
      'updated_at': updatedAt?.millisecondsSinceEpoch,
      'can_receive': canReceive,
      'is_verified': isVerified,
      'last_verification_request_status': lastAccountVerificationRequestStatus,
      'last_verification_request_data':
          lastAccountVerificationRequestData?.toMap(),
      'last_verification_request_feedback':
          lastAccountVerificationRequestDataFeedback,
      'change_plan_type': changePlanType,
      'subscriptions_trial_period': subscriptionsTrialPeriod,
      'disable_emails': disableEmails,
      'last_withdraw': lastWithdraw?.toMap(),
      'total_subscriptions': totalSubscriptions,
      'reply_to': replyToEmail,
      'webapp_on_test_mode': runningInTestMode,
      'marketplace': isMarketplace,
      'auto_withdraw': enableAutoWithdraw,
      'balance': balance,
      'protected_balance': protectedBalance,
      'payable_balance': payableBalance,
      'receivable_balance': receivableBalance,
      'commission_balance': commissionBalance,
      'volume_last_month': lastMonthVolume,
      'volume_this_month': currentVolume,
      'taxes_paid_last_month': taxesPaidLastMonth,
      'taxes_paid_this_month': taxesPaidMonth,
      'custom_logo_url': clientLogoUrl,
      'custom_logo_small_url': clientSmallLogoUrl,
      'informations': extraInformations?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory GetAccountResponseMessage.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return GetAccountResponseMessage(
      accountId: map['id'],
      name: map['name'],
      createdAt: map['created_at'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['created_at'])
          : null,
      updatedAt: map['updated_at'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['updated_at'])
          : null,
      canReceive: map['can_receive'],
      isVerified: map['is_verified'],
      lastAccountVerificationRequestStatus:
          map['last_verification_request_status'],
      lastAccountVerificationRequestData:
          map['last_verification_request_data'] == null
              ? null
              : AccountModel.fromMap(map['last_verification_request_data']),
      lastAccountVerificationRequestDataFeedback:
          map['last_verification_request_feedback'],
      changePlanType: map['change_plan_type'],
      subscriptionsTrialPeriod: map['subscriptions_trial_period'],
      disableEmails: map['disable_emails'],
      lastWithdraw: map['last_withdraw'] == null
          ? null
          : WithdrawModel.fromMap(map['last_withdraw']),
      totalSubscriptions: map['total_subscriptions'],
      replyToEmail: map['reply_to'],
      runningInTestMode: map['webapp_on_test_mode'],
      isMarketplace: map['marketplace'],
      enableAutoWithdraw: map['auto_withdraw'],
      balance: map['balance'],
      protectedBalance: map['protected_balance'],
      payableBalance: map['payable_balance'],
      receivableBalance: map['receivable_balance'],
      commissionBalance: map['commission_balance'],
      lastMonthVolume: map['volume_last_month'],
      currentVolume: map['volume_this_month'],
      taxesPaidLastMonth: map['taxes_paid_last_month'],
      taxesPaidMonth: map['taxes_paid_this_month'],
      clientLogoUrl: map['custom_logo_url'],
      clientSmallLogoUrl: map['custom_logo_small_url'],
      extraInformations: map['informations'] == null
          ? null
          : List<Information>.from(
              map['informations']?.map((x) => Information.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory GetAccountResponseMessage.fromJson(String source) =>
      GetAccountResponseMessage.fromMap(json.decode(source));

  @override
  String toString() {
    return 'GetAccountResponseMessage(accountId: $accountId, name: $name, createdAt: $createdAt, updatedAt: $updatedAt, canReceive: $canReceive, isVerified: $isVerified, lastAccountVerificationRequestStatus: $lastAccountVerificationRequestStatus, lastAccountVerificationRequestData: $lastAccountVerificationRequestData, lastAccountVerificationRequestDataFeedback: $lastAccountVerificationRequestDataFeedback, changePlanType: $changePlanType, subscriptionsTrialPeriod: $subscriptionsTrialPeriod, disableEmails: $disableEmails, lastWithdraw: $lastWithdraw, totalSubscriptions: $totalSubscriptions, replyToEmail: $replyToEmail, runningInTestMode: $runningInTestMode, isMarketplace: $isMarketplace, enableAutoWithdraw: $enableAutoWithdraw, balance: $balance, protectedBalance: $protectedBalance, payableBalance: $payableBalance, receivableBalance: $receivableBalance, commissionBalance: $commissionBalance, lastMonthVolume: $lastMonthVolume, currentVolume: $currentVolume, taxesPaidLastMonth: $taxesPaidLastMonth, taxesPaidMonth: $taxesPaidMonth, clientLogoUrl: $clientLogoUrl, clientSmallLogoUrl: $clientSmallLogoUrl, extraInformations: $extraInformations)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is GetAccountResponseMessage &&
        o.accountId == accountId &&
        o.name == name &&
        o.createdAt == createdAt &&
        o.updatedAt == updatedAt &&
        o.canReceive == canReceive &&
        o.isVerified == isVerified &&
        o.lastAccountVerificationRequestStatus ==
            lastAccountVerificationRequestStatus &&
        o.lastAccountVerificationRequestData ==
            lastAccountVerificationRequestData &&
        o.lastAccountVerificationRequestDataFeedback ==
            lastAccountVerificationRequestDataFeedback &&
        o.changePlanType == changePlanType &&
        o.subscriptionsTrialPeriod == subscriptionsTrialPeriod &&
        o.disableEmails == disableEmails &&
        o.lastWithdraw == lastWithdraw &&
        o.totalSubscriptions == totalSubscriptions &&
        o.replyToEmail == replyToEmail &&
        o.runningInTestMode == runningInTestMode &&
        o.isMarketplace == isMarketplace &&
        o.enableAutoWithdraw == enableAutoWithdraw &&
        o.balance == balance &&
        o.protectedBalance == protectedBalance &&
        o.payableBalance == payableBalance &&
        o.receivableBalance == receivableBalance &&
        o.commissionBalance == commissionBalance &&
        o.lastMonthVolume == lastMonthVolume &&
        o.currentVolume == currentVolume &&
        o.taxesPaidLastMonth == taxesPaidLastMonth &&
        o.taxesPaidMonth == taxesPaidMonth &&
        o.clientLogoUrl == clientLogoUrl &&
        o.clientSmallLogoUrl == clientSmallLogoUrl;
  }

  @override
  int get hashCode {
    return accountId.hashCode ^
        name.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode ^
        canReceive.hashCode ^
        isVerified.hashCode ^
        lastAccountVerificationRequestStatus.hashCode ^
        lastAccountVerificationRequestData.hashCode ^
        lastAccountVerificationRequestDataFeedback.hashCode ^
        changePlanType.hashCode ^
        subscriptionsTrialPeriod.hashCode ^
        disableEmails.hashCode ^
        lastWithdraw.hashCode ^
        totalSubscriptions.hashCode ^
        replyToEmail.hashCode ^
        runningInTestMode.hashCode ^
        isMarketplace.hashCode ^
        enableAutoWithdraw.hashCode ^
        balance.hashCode ^
        protectedBalance.hashCode ^
        payableBalance.hashCode ^
        receivableBalance.hashCode ^
        commissionBalance.hashCode ^
        lastMonthVolume.hashCode ^
        currentVolume.hashCode ^
        taxesPaidLastMonth.hashCode ^
        taxesPaidMonth.hashCode ^
        clientLogoUrl.hashCode ^
        clientSmallLogoUrl.hashCode ^
        extraInformations.hashCode;
  }
}

/// Modelo que representa as informações da retirada
class WithdrawModel {
  /// Identificação da retirada
  String id;

  /// Identificação da conta
  String accountId;

  /// Valor
  String amount;

  /// Nome da instituição bancária
  /// Suportados : 'Itaú', 'Bradesco', 'Caixa Econômica', 'Banco do Brasil', 'Santander'
  String bank;

  /// Agência da Conta
  /// Formatos com validação automática(9999-D, 9999)
  String bankAgency;

  /// Tipo da conta: 'Corrente', 'Poupança'
  String accountType;

  /// Número da Conta
  /// Formatos com validação automática(99999999-D, XXX99999999-D onde X é Operação, 	9999999-D, 99999-D)
  String bankAccountNumber;

  /// Data de Criação
  String createdAt;

  /// Feedback de verificação dos dados
  String feedback;

  /// Status da transação
  String status;

  /// Data da retirada
  String updatedAt;

  WithdrawModel({
    this.id,
    this.accountId,
    this.amount,
    this.bank,
    this.bankAgency,
    this.accountType,
    this.bankAccountNumber,
    this.createdAt,
    this.feedback,
    this.status,
    this.updatedAt,
  });

  WithdrawModel copyWith({
    String id,
    String accountId,
    String amount,
    String bank,
    String bankAgency,
    String accountType,
    String bankAccountNumber,
    String createdAt,
    String feedback,
    String status,
    String updatedAt,
  }) {
    return WithdrawModel(
      id: id ?? this.id,
      accountId: accountId ?? this.accountId,
      amount: amount ?? this.amount,
      bank: bank ?? this.bank,
      bankAgency: bankAgency ?? this.bankAgency,
      accountType: accountType ?? this.accountType,
      bankAccountNumber: bankAccountNumber ?? this.bankAccountNumber,
      createdAt: createdAt ?? this.createdAt,
      feedback: feedback ?? this.feedback,
      status: status ?? this.status,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'account_id': accountId,
      'amount': amount,
      'bank': bank,
      'bank_ag': bankAgency,
      'account_type': accountType,
      'bank_cc': bankAccountNumber,
      'created_at': createdAt,
      'feedback': feedback,
      'status': status,
      'updated_at': updatedAt,
    };
  }

  factory WithdrawModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return WithdrawModel(
      id: map['id'],
      accountId: map['account_id'],
      amount: map['amount'],
      bank: map['bank'],
      bankAgency: map['bank_ag'],
      accountType: map['account_type'],
      bankAccountNumber: map['bank_cc'],
      createdAt: map['created_at'],
      feedback: map['feedback'],
      status: map['status'],
      updatedAt: map['updated_at'],
    );
  }

  String toJson() => json.encode(toMap());

  factory WithdrawModel.fromJson(String source) =>
      WithdrawModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'WithdrawModel(id: $id, accountId: $accountId, amount: $amount, bank: $bank, bankAgency: $bankAgency, accountType: $accountType, bankAccountNumber: $bankAccountNumber, createdAt: $createdAt, feedback: $feedback, status: $status, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is WithdrawModel &&
        o.id == id &&
        o.accountId == accountId &&
        o.amount == amount &&
        o.bank == bank &&
        o.bankAgency == bankAgency &&
        o.accountType == accountType &&
        o.bankAccountNumber == bankAccountNumber &&
        o.createdAt == createdAt &&
        o.feedback == feedback &&
        o.status == status &&
        o.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        accountId.hashCode ^
        amount.hashCode ^
        bank.hashCode ^
        bankAgency.hashCode ^
        accountType.hashCode ^
        bankAccountNumber.hashCode ^
        createdAt.hashCode ^
        feedback.hashCode ^
        status.hashCode ^
        updatedAt.hashCode;
  }
}

/// Informações extras da conta
class Information {
  //[JsonProperty("key")]
  String key;

  //[JsonProperty("value")]
  String value;

  Information({
    this.key,
    this.value,
  });

  Information copyWith({
    String key,
    String value,
  }) {
    return Information(
      key: key ?? this.key,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'key': key,
      'value': value,
    };
  }

  factory Information.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Information(
      key: map['key'],
      value: map['value'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Information.fromJson(String source) =>
      Information.fromMap(json.decode(source));

  @override
  String toString() => 'Information(key: $key, value: $value)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Information && o.key == key && o.value == value;
  }

  @override
  int get hashCode => key.hashCode ^ value.hashCode;
}
