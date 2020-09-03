import 'package:iugu/domain/entities/invoice_item.dart';
import 'package:iugu/domain/entities/payer_model.dart';

/// Requisição para efetuar uma cobrança, no momento apenas suporte a boletos
class ChargeRequestMessage {
  /// Método de Pagamento (Atualmente só suporta bank_slip, que é o boleto) - Opicional se enviar o Token
  // [JsonProperty("method")]
  String method;

  /// ID do Token. Em caso de Marketplace, é possível enviar um token criado pela conta mestre - Opicional caso method seja bank_slip
  //[JsonProperty("token")]
  String token;

  /// ID da Forma de Pagamento do Cliente. Em caso de Marketplace, é possível enviar um customer_payment_method_id de um Cliente criado pela conta mestre
  /// Opcional caso method seja bank_slip ou utilize token)
  //[JsonProperty("customer_payment_method_id")]
  String customerPaymentMethodId;

  /// ID do Cliente. Utilizado para vincular a Fatura a um Cliente - Opcional
  // [JsonProperty("customer_id ")]
  String customerId;

  /// ID da Fatura a ser utilizada para pagamento - Opcional
  //   [JsonProperty("invoice_id ")]
  String invoiceId;

  /// E-mail do Cliente - Opcional caso seja enviado um invoice_id
  //  [JsonProperty("email")]
  String email;

  /// Número de Parcelas (2 até 12), não é necessário passar 1 - Opcional
  //   [JsonProperty("months")]
  int months;

  /// Valor dos Descontos em centavos. Funciona apenas para Cobranças Diretas criadas com Itens - Opcional
  // [JsonProperty("discount_cents")]
  int discountCents;

  /// Itens da Fatura que será gerada - Opcional caso seja enviado um invoice_id
  //    [JsonProperty("items")]
  List<InvoiceItem> invoiceItems;

  /// Informações do Cliente para o Anti Fraude ou Boleto
  /// Necessário caso sua conta necessite de anti fraude ou para informações do boleto
  //   [JsonProperty("payer")]
  PayerModel payerCustomer;
}
