# iugu
Client Flutter/Dart de acesso aos principais recursos da Api da **IUGU**



### Configuração

* Em algum *StartUp* de seu projeto, é necessário adicionar a apiKey encontrada no seu painel [administrativo da IUGU](https://iugu.com/a/administration), em *Administração* > *Configuração de Contas*. Nesta tela você encontra seu *ID da Conta* 

```dart
IuguClient(
        properties: IuguProperties(
          apiKey: "SUA_APP_KEY_DA_IUGU",
          urlApi: "https://api.iugu.com/v1/",
        ),
      );
```
### Documentação completa da API
A referência completa da Api pode ser encontrada em [IUGU Api](https://iugu.com/referencias/api)

### Exemplo ([outros exemplos](https://github.com/Flutterando/iugu/tree/master/test/integrated_tests))

* Lista Clientes

```dart

var meuIuguClient = IuguClient(
        properties: IuguProperties(
          apiKey: "SUA_APP_KEY_DA_IUGU",
          urlApi: "https://api.iugu.com/v1/",
        ),
      );

 var apiClient = Customer(meuIuguClient);

      myCustomer = await apiClient.create(
          request: CustomerRequestMessage(
              email: "bwolfnoob@gmail.com",
              name: "Bwolf Teste 2 Flutter/Dart",
              notes: "teste da api em Flutter/Dart",
              customVariables: custom));

```

### Informações Adicionais
* Este projeto foi todo feito com base nas APIs da Iugu e no projeto com o mesmo proposito desenvolvido em  [.NET](https://github.com/iugu/iugu-net)