class UtilsIugu {
  bool validateAccountID(String accountId) {
    var reg = RegExp(r"(^[a-fA-F0-9]{8}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{4}-[a-fA-F0-9]{12})$");

    return reg.hasMatch(accountId);
  }

  bool validateCreditCardNumber(String creditCard) {
    var reg = RegExp(r"(/[^0-9-\s]+/)");

    if (0 == creditCard.length || reg.hasMatch(creditCard)) return false;

    creditCard = creditCard.replaceAll(RegExp(r"[^\d]"), "");

    var t = 0;
    var a = false;

    for (var r = creditCard.length - 1; r >= 0; r--) {
      var i = creditCard[r];
      var n = int.parse(i);

      if (a && (n *= 2) > 9 && (n -= 9) == 0) {
        t += n;
      } else {
        a = !a;
      }
    }
    return t % 10 == 0;
  }

  var _brands = [
    BrandType("elo", r"^[0-9]{3}$", r"^(4011(78|79)|43(1274|8935)|45(1416|7393|763(1|2))|50(4175|6699|67[0-7][0-9]|9000)|50(9[0-9][0-9][0-9])|627780|63(6297|6368)|650(03([^4])|04([0-9])|05(0|1)|05([7-9])|06([0-9])|07([0-9])|08([0-9])|4([0-3][0-9]|8[5-9]|9[0-9])|5([0-9][0-9]|3[0-8])|9([0-6][0-9]|7[0-8])|7([0-2][0-9])|541|700|720|727|901)|65165([2-9])|6516([6-7][0-9])|65500([0-9])|6550([0-5][0-9])|655021|65505([6-7])|6516([8-9][0-9])|65170([0-4]))"),
    BrandType("visa", r"^[0-9]{3}$", r"^4"),
    BrandType("mastercard", r"^[0-9]{3}$", r"^(5[1-5]|677189|222[1-9]|22[3-9]|2[3-6]|27[01]|2720)"),
    BrandType("amex", r"^[0-9]{4}$", r"^(34|37)"),
    BrandType("diners", r"^[0-9]{3}$", r"^(30|36|38|39)"),
  ];

  bool validateCVV(String name, String cvv) {
    var brand = _brands.firstWhere((element) => element.name == name.toLowerCase());

    return RegExp(brand.cvvPattern).hasMatch(cvv);
  }

  bool validateExpirationString(String date) {
    var monthYear = this.getMonthYearByFullExpiration(date);

    return this.validateExpiration(monthYear[0], monthYear[1]);
  }

  bool validateFirstName(String firstName) {
    return !(firstName.length == 0);
  }

  bool validateLastName(String lastName) {
    return !(lastName.length == 0);
  }

  List<String> getMonthYearByFullExpiration(String date) {
    var dateSplit = date.toString().split("/");

    return 2 == dateSplit.length
        ? [
            date[0],
            date[1]
          ]
        : [];
  }

  bool validateExpiration(String _month, String _year) {
    var month = int.tryParse(_month);
    var year = int.tryParse(_year);

    if (month == null || year == null) return false;

    if (0 == month) return false;

    if (month > 12 || 1 > month) return false;

    if (0 == year) return false;

    var today = DateTime.now();

    if (2 == _year.length) {
      year = int.tryParse("${today.year.toString().substring(0, 2)}$year");
    }

    if (year == null || year < today.year) return false;

    if (year == today.year) {
      if (month > 12 || month < today.month + 1) return false;
    } else if (year > today.year && (month > 12 || 1 > month)) return false;

    return true;
  }

  String? getBrandByCreditCardNumber(String creditCardNumber) {
    creditCardNumber = creditCardNumber.replaceAll(RegExp(r"[^\d]"), "");

    for (var brand in _brands) {
      if (RegExp(brand.brand).hasMatch(creditCardNumber)) return brand.name;
    }

    return null;
  }
}

class BrandType {
  final String _name;
  final String _cvvPattern;
  final String _brand;

  const BrandType(this._name, this._cvvPattern, this._brand);

  String get name => _name.toLowerCase();
  String get cvvPattern => _cvvPattern;
  String get brand => _brand;
}
