// To parse this JSON data, do
//
//     final testScheduleModel = testScheduleModelFromJson(jsonString);

import 'dart:convert';
import 'dart:ui';

import 'package:intl/intl.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';

class TestStatus {
  final String title;
  final Color color;

  TestStatus(this.title, this.color);
}

List<TestScheduleModel> testScheduleModelFromJson(String str) =>
    List<TestScheduleModel>.from(
        json.decode(str).map((x) => TestScheduleModel.fromJson(x)));

String testScheduleModelToJson(List<TestScheduleModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TestScheduleModel {
  TestScheduleModel({
    this.id,
    this.address,
    this.date,
    this.session,
    this.status,
    this.subjectClassId,
    this.subjectClassName,
    this.banned,
  });

  String id;
  String address;
  DateTime date;
  int session;
  String status;
  String subjectClassId;
  String subjectClassName;
  String banned;

  factory TestScheduleModel.fromJson(Map<String, dynamic> json) =>
      TestScheduleModel(
        id: json["_id"] == null ? null : json["_id"],
        address: json["address"] == null ? null : json["address"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        session: json["session"] == null ? null : json["session"],
        status: json["status"] == null ? null : json["status"],
        banned: json["banned"] == null ? null : json["banned"],
        subjectClassId:
            json["subjectClassId"] == null ? null : json["subjectClassId"],
        subjectClassName:
            json["subjectClassName"] == null ? null : json["subjectClassName"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "address": address == null ? null : address,
        "date": date == null ? null : date.toIso8601String(),
        "session": session == null ? null : session,
        "status": status == null ? null : status,
        "subjectClassId": subjectClassId == null ? null : subjectClassId,
        "subjectClassName": subjectClassName == null ? null : subjectClassName,
      };

  String get getTime {
    if (status == 'BANNED') {
      return banned;
    }
    return 'Ca ${session}, ${DateFormat('dd/mm/yy').format(date)}';
  }

  TestStatus get getStatus {
    TestStatus res;
    switch (status) {
      case 'NEWR':
        res = TestStatus('Mới có', AppColor.c31B27C);
        break;
      case 'ONGOING':
        res = TestStatus(address, AppColor.c000333);
        break;
      case 'FINISH':
        res = TestStatus('Thi xong', AppColor.c31B27C);
        break;
      case 'BANNED':
        res = TestStatus('Bị cấm thi', AppColor.cfc7171);
        break;
      default:
    }
    return res;
  }
}
