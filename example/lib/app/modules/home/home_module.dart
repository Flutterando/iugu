import 'package:dio/dio.dart';
import 'package:iugu/iugu.dart';

import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i())),
        Bind(
          (i) => IuguClient(
            properties: IuguProperties(
              apiKey: "6d066d71094216d9da6341bdbb4d95ca",
              urlApi: "https://api.iugu.com/v1/",
            ),
          ),
        ),
        Bind((i) => Customer(i())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
