import 'dart:convert';

import 'address_model.dart';

class AccountModel {
  AddressModel _address;
  String _fullAddress;

  /// Valor máximo da venda('Até R$ 100,00', 'Entre R$ 100,00 e R$ 500,00', 'Mais que R$ 500,00')
  String priceRange;

  /// Vende produtos físicos
  bool physicalProducts;

  /// Descrição do negócio
  String businessDescription;

  /// 'Pessoa Física' ou 'Pessoa Jurídica'
  String personType;

  /// Saque automático(Recomendamos que envie 'true')
  bool acceptAutomaticTransfer;

  /// CNPJ caso Pessoa Jurídica
  String cnpj;

  /// Nome da Empresa, caso Pessoa Jurídica
  String companyName;

  /// CPF caso Pessoa Física
  String cpf;

  /// Nome caso Pessoa Física
  String name;

  /// Telefone comercial
  String phone;

  /// Nome do Responsável, caso Pessoa Jurídica
  String respName;

  /// CPF do Responsável, caso Pessoa Jurídica
  String respCPF;

  /// Nome da instituição bancária
  /// Suportados : 'Itaú', 'Bradesco', 'Caixa Econômica', 'Banco do Brasil', 'Santander'
  String bank;

  /// Agência da Conta
  /// Formatos com validação automática(9999-D, 9999)
  String bankAgency;

  /// Tipo da conta: 'Corrente', 'Poupança'
  String accountType;

  /// Número da Conta
  /// Formatos com validação automática(99999999-D, XXX99999999-D onde X é Operação, 	9999999-D, 99999-D)
  String bankAccountNumber;

  /// Endreço Completo
  String get address => _address == null
      ? _fullAddress
      : "${_address.street}, ${_address.number} - ${_address.city} - ${_address.state}/${_address.country}";

  /// Cep
  String get cep => _address?.zipCode;

  /// Cidade
  String get city => _address?.city;

  /// Estado
  String get state => "${_address?.street} - ${_address?.number}";

  AccountModel(
    this._address,
    this._fullAddress, {
    this.priceRange,
    this.physicalProducts,
    this.businessDescription,
    this.personType,
    this.acceptAutomaticTransfer,
    this.cnpj,
    this.companyName,
    this.cpf,
    this.name,
    this.phone,
    this.respName,
    this.respCPF,
    this.bank,
    this.bankAgency,
    this.accountType,
    this.bankAccountNumber,
  });

  AccountModel copyWith(
    AddressModel _address,
    String _fullAddress, {
    String priceRange,
    bool physicalProducts,
    String businessDescription,
    String personType,
    bool acceptAutomaticTransfer,
    String cnpj,
    String companyName,
    String cpf,
    String name,
    String phone,
    String respName,
    String respCPF,
    String bank,
    String bankAgency,
    String accountType,
    String bankAccountNumber,
  }) {
    return AccountModel(
      _address ?? this._address,
      _fullAddress ?? this._fullAddress,
      priceRange: priceRange ?? this.priceRange,
      physicalProducts: physicalProducts ?? this.physicalProducts,
      businessDescription: businessDescription ?? this.businessDescription,
      personType: personType ?? this.personType,
      acceptAutomaticTransfer:
          acceptAutomaticTransfer ?? this.acceptAutomaticTransfer,
      cnpj: cnpj ?? this.cnpj,
      companyName: companyName ?? this.companyName,
      cpf: cpf ?? this.cpf,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      respName: respName ?? this.respName,
      respCPF: respCPF ?? this.respCPF,
      bank: bank ?? this.bank,
      bankAgency: bankAgency ?? this.bankAgency,
      accountType: accountType ?? this.accountType,
      bankAccountNumber: bankAccountNumber ?? this.bankAccountNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_address': _address?.toMap(),
      '_fullAddress': _fullAddress,
      'price_range': priceRange,
      'physical_products': physicalProducts,
      'business_type': businessDescription,
      'person_type': personType,
      'automatic_transfer': acceptAutomaticTransfer,
      'cnpj': cnpj,
      'company_name': companyName,
      'cpf': cpf,
      'name': name,
      'phone': phone,
      'resp_name': respName,
      'resp_cpf': respCPF,
      'bank': bank,
      'bank_ag': bankAgency,
      'account_type': accountType,
      'bank_cc': bankAccountNumber,
    };
  }

  factory AccountModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return AccountModel(
      AddressModel.fromMap(map['_address']),
      map['_fullAddress'],
      priceRange: map['price_range'],
      physicalProducts: map['physical_products'],
      businessDescription: map['business_type'],
      personType: map['person_type'],
      acceptAutomaticTransfer: map['automatic_transfer'],
      cnpj: map['cnpj'],
      companyName: map['company_name'],
      cpf: map['cpf'],
      name: map['name'],
      phone: map['phone'],
      respName: map['resp_name'],
      respCPF: map['resp_cpf'],
      bank: map['bank'],
      bankAgency: map['bank_ag'],
      accountType: map['account_type'],
      bankAccountNumber: map['bank_cc'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AccountModel.fromJson(String source) =>
      AccountModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AccountModel(_address: $_address, _fullAddress: $_fullAddress, priceRange: $priceRange, physicalProducts: $physicalProducts, businessDescription: $businessDescription, personType: $personType, acceptAutomaticTransfer: $acceptAutomaticTransfer, cnpj: $cnpj, companyName: $companyName, cpf: $cpf, name: $name, phone: $phone, respName: $respName, respCPF: $respCPF, bank: $bank, bankAgency: $bankAgency, accountType: $accountType, bankAccountNumber: $bankAccountNumber)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is AccountModel &&
        o._address == _address &&
        o._fullAddress == _fullAddress &&
        o.priceRange == priceRange &&
        o.physicalProducts == physicalProducts &&
        o.businessDescription == businessDescription &&
        o.personType == personType &&
        o.acceptAutomaticTransfer == acceptAutomaticTransfer &&
        o.cnpj == cnpj &&
        o.companyName == companyName &&
        o.cpf == cpf &&
        o.name == name &&
        o.phone == phone &&
        o.respName == respName &&
        o.respCPF == respCPF &&
        o.bank == bank &&
        o.bankAgency == bankAgency &&
        o.accountType == accountType &&
        o.bankAccountNumber == bankAccountNumber;
  }

  @override
  int get hashCode {
    return _address.hashCode ^
        _fullAddress.hashCode ^
        priceRange.hashCode ^
        physicalProducts.hashCode ^
        businessDescription.hashCode ^
        personType.hashCode ^
        acceptAutomaticTransfer.hashCode ^
        cnpj.hashCode ^
        companyName.hashCode ^
        cpf.hashCode ^
        name.hashCode ^
        phone.hashCode ^
        respName.hashCode ^
        respCPF.hashCode ^
        bank.hashCode ^
        bankAgency.hashCode ^
        accountType.hashCode ^
        bankAccountNumber.hashCode;
  }
}
