import 'dart:convert';

class AccountConfigurationRequestMessage {
  /// Percentual de comissionamento enviado para a conta que gerencia o marketplace (Valor entre 0 e 70)
  int commissionPercent;

  /// Saque automático
  bool autoWithdraw;

  /// Multa
  bool fines;

  /// Juros de mora
  bool perDayInterest;

  /// Valor da multa em % (Ex: 2)
  double latePaymentFine;

  /// Antecipação Automática. Só pode ser atribuído caso a conta tenha a funcionalidade de Novo Adiantamento habilitado (entre em contato com o Suporte para habilitar)
  bool autoAdvance;

  /// Opções de Antecipação Automática. Obrigatório caso auto_advance seja true. Recebe os valores 'daily' (Antecipação diária), 'weekly'
  /// (Antecipação semanal, que ocorre no dia da semana determinado pelo usuário), 'monthly' (Antecipação mensal, que ocorre no dia do
  /// mês determinado pelo usuário) e 'days_after_payment' (Antecipação que ocorre em um número de dias após o pagamento especificado pelo usuário)
  String autoAdvanceType;

  /// Obrigatório caso auto_advance seja true e auto_advance_type diferente de 'daily'. Em caso de auto_advance_type = weekly, recebe valores de 0 a 6
  /// (Número correspondente ao dia da semana que a antecipação será realizada, 0 para domingo, 1 para segunda e assim por diante). Em caso de auto_advance_type = monthly,
  /// recebe valores de 1 a 28 (Número correspondente ao dia do mês que a antecipação será realizada).  Em caso de auto_advance_type = days_after_payment,
  /// recebe valores de 1 a 30 (Número de dias após o pagamento em que a antecipação será realizada)
  String autoAdvanceOption;

  /// Configurações de Boleto Bancário
  BankSlipOptions bankSlipOptions;

  /// Configurações de Cartão de Crédito
  CreditCardOptions creditCardOptions;

  AccountConfigurationRequestMessage({
    this.commissionPercent,
    this.autoWithdraw,
    this.fines,
    this.perDayInterest,
    this.latePaymentFine,
    this.autoAdvance,
    this.autoAdvanceType,
    this.autoAdvanceOption,
    this.bankSlipOptions,
    this.creditCardOptions,
  });

  AccountConfigurationRequestMessage copyWith({
    int commissionPercent,
    bool autoWithdraw,
    bool fines,
    bool perDayInterest,
    double latePaymentFine,
    bool autoAdvance,
    String autoAdvanceType,
    String autoAdvanceOption,
    BankSlipOptions bankSlipOptions,
    CreditCardOptions creditCardOptions,
  }) {
    return AccountConfigurationRequestMessage(
      commissionPercent: commissionPercent ?? this.commissionPercent,
      autoWithdraw: autoWithdraw ?? this.autoWithdraw,
      fines: fines ?? this.fines,
      perDayInterest: perDayInterest ?? this.perDayInterest,
      latePaymentFine: latePaymentFine ?? this.latePaymentFine,
      autoAdvance: autoAdvance ?? this.autoAdvance,
      autoAdvanceType: autoAdvanceType ?? this.autoAdvanceType,
      autoAdvanceOption: autoAdvanceOption ?? this.autoAdvanceOption,
      bankSlipOptions: bankSlipOptions ?? this.bankSlipOptions,
      creditCardOptions: creditCardOptions ?? this.creditCardOptions,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'commission_percent': commissionPercent,
      'auto_withdraw': autoWithdraw,
      'fines': fines,
      'per_day_interest': perDayInterest,
      'late_payment_fine': latePaymentFine,
      'auto_advance': autoAdvance,
      'auto_advance_type': autoAdvanceType,
      'auto_advance_option': autoAdvanceOption,
      'bank_slip': bankSlipOptions?.toMap(),
      'credit_card': creditCardOptions?.toMap(),
    };
  }

  factory AccountConfigurationRequestMessage.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return AccountConfigurationRequestMessage(
      commissionPercent: map['commission_percent'],
      autoWithdraw: map['auto_withdraw'],
      fines: map['fines'],
      perDayInterest: map['per_day_interest'],
      latePaymentFine: map['late_payment_fine'],
      autoAdvance: map['auto_advance'],
      autoAdvanceType: map['auto_advance_type'],
      autoAdvanceOption: map['auto_advance_option'],
      bankSlipOptions: BankSlipOptions.fromMap(map['bank_slip']),
      creditCardOptions: CreditCardOptions.fromMap(map['credit_card']),
    );
  }

  String toJson() => json.encode(toMap());

  factory AccountConfigurationRequestMessage.fromJson(String source) =>
      AccountConfigurationRequestMessage.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AccountConfigurationRequestMessage(commission_percent: $commissionPercent, auto_withdraw: $autoWithdraw, fines: $fines, per_day_interest: $perDayInterest, late_payment_fine: $latePaymentFine, auto_advance: $autoAdvance, auto_advance_type: $autoAdvanceType, auto_advance_option: $autoAdvanceOption, bankSlipOptions: $bankSlipOptions, creditCardOptions: $creditCardOptions)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is AccountConfigurationRequestMessage &&
        o.commissionPercent == commissionPercent &&
        o.autoWithdraw == autoWithdraw &&
        o.fines == fines &&
        o.perDayInterest == perDayInterest &&
        o.latePaymentFine == latePaymentFine &&
        o.autoAdvance == autoAdvance &&
        o.autoAdvanceType == autoAdvanceType &&
        o.autoAdvanceOption == autoAdvanceOption &&
        o.bankSlipOptions == bankSlipOptions &&
        o.creditCardOptions == creditCardOptions;
  }

  @override
  int get hashCode {
    return commissionPercent.hashCode ^
        autoWithdraw.hashCode ^
        fines.hashCode ^
        perDayInterest.hashCode ^
        latePaymentFine.hashCode ^
        autoAdvance.hashCode ^
        autoAdvanceType.hashCode ^
        autoAdvanceOption.hashCode ^
        bankSlipOptions.hashCode ^
        creditCardOptions.hashCode;
  }
}

class BankSlipOptions {
  /// Ativo
  bool active;

  /// Dias de Vencimento Extras no Boleto (Ex: 2)
  int extraDueDays;

  /// Dias de Vencimento Extras na 2a Via do Boleto (Ex: 1)
  bool reprintExtraDueDays;

  BankSlipOptions({
    this.active,
    this.extraDueDays,
    this.reprintExtraDueDays,
  });

  BankSlipOptions copyWith({
    bool active,
    int extraDueDays,
    bool reprintExtraDueDays,
  }) {
    return BankSlipOptions(
      active: active ?? this.active,
      extraDueDays: extraDueDays ?? this.extraDueDays,
      reprintExtraDueDays: reprintExtraDueDays ?? this.reprintExtraDueDays,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'active': active,
      'extra_due': extraDueDays,
      'reprint_extra_due': reprintExtraDueDays,
    };
  }

  factory BankSlipOptions.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return BankSlipOptions(
      active: map['active'],
      extraDueDays: map['extra_due'],
      reprintExtraDueDays: map['reprint_extra_due'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BankSlipOptions.fromJson(String source) =>
      BankSlipOptions.fromMap(json.decode(source));

  @override
  String toString() =>
      'BankSlipOptions(active: $active, extraDueDays: $extraDueDays, reprintExtraDueDays: $reprintExtraDueDays)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is BankSlipOptions &&
        o.active == active &&
        o.extraDueDays == extraDueDays &&
        o.reprintExtraDueDays == reprintExtraDueDays;
  }

  @override
  int get hashCode =>
      active.hashCode ^ extraDueDays.hashCode ^ reprintExtraDueDays.hashCode;
}

class CreditCardOptions {
  /// Ativo
  bool active;

  /// Descrição que apareça na Fatura do Cartão do Cliente (Máx: 12 Caractéres)
  String softDescriptor;

  /// Ativar parcelamento
  bool installments;

  /// Repasse de Juros de Parcelamento ativo? true ou false
  bool installmentsPassInterest;

  /// Número máximo de parcelas (Nr entre 1 a 12)
  int maxInstallments;

  /// Número de parcelas sem cobrança de juros ao cliente (Nr entre 1 a 12)
  int maxInstallmentsWithoutInterest;

  /// Habilita o fluxo de pagamento em duas etapas (Autorização e Captura)
  bool twoStepTransaction;

  CreditCardOptions({
    this.active,
    this.softDescriptor,
    this.installments,
    this.installmentsPassInterest,
    this.maxInstallments,
    this.maxInstallmentsWithoutInterest,
    this.twoStepTransaction,
  });

  CreditCardOptions copyWith({
    bool active,
    String softDescriptor,
    bool installments,
    bool installmentsPassInterest,
    int maxInstallments,
    int maxInstallmentsWithoutInterest,
    bool twoStepTransaction,
  }) {
    return CreditCardOptions(
      active: active ?? this.active,
      softDescriptor: softDescriptor ?? this.softDescriptor,
      installments: installments ?? this.installments,
      installmentsPassInterest:
          installmentsPassInterest ?? this.installmentsPassInterest,
      maxInstallments: maxInstallments ?? this.maxInstallments,
      maxInstallmentsWithoutInterest:
          maxInstallmentsWithoutInterest ?? this.maxInstallmentsWithoutInterest,
      twoStepTransaction: twoStepTransaction ?? this.twoStepTransaction,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'active': active,
      'soft_descriptor': softDescriptor,
      'installments': installments,
      'installments_pass_interest': installmentsPassInterest,
      'max_installments': maxInstallments,
      'max_installments_without_interest': maxInstallmentsWithoutInterest,
      'two_step_transaction': twoStepTransaction,
    };
  }

  factory CreditCardOptions.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return CreditCardOptions(
      active: map['active'],
      softDescriptor: map['soft_descriptor'],
      installments: map['installments'],
      installmentsPassInterest: map['installments_pass_interest'],
      maxInstallments: map['max_installments'],
      maxInstallmentsWithoutInterest: map['max_installments_without_interest'],
      twoStepTransaction: map['two_step_transaction'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CreditCardOptions.fromJson(String source) =>
      CreditCardOptions.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CreditCardOptions(active: $active, soft_descriptor: $softDescriptor, installments: $installments, installments_pass_interest: $installmentsPassInterest, max_installments: $maxInstallments, max_installments_without_interest: $maxInstallmentsWithoutInterest, two_step_transaction: $twoStepTransaction)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CreditCardOptions &&
        o.active == active &&
        o.softDescriptor == softDescriptor &&
        o.installments == installments &&
        o.installmentsPassInterest == installmentsPassInterest &&
        o.maxInstallments == maxInstallments &&
        o.maxInstallmentsWithoutInterest == maxInstallmentsWithoutInterest &&
        o.twoStepTransaction == twoStepTransaction;
  }

  @override
  int get hashCode {
    return active.hashCode ^
        softDescriptor.hashCode ^
        installments.hashCode ^
        installmentsPassInterest.hashCode ^
        maxInstallments.hashCode ^
        maxInstallmentsWithoutInterest.hashCode ^
        twoStepTransaction.hashCode;
  }
}
