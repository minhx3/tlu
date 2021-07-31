import 'dart:convert';

import 'package:thanglong_university/app/model/register_subject_entity.dart';

SubjectCartModel subjectCartModelFromJson(String str) =>
    SubjectCartModel.fromJson(json.decode(str));

String subjectCartModelToJson(SubjectCartModel data) =>
    json.encode(data.toJson());

class SubjectCartModel {
  SubjectCartModel({
    this.sumSchoolFee,
    this.sumCredits,
    this.subjectClasses,
  });

  int sumSchoolFee;
  int sumCredits;
  List<SubjectClass> subjectClasses;

  factory SubjectCartModel.fromJson(Map<String, dynamic> json) =>
      SubjectCartModel(
        sumSchoolFee:
            json["sumSchoolFee"] == null ? null : json["sumSchoolFee"],
        sumCredits: json["sumCredits"] == null ? null : json["sumCredits"],
        subjectClasses: json["subjectClasses"] == null
            ? null
            : List<SubjectClass>.from(
                json["subjectClasses"].map((x) => SubjectClass.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "sumSchoolFee": sumSchoolFee == null ? null : sumSchoolFee,
        "sumCredits": sumCredits == null ? null : sumCredits,
        "subjectClasses": subjectClasses == null
            ? null
            : List<dynamic>.from(subjectClasses.map((x) => x.toJson())),
      };
}

class SubjectClass {
  SubjectClass({
    this.id,
    this.name,
    this.status,
    this.listTimelineClass,
  });

  String id;
  String name;
  String status;
  List<ListTimelineClass> listTimelineClass;

  String get getAllTime {
    return listTimelineClass
        .map((e) => e.listSchedule.map((e) => e.getTime))
        .join(',');
  }

  factory SubjectClass.fromJson(Map<String, dynamic> json) => SubjectClass(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        status: json["status"] == null ? null : json["status"],
        listTimelineClass: json["listTimelineClass"] == null
            ? null
            : List<ListTimelineClass>.from(json["listTimelineClass"]
                .map((x) => ListTimelineClass.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "status": status == null ? null : status,
        "listTimelineClass": listTimelineClass == null
            ? null
            : List<dynamic>.from(listTimelineClass.map((x) => x.toJson())),
      };
}

class ListTimelineClass {
  ListTimelineClass({
    this.fromDate,
    this.isExerciseClass,
    this.toDate,
    this.listSchedule,
  });

  DateTime fromDate;
  bool isExerciseClass;
  DateTime toDate;
  List<RegisterSubjectListTimelineClassTimeLinesListSchedule> listSchedule;

  factory ListTimelineClass.fromJson(Map<String, dynamic> json) =>
      ListTimelineClass(
        fromDate:
            json["fromDate"] == null ? null : DateTime.parse(json["fromDate"]),
        isExerciseClass:
            json["isExerciseClass"] == null ? null : json["isExerciseClass"],
        toDate: json["toDate"] == null ? null : DateTime.parse(json["toDate"]),
        listSchedule: json["listSchedule"] == null
            ? null
            : List<RegisterSubjectListTimelineClassTimeLinesListSchedule>.from(
                json["listSchedule"].map((x) =>
                    RegisterSubjectListTimelineClassTimeLinesListSchedule()
                        .fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "fromDate": fromDate == null
            ? null
            : "${fromDate.year.toString().padLeft(4, '0')}-${fromDate.month.toString().padLeft(2, '0')}-${fromDate.day.toString().padLeft(2, '0')}",
        "isExerciseClass": isExerciseClass == null ? null : isExerciseClass,
        "toDate": toDate == null
            ? null
            : "${toDate.year.toString().padLeft(4, '0')}-${toDate.month.toString().padLeft(2, '0')}-${toDate.day.toString().padLeft(2, '0')}",
        "listSchedule": listSchedule == null
            ? null
            : List<dynamic>.from(listSchedule.map((x) => x.toJson())),
      };
}
