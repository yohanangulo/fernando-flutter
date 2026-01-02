import 'package:intl/intl.dart';

class HumanFormats {
  const HumanFormats._();

  static String number(double number) {
    final formatter = NumberFormat.compactCurrency(
      decimalDigits: 0,
      locale: 'en',
      symbol: '',
    );

    return formatter.format(number);
  }
}
