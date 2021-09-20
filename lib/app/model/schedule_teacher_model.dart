// To parse this JSON data, do
//
//     final scheduleTeacherModel = scheduleTeacherModelFromJson(jsonString);

import 'dart:convert';

ScheduleTeacherModel scheduleTeacherModelFromJson(String str) => ScheduleTeacherModel.fromJson(json.decode(str));

String scheduleTeacherModelToJson(ScheduleTeacherModel data) => json.encode(data.toJson());

class ScheduleTeacherModel {
  ScheduleTeacherModel({
    this.subjectClassId,
    this.subjectClassName,
    this.subjectId,
  });

  String subjectClassId;
  String subjectClassName;
  String subjectId;

  factory ScheduleTeacherModel.fromJson(Map<String, dynamic> json) => ScheduleTeacherModel(
    subjectClassId: json["subjectClassId"] == null ? null : json["subjectClassId"],
    subjectClassName: json["subjectClassName"] == null ? null : json["subjectClassName"],
    subjectId: json["subjectId"] == null ? null : json["subjectId"],
  );

  Map<String, dynamic> toJson() => {
    "subjectClassId": subjectClassId == null ? null : subjectClassId,
    "subjectClassName": subjectClassName == null ? null : subjectClassName,
    "subjectId": subjectId == null ? null : subjectId,
  };
}
