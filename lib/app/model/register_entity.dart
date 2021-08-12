import 'package:intl/intl.dart';
import 'package:thanglong_university/app/enums/subject_group_status_enum.dart';
import 'package:thanglong_university/generated/json/base/json_convert_content.dart';

class RegisterEntity with JsonConvert<RegisterEntity> {
  int endTime;
  int startTime;
  String groupId;
  String groupName;
  RegisterSemsterInfo semsterInfo;
  SujectGroupStatusEnum status;
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
