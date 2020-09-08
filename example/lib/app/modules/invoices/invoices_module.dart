import 'package:iugu/iugu.dart';

import 'invoices_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';
import 'invoices_page.dart';

class InvoicesModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => InvoicesController(i())),
        Bind((i) => Invoice(i())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => InvoicesPage()),
      ];

  static Inject get to => Inject<InvoicesModule>.of();
}
