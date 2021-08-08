import 'package:intl/intl.dart';
import 'package:thanglong_university/generated/json/base/json_convert_content.dart';
import 'package:thanglong_university/app/configuration/base/enum-values.dart';

class RegisterEntity with JsonConvert<RegisterEntity> {
  int endTime;
  int startTime;
  String groupId;
  String groupName;
  RegisterSemsterInfo semsterInfo;
  RegisterStatusEnum status;
  String title;

  String get getTime {
    DateTime startDate =
        DateTime.fromMicrosecondsSinceEpoch(this.startTime).toLocal();

    String startTime = DateFormat('hh#mm').format(startDate);
    //16/04/2021
    String time = '$startTime';
    return time.replaceAll('#', 'h');
  }

  String get getDay {
    DateTime startDate =
        DateTime.fromMicrosecondsSinceEpoch(this.startTime).toLocal();

    String startTime = DateFormat('dd/MM/yyyy').format(startDate);
    //16/04/2021
    String day = '$startTime';
    return day;
  }

  String get getRegisterTime {
    DateTime startDate =
        DateTime.fromMicrosecondsSinceEpoch(this.startTime).toLocal();
    DateTime endDate =
        DateTime.fromMicrosecondsSinceEpoch(this.endTime).toLocal();
    String startTime = DateFormat('hh:mm dd/MM/yyyy').format(startDate);
    String endTime = DateFormat('hh:mm dd/MM/yyyy').format(endDate);
    // 08:00 15/07/2021 - 09:00 17/07/2021
    String day = '$startTime - $endTime';
    return day;
  }

  getIsOpenReigsterTime() {
    final now = DateTime.now().millisecondsSinceEpoch;
    return startTime > now && startTime - now <= 48 ? true : false;
  }

  int getCountDownTime() => DateTime.now()
      .add(Duration(
          milliseconds: startTime - DateTime.now().millisecondsSinceEpoch))
      .millisecondsSinceEpoch;
}

class RegisterSemsterInfo with JsonConvert<RegisterSemsterInfo> {
  String endTime;
  String id;
  String name;
  String startTime;
}

enum RegisterStatusEnum { OPEN, RE_OPEN, PENDING, CLOSE }

final registerStatus = EnumValues({
  "OPEN": RegisterStatusEnum.OPEN,
  "RE_OPEN": RegisterStatusEnum.RE_OPEN,
  "PENDING": RegisterStatusEnum.PENDING,
  "CLOSE": RegisterStatusEnum.CLOSE,
});

final registerStatusSwitch = EnumValues({
  "Đang mở": RegisterStatusEnum.OPEN,
  "Mở lại": RegisterStatusEnum.RE_OPEN,
  "Sắp mở": RegisterStatusEnum.PENDING,
  "Đã khóa": RegisterStatusEnum.CLOSE,
});
