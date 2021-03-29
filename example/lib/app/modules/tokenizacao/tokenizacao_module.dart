import 'tokenizacao_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'tokenizacao_page.dart';

class TokenizacaoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => TokenizacaoController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => TokenizacaoPage()),
      ];

  static Inject get to => Inject<TokenizacaoModule>.of();
}
