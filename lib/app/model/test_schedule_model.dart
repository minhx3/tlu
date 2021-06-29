// To parse this JSON data, do
//
//     final testScheduleModel = testScheduleModelFromJson(jsonString);

import 'dart:convert';

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
  });

  String id;
  String address;
  DateTime date;
  int session;
  String status;
  String subjectClassId;
  String subjectClassName;

  factory TestScheduleModel.fromJson(Map<String, dynamic> json) =>
      TestScheduleModel(
        id: json["_id"] == null ? null : json["_id"],
        address: json["address"] == null ? null : json["address"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        session: json["session"] == null ? null : json["session"],
        status: json["status"] == null ? null : json["status"],
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
}
