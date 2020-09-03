/// Tipo de intervalos de plano

enum PlanIntervalType {
  /// Plano com um ciclo semanal

  Weekly,

  /// Plano com um ciclo mensal

  Monthly
}

/// Moedas suportadas

enum CurrencyType {
  /// Moeda brasileira

  BRL
}

/// Bancos disponíveis

class AvailableBanks extends Enum<int> {
  // CaixaEconomicaFederal = 104,
  //  BancoDoBrasil = 001,
  //  Bradesco = 237,
  //   Itau = 341,
  //   Santander = 033,
  //    HSBC = 399

  const AvailableBanks._internal(int val, {String name}) : super(val, name);

  static const CaixaEconomicaFederal = 104;
  static const BancoDoBrasil = 001;
  static const Bradesco = 237;
  static const Itau = 341;
  static const Santander = 033;
  static const HSBC = 399;
}

/// Status da fatura

enum InvoiceAvailableStatus {
  Paid,
  Canceled,
  PartiallyPaid,
  Pending,
  Draft,
  Refunded,
  Expired
}

/// Person type
enum PersonType {
  /// Pessoa Jurídica
  CorporateEntity,

  /// Pessoa física
  IndividualPerson
}

/// Bank account type
enum BankAccountType {
  /// Conta poupança
  SavingAccount,

  /// Conta Corrente
  CheckingAccount
}

enum BankAccountTypeAbbreviation {
  /// Conta poupança
  CP,

  /// Conta Corrente
  CC
}

/// Metodos de pagamento suportado
enum PaymentMethod {
  /// Todos os tipos de pagamentos serão aceitos
  All,

  /// Cartão de crédito

  CreditCard,

  /// Boleto bancário
  BankSlip
}

/// Tipo de Ordenaçãp

enum ResultOrderType {
  /// Menor para o maior
  Ascending,

  /// Maior para o menor
  Descending
}

/// Campos com Ordenações suportadas
enum FieldSort {
  Id,
  Status,
  CreateAt,
  UpdateAt,
  Amount,
  AccountName,
  Name,
}

/// The new baseclass for all enum's
abstract class Enum<T> {
  /// The value that this enum-member is holding
  final T _value;

  /// The optional name of this enum-member, is only used in [toString()]
  final String _name;
  const Enum(this._value, this._name);

  // Returns the holded value
  T get value => _value;

  // Returns the name, maybe null
  String get name => _name;

  /// Returns string representation of the enum
  ///
  /// if [_name] is a non-null string, then its
  /// used in the result, otherwise not
  toString() {
    if (this.name == null) {
      return 'Enum.$runtimeType.$_value';
    }
    return 'Enum.$runtimeType.$_name:$_value';
  }
}
