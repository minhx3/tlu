import 'package:intl/intl.dart';

extension NumberFormater on int {
  String currency([symbol = "đ"]) {
    var f = NumberFormat.currency(
        locale: "vi_VI", symbol: symbol, decimalDigits: 0);
    return f.format(this ?? 0);
  }
}
