import 'package:iugu/iugu.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final Customer customer;
  _HomeControllerBase(this.customer) {
    getAll();
  }

  Future getAll() async {
    // var includeUser = await customer.put(
    //   id: "05A332DBB3624638A1BB6958DB10A9C2",
    //   model: CustomerModel(
    //     id: "05A332DBB3624638A1BB6958DB10A9C2",
    //     email: 'vilsonblanco@gmail.com',
    //     name: 'Changed e',
    //     complement: 'Casa',
    //     cpfCnpj: '00858656051',
    //     number: 332,
    //     notes: 'Notes',
    //     zipCode: '95110-651',
    //   ),
    // );
    // print(includeUser);
    // var res = await customer.get();

    // var result = await customer.getById(id: "DD7F0CD3343548BABD97D7E1AB36FE10");
    // print(result);
    // var deleted = await customer.delete(id: "DD7F0CD3343548BABD97D7E1AB36FE10");
  }

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
