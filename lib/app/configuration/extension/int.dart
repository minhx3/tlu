import 'package:intl/intl.dart';

extension NumberFormater on int {
  String currency([symbol = "đ"]) {
    var f = NumberFormat.currency(
        locale: "vi_VI", symbol: symbol, decimalDigits: 0);
    return f.format(this ?? 0);
  }

  String dateFormat([String format = "yyyy-MM-dd"]) {
    if (this <= 0 || this == null) return null;
    DateFormat _format = DateFormat(format);
    return _format.format(DateTime.fromMillisecondsSinceEpoch(this)).toString();
  }
}
