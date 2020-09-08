import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'invoices_controller.dart';

class InvoicesPage extends StatefulWidget {
  final String title;
  const InvoicesPage({Key key, this.title = "Invoices"}) : super(key: key);

  @override
  _InvoicesPageState createState() => _InvoicesPageState();
}

class _InvoicesPageState
    extends ModularState<InvoicesPage, InvoicesController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Observer(builder: (_) {
        if (controller.result == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return ListView.builder(
            itemCount: controller.result.totalItems,
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(controller.result.items[index].email),
                          Text(controller
                              .result.items[index].variables[9].value),
                        ],
                      ),
                      Column(
                        children: [
                          RaisedButton(
                            onPressed: () {
                              controller.consultarFatura(
                                  controller.result.items[index].id);
                            },
                            child: Text(
                              "Consultar Fatura",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            color: Colors.red,
                          ),
                          RaisedButton(
                            onPressed: () {
                              controller.capturarFatura(
                                  controller.result.items[index].id);
                            },
                            child: Text(
                              "Capturar Fatura",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            color: Colors.blue,
                          ),
                          RaisedButton(
                            onPressed: () {
                              controller.reembolsarFatura(
                                  controller.result.items[index].id);
                            },
                            child: Text(
                              "Reembolso Fatura",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            color: Colors.blue,
                          ),
                          RaisedButton(
                            onPressed: () {
                              controller.segundaViaFatura(
                                controller.result.items[index].id,
                                controller.result.items[index].items,
                              );
                            },
                            child: Text(
                              "Segunda Via Fatura",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            color: Colors.blue,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            });
      }),
    );
  }
}
