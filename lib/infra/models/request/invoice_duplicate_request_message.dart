import 'dart:convert';
import 'package:iugu/domain/entities/invoice_model.dart';

class InvoiceDuplicateRequestMessage {
  /// Nova data de expiração (Formato: 'DD/MM/AAAA’).
  String? newDueDate;

  /// Adicione, altere ou remova itens a nova fatura.
  List<Item>? invoiceItems;

  /// Ignora o envio do e-mail de cobrança da nova fatura.
  bool? ignoreDueEmail;

  /// Ignora o envio do e-mail de cancelamento da fatura atual.
  bool? ignoreCanceledEmail;

  InvoiceDuplicateRequestMessage({
    this.newDueDate,
    this.invoiceItems,
    this.ignoreDueEmail,
    this.ignoreCanceledEmail,
  });

  InvoiceDuplicateRequestMessage copyWith({
    String? newDueDate,
    List<Item>? invoiceItems,
    bool? ignoreDueEmail,
    bool? ignoreCanceledEmail,
  }) {
    return InvoiceDuplicateRequestMessage(
      newDueDate: newDueDate ?? this.newDueDate,
      invoiceItems: invoiceItems ?? this.invoiceItems,
      ignoreDueEmail: ignoreDueEmail ?? this.ignoreDueEmail,
      ignoreCanceledEmail: ignoreCanceledEmail ?? this.ignoreCanceledEmail,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'due_date': newDueDate,
      'items': invoiceItems?.map((x) => x.toMap()).toList(),
      'ignore_due_email': ignoreDueEmail,
      'ignore_canceled_email': ignoreCanceledEmail,
    }..removeWhere((key, value) => value == null);
  }

  factory InvoiceDuplicateRequestMessage.fromMap(Map<String, dynamic> map) {
    return InvoiceDuplicateRequestMessage(
      newDueDate: map['due_date'],
      invoiceItems: List<Item>.from(map['items']?.map((x) => Item.fromMap(x))),
      ignoreDueEmail: map['ignore_due_email'],
      ignoreCanceledEmail: map['ignore_canceled_email'],
    );
  }

  String toJson() => json.encode(toMap());

  factory InvoiceDuplicateRequestMessage.fromJson(String source) => InvoiceDuplicateRequestMessage.fromMap(json.decode(source));

  @override
  String toString() {
    return 'InvoiceDuplicateRequestMessage(newDueDate: $newDueDate, invoiceItems: $invoiceItems, ignoreDueEmail: $ignoreDueEmail, ignoreCanceledEmail: $ignoreCanceledEmail)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is InvoiceDuplicateRequestMessage && o.newDueDate == newDueDate && o.ignoreDueEmail == ignoreDueEmail && o.ignoreCanceledEmail == ignoreCanceledEmail;
  }

  @override
  int get hashCode {
    return newDueDate.hashCode ^ invoiceItems.hashCode ^ ignoreDueEmail.hashCode ^ ignoreCanceledEmail.hashCode;
  }
}
