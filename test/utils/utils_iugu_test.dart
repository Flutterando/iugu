import 'package:test/test.dart';
import 'package:iugu/utils/utils_iugu.dart';

void main() {
  group("validateAccountID", () {
    test('valid', () {
      var result =
          UtilsIugu().validateAccountID("2978ace8-1f93-4c24-abc5-e3cd575983d4");
      expect(result, true);
    });
    test('invalid', () {
      expect(UtilsIugu().validateAccountID(""), false);
    });
    test('invalid with null', () {
      expect(UtilsIugu().validateAccountID(null), false);
    });

    test('invalid with wrong size of caracters at 1 segment', () {
      expect(
          UtilsIugu()
              .validateAccountID("2978ace8a-1f93-4c24-abc5-e3cd575983d4"),
          false);
    });
    test('invalid with wrong size of caracters at 2 segment', () {
      expect(
          UtilsIugu()
              .validateAccountID("2978ace8-1f932-4c24-abc5-e3cd575983d4"),
          false);
    });
    test('invalid with wrong size of caracters at 3 segment', () {
      expect(
          UtilsIugu()
              .validateAccountID("2978ace8-1f93-4c245-abc5-e3cd575983d4"),
          false);
    });

    test('invalid with wrong size of caracters at 4 segment', () {
      expect(
          UtilsIugu()
              .validateAccountID("2978ace8-1f93-4c24-abc55-e3cd575983d4"),
          false);
    });
    test('invalid with wrong size of caracters at 5 segment', () {
      expect(
          UtilsIugu()
              .validateAccountID("2978ace8-1f93-4c24-abc5-e3cd575983d45"),
          false);
    });
  });

  group("Credit Card Valid", () {
    test("Valid", () {
      var result = UtilsIugu().validateCreditCardNumber("5443 0075 5324 3477");
      expect(result, true);
    });
  });

  group("ELO validate CVV", () {
    test("Valid", () {
      var result = UtilsIugu().validateCVV("elo", "123");
      expect(result, true);
    });
    test("With Cvv null", () {
      var result = UtilsIugu().validateCVV("elo", null);
      expect(result, false);
    });
    test("With Cvv Greater then 3", () {
      var result = UtilsIugu().validateCVV("elo", "1233");
      expect(result, false);
    });
    test("With Cvv Lower then 3", () {
      var result = UtilsIugu().validateCVV("elo", "13");
      expect(result, false);
    });
  });

  group("VISA validate CVV", () {
    test("Valid", () {
      var result = UtilsIugu().validateCVV("visa", "123");
      expect(result, true);
    });
    test("With Cvv null", () {
      var result = UtilsIugu().validateCVV("visa", null);
      expect(result, false);
    });
    test("With Cvv Greater then 3", () {
      var result = UtilsIugu().validateCVV("visa", "1233");
      expect(result, false);
    });

    test("With Cvv Lower then 3", () {
      var result = UtilsIugu().validateCVV("visa", "12");
      expect(result, false);
    });
  });

  group("MASTERCARD validate CVV", () {
    test("Valid", () {
      var result = UtilsIugu().validateCVV("mastercard", "123");
      expect(result, true);
    });
    test("With Cvv null", () {
      var result = UtilsIugu().validateCVV("mastercard", null);
      expect(result, false);
    });
    test("With Cvv Greater then 3", () {
      var result = UtilsIugu().validateCVV("mastercard", "1233");
      expect(result, false);
    });

    test("With Cvv Lower then 3", () {
      var result = UtilsIugu().validateCVV("mastercard", "12");
      expect(result, false);
    });
  });
  group("AMEX validate CVV", () {
    test("Valid", () {
      var result = UtilsIugu().validateCVV("amex", "1234");
      expect(result, true);
    });
    test("With Cvv null", () {
      var result = UtilsIugu().validateCVV("amex", null);
      expect(result, false);
    });
    test("With Cvv Greater then 4", () {
      var result = UtilsIugu().validateCVV("amex", "12335");
      expect(result, false);
    });

    test("With Cvv lower then 4", () {
      var result = UtilsIugu().validateCVV("amex", "123");
      expect(result, false);
    });
  });

  group("DINER validate CVV", () {
    test("Valid", () {
      var result = UtilsIugu().validateCVV("diners", "123");
      expect(result, true);
    });
    test("With Cvv null", () {
      var result = UtilsIugu().validateCVV("diners", null);
      expect(result, false);
    });
    test("With Cvv Greater then 3", () {
      var result = UtilsIugu().validateCVV("diners", "1233");
      expect(result, false);
    });
    test("With Cvv Lower then 3", () {
      var result = UtilsIugu().validateCVV("diners", "12");
      expect(result, false);
    });
  });

  group("GetBrandByCreditCardNumber", () {
    test("Valid visa", () {
      var result = UtilsIugu().getBrandByCreditCardNumber("4763133370431486");
      expect(result, "visa");
    });

    test("Valid visa", () {
      var result = UtilsIugu().getBrandByCreditCardNumber("4330465221809");
      expect(result, "visa");
    });

    test("Valid mastercard", () {
      var result = UtilsIugu().getBrandByCreditCardNumber("5288935326108908");
      expect(result, "mastercard");
    });

    test("Valid diners", () {
      var result = UtilsIugu().getBrandByCreditCardNumber("30571426367268");
      expect(result, "diners");
    });

    test("Valid amex", () {
      var result = UtilsIugu().getBrandByCreditCardNumber("3780 146275 28784");
      expect(result, "amex");
    });

    test("Valid elo", () {
      var result = UtilsIugu().getBrandByCreditCardNumber("4514169467162214");
      expect(result, "elo");
    });
  });
}
