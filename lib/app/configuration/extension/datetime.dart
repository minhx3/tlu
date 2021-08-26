import 'package:intl/intl.dart';

extension DateTimeFactory on DateTime {
  String format([String formatString = "dd/MM/yyyy"]) {
    if (this == null) return "";
    DateFormat format = DateFormat(formatString);
    return format.format(this);
  }
}
