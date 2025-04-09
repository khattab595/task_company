import 'package:app/core/di/injector.dart';

class Validation {
  //"^5(\\d{8})\$"
  static bool isValidPhone(String phone) =>
      RegExp("^(5|05)(\\d{8})\$").hasMatch(phone);

  static bool isArabicLetters(String name) =>
      RegExp("^[\u0621-\u064A\\s]+\$").hasMatch(name);

  static bool isValidFullName(String name) =>
      RegExp("^[\u0621-\u064a\\s]{3,}(?: [\u0621-\u064a\\s]+){2}\$")
          .hasMatch(name);

  static bool isValidIDNumber(String id) =>
      RegExp("^[1-2][0-9]{1,10}\$").hasMatch(id);

  static bool isEmailValid(String email) => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);

  static String? validateEmail(String value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter a valid email address';
    } else {
      return null;
    }
  }

  static String? validateRequired(String value) {
    if (value.isEmpty) {
      return 'Enter a valid password';
    }
    return null;
  }

  static String? validatePhone(String value) {
    final strings = injector<ServicesLocator>().strings;
    if (value.isEmpty) {
      return strings.this_field_is_required;
    }
    // validate the number must start with 05
    else if (!value.startsWith('05')) {
      return strings.phone_number_must_start_with_05;
    } else if (value.length != 10) {
      return strings.phone_number_must_be_10_digits;
    }
    return null;
  }

  static String? validateIdNumber(String value) {
    final strings = injector<ServicesLocator>().strings;
    if (value.isEmpty) {
      return strings.this_field_is_required;
    }
    if (value.length != 10) {
      return strings.phone_number_must_be_10_digits;
    }
    return null;
  }

  // static String? validateSaleNumber(String value) {
  //   final strings = injector<ServicesLocator>().strings;
  //   if (value.isEmpty) {
  //     return strings.this_field_is_required;
  //   } else if (value.length != 6) {
  //     return strings.point_sale_number_must_be_6_digits;
  //   }
  //   return null;
  // }
}
