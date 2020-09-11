import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:iugu/domain/entities/invoice_model.dart';
import 'package:iugu/iugu.dart';
import 'package:mobx/mobx.dart';

part 'invoices_controller.g.dart';

class InvoicesController = _InvoicesControllerBase with _$InvoicesController;

abstract class _InvoicesControllerBase with Store {
  final Invoice _invoice;

  _InvoicesControllerBase(this._invoice) {
    getInvoices();
  }

  @observable
  PaggedResponseMessage<InvoiceModel> result;

  @action
  Future getInvoices() async {
    result = await _invoice.getAll();
    print(result);
  }

  void consultarFatura(String id) async {
    try {
      var result = await _invoice.getById(id: id);

      Modular.to.showDialog(builder: (_) {
        return AlertDialog(
          content: Text(
            result.currency,
          ),
        );
      });
    } on DioError catch (e) {
      Modular.to.showDialog(builder: (_) {
        return AlertDialog(
          content: Text(
            e.response.data['errors'].toString(),
          ),
        );
      });
    }
  }

  void reembolsarFatura(String id) async {
    try {
      var result = await _invoice.refund(id: id);

      Modular.to.showDialog(builder: (_) {
        return AlertDialog(
          content: Text(
            result.currency,
          ),
        );
      });
    } on DioError catch (e) {
      Modular.to.showDialog(builder: (_) {
        return AlertDialog(
          content: Text(
            e.response.data['errors'].toString(),
          ),
        );
      });
    }
  }

  void capturarFatura(String id) async {
    try {
      var result = await _invoice.capture(id: id);

      Modular.to.showDialog(builder: (_) {
        return AlertDialog(
          content: Text(
            result.currency,
          ),
        );
      });
    } on DioError catch (e) {
      Modular.to.showDialog(builder: (_) {
        return AlertDialog(
          content: Text(
            e.response.data['errors'].toString(),
          ),
        );
      });
    }
  }

  void segundaViaFatura(String id, List<Item> invoiceItems) async {
    try {
      var result = await _invoice.duplicate(
        id: id,
        data: InvoiceDuplicateRequestMessage(
          ignoreCanceledEmail: false,
          ignoreDueEmail: false,
          invoiceItems: invoiceItems,
          newDueDate: DateTime.now().add(Duration(days: 5)).toString(),
        ),
      );

      Modular.to.showDialog(builder: (_) {
        return AlertDialog(
          content: Text(
            result.currency,
          ),
        );
      });
    } on DioError catch (e) {
      Modular.to.showDialog(builder: (_) {
        return AlertDialog(
          content: Text(
            e.response.data['errors'].toString(),
          ),
        );
      });
    }
  }
}
