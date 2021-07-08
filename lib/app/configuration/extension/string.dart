
import 'package:intl/intl.dart';
import 'package:thanglong_university/app/model/schedule_model.dart';

extension CurrencyProperty on String {
  String get formatCurrency {
    final money = num.parse(this);
    final format =
    NumberFormat.currency(locale: "vi", decimalDigits: 0, symbol: "đ");
    return format.format(money).replaceAll(".", ".");
  }
  String get formatCurrencyVND {
    final money = num.parse(this);
    final format =
    NumberFormat.currency(locale: "vi", decimalDigits: 0, symbol: "VNĐ");
    return format.format(money).replaceAll(",", ".");
  }

  String get removeCurrency {
    return this.replaceAll(",", "").replaceAll("đ", "").replaceAll(" ", "");
  }
}

extension XSchedule on ScheduleModel {
  String get getTime {
    DateTime startDate = DateTime.fromMicrosecondsSinceEpoch(this.startTime).toLocal();
    DateTime endDate = DateTime.fromMicrosecondsSinceEpoch(this.endTime).toLocal();

    String startTime = DateFormat('hh#mm').format(startDate);
    String endTime = DateFormat('hh#mm').format(endDate);
    // 10h00 - 10h50 - 16/04/2021
    String time = '$startTime - $endTime';
    return time.replaceAll('#', 'h');
  }
}
