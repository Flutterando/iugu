import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'tokenizacao_controller.dart';

class TokenizacaoPage extends StatefulWidget {
  final String title;
  const TokenizacaoPage({Key? key, this.title = "Tokenizacao"}) : super(key: key);

  @override
  _TokenizacaoPageState createState() => _TokenizacaoPageState();
}

class _TokenizacaoPageState extends ModularState<TokenizacaoPage, TokenizacaoController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[],
        ),
      ),
    );
  }
}
