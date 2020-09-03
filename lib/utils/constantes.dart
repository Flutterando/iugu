/// Forma de pagamento cartão ou boleto
class PaymentMethod {
  static String ALL = "all";
  static String CREDIT_CARD = "credit_card";
  static String BANK_SLIP = "bank_slip";
}

/// Status da fatura ex: pago, draft, pendente, cancelado, etc.
class InvoiceStatus {
  static String DRAFT = "draft";
  static String PENDING = "pending";
  static String CANCELED = "canceled";
  static String PAID = "paid";
  static String PARTIALLY_PAID = "partially_paid";
  static String REFUNDED = "refunded";
  static String EXPIRED = "expired";
}

/// Os tipos de conta bancária suportados
class BankAccountType {
  static String SAVING_ACCOUNT = "Poupança";
  static String CHECKING_ACCOUNT = "Corrente";
  static String SAVING_ACCOUNT_ABBREVIATION = "cp";
  static String CHECKING_ACCOUNT_ABBREVIATION = "cc";
}

/// Os tipos de pessoa suportados
class PersonType {
  static String CORPORATE_ENTITY = "Pessoa Jurídica";
  static String INDIVIDUAL_PERSON = "Pessoa Física";
}

/// Os bancos suportados
class SupportedBanks {
  static String ITAU = "Itaú";
  static String BRADESCO = "Bradesco";
  static String CAIXA_ECONOMICA = "Caixa Econômica";
  static String BANCO_DO_BRASIL = "Banco do Brasil";
  static String SANTANDER = "Santander";
}

/// Os tipos de periodicidade e/ou recorrência
class GenerateCycleType {
  static String MONTHLY = "months";
  static String WEEKLY = "weeks";
}

/// Moedas disponíveis
class CurrencyTypes {
  static String BRL = "BRL";
}

/// Símbolo de moedas disponíveis
class CurrencySymbol {
  static String BRL = "R\$";
}
