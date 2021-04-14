// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoices_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InvoicesController on _InvoicesControllerBase, Store {
  final _$resultAtom = Atom(name: '_InvoicesControllerBase.result');

  @override
  PaggedResponseMessage<InvoiceModel>? get result {
    _$resultAtom.reportRead();
    return super.result;
  }

  @override
  set result(PaggedResponseMessage<InvoiceModel>? value) {
    _$resultAtom.reportWrite(value, super.result, () {
      super.result = value;
    });
  }

  final _$getInvoicesAsyncAction =
      AsyncAction('_InvoicesControllerBase.getInvoices');

  @override
  Future<dynamic> getInvoices() {
    return _$getInvoicesAsyncAction.run(() => super.getInvoices());
  }

  @override
  String toString() {
    return '''
result: ${result}
    ''';
  }
}
