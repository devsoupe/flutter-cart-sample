import 'package:intl/intl.dart';

class CurrencyUtils {
  static String getCommaWon(int value) {
    var f = NumberFormat('###,###');
    return f.format(value);
  }
}