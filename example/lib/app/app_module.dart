import 'package:iugu/iugu.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:example/app/app_widget.dart';
import 'package:example/app/modules/home/home_module.dart';

import 'modules/invoices/invoices_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind(
          (i) => IuguClient(
            properties: IuguProperties(
              apiKey: "6d066d71094216d9da6341bdbb4d95ca",
              urlApi: "https://api.iugu.com/v1/",
            ),
          ),
        ),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: HomeModule()),
        ModularRouter('/invoices', module: InvoicesModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
