import 'package:intl/intl.dart';
import 'package:thanglong_university/app/enums/subject_group_status_enum.dart';
import 'package:thanglong_university/generated/json/base/json_convert_content.dart';
import 'package:thanglong_university/generated/json/base/json_field.dart';

class RegisterEntity with JsonConvert<RegisterEntity> {
  int endTime;
  int startTime;
  String groupId;
  String groupName;
  RegisterSemsterInfo semsterInfo;
  @JSONField(serialize: false, deserialize: false)
  SujectGroupStatusEnum status;
  String title;
  int v;
  DateTime updatedAt;
  String id;

  RegisterEntity({
    this.semsterInfo,
    this.status,
    this.endTime,
    this.startTime,
    this.groupId,
    this.groupName,
    this.v,
    this.updatedAt,
    this.id,
  });

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

  RegisterEntity fromJson(Map<String, dynamic> json) => RegisterEntity(
        semsterInfo: json["semsterInfo"] == null
            ? null
            : RegisterSemsterInfo().fromJson(json["semsterInfo"]),
        status: json["status"] == null
            ? null
            : subjectGroupStatus.map[json["status"]],
        endTime: json["endTime"] == null ? null : json["endTime"],
        startTime: json["startTime"] == null ? null : json["startTime"],
        groupId: json["groupId"] == null ? null : json["groupId"],
        groupName: json["groupName"] == null ? null : json["groupName"],
        v: json["__v"] == null ? null : json["__v"],
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "semsterInfo": semsterInfo == null ? null : semsterInfo.toJson(),
        "status": status == null ? null : status,
        "endTime": endTime == null ? null : endTime,
        "startTime": startTime == null ? null : startTime,
        "groupId": groupId == null ? null : groupId,
        "groupName": groupName == null ? null : groupName,
        "__v": v == null ? null : v,
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "id": id == null ? null : id,
      };
}

class RegisterSemsterInfo with JsonConvert<RegisterSemsterInfo> {
  String endTime;
  String id;
  String name;
  String startTime;
}
