import 'dart:convert';

class CreateTokenModel {
  CreateTokenModel({
    this.id,
    this.method,
    this.extraInfo,
    this.test,
  });

  final String id;
  final String method;
  final ExtraInfo extraInfo;
  final bool test;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "id": id,
        "method": method,
        "extra_info": extraInfo.toMap(),
        "test": test,
      };
}

class ExtraInfo {
  ExtraInfo({
    this.brand,
    this.holderName,
    this.displayNumber,
    this.bin,
    this.month,
    this.year,
  });

  final String brand;
  final String holderName;
  final String displayNumber;
  final String bin;
  final int month;
  final int year;

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "brand": brand,
        "holder_name": holderName,
        "display_number": displayNumber,
        "bin": bin,
        "month": month,
        "year": year,
      };
}
