// To parse this JSON data, do
//
//     final subjectModel = subjectModelFromJson(jsonString);

import 'dart:convert';

import 'package:thanglong_university/app/model/teacher_model.dart';

List<SubjectModel> subjectModelFromJson(String str) => List<SubjectModel>.from(
    json.decode(str).map((x) => SubjectModel.fromJson(x)));

String subjectModelToJson(List<SubjectModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SubjectModel {
  SubjectModel({
    this.id,
    this.numberOfLessons,
    this.prerequisiteSubject,
    this.closeRgister,
    this.isHasGreatExercise,
    this.isOnline,
    this.note,
    this.openRegister,
    this.schoolFee,
    this.population,
    this.status,
    this.listTimelineClass,
    this.optionListBook,
    this.requiredListBook,
    this.listTeacher,
    this.subjectModelId,
    this.semester,
    this.subject,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.haveRegistered,
    this.times,
    // this.examConditions,
    // this.scoringMethod,
    // this.subject,
  });

  String id;
  List<NumberOfLesson> numberOfLessons;
  PrerequisiteSubject prerequisiteSubject;
  DateTime closeRgister;
  bool isHasGreatExercise;
  bool isOnline;
  String note;
  DateTime openRegister;
  int schoolFee;
  int population;
  String status;
  List<ListTimelineClass> listTimelineClass;
  List<dynamic> optionListBook;
  List<dynamic> requiredListBook;
  List<Teacher> listTeacher;
  String subjectModelId;
  Semester semester;
  PrerequisiteSubject subject;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  int haveRegistered;
  Times times;

  factory SubjectModel.fromJson(Map<String, dynamic> json) => SubjectModel(
        id: json["_id"] == null ? null : json["_id"],
        numberOfLessons: json["numberOfLessons"] == null
            ? null
            : List<NumberOfLesson>.from(
                json["numberOfLessons"].map((x) => NumberOfLesson.fromJson(x))),
        prerequisiteSubject: json["prerequisiteSubject"] == null
            ? null
            : PrerequisiteSubject.fromJson(json["prerequisiteSubject"]),
        closeRgister: json["closeRgister"] == null
            ? null
            : DateTime.parse(json["closeRgister"]),
        isHasGreatExercise: json["isHasGreatExercise"] == null
            ? null
            : json["isHasGreatExercise"],
        isOnline: json["isOnline"] == null ? null : json["isOnline"],
        note: json["note"] == null ? null : json["note"],
        openRegister: json["openRegister"] == null
            ? null
            : DateTime.parse(json["openRegister"]),
        schoolFee: json["schoolFee"] == null ? null : json["schoolFee"],
        population: json["population"] == null ? null : json["population"],
        status: json["status"] == null ? null : json["status"],
        listTimelineClass: json["listTimelineClass"] == null
            ? null
            : List<ListTimelineClass>.from(json["listTimelineClass"]
                .map((x) => ListTimelineClass.fromJson(x))),
        optionListBook: json["optionListBook"] == null
            ? null
            : List<dynamic>.from(json["optionListBook"].map((x) => x)),
        requiredListBook: json["requiredListBook"] == null
            ? null
            : List<dynamic>.from(json["requiredListBook"].map((x) => x)),
        listTeacher: json["listTeacher"] == null
            ? null
            : List<Teacher>.from(
                json["listTeacher"].map((x) => Teacher.fromJson(x))),
        subjectModelId: json["id"] == null ? null : json["id"],
        semester: json["semester"] == null
            ? null
            : Semester.fromJson(json["semester"]),
        subject: json["subject"] == null
            ? null
            : PrerequisiteSubject.fromJson(json["subject"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
        haveRegistered:
            json["haveRegistered"] == null ? null : json["haveRegistered"],
        times: json["times"] == null ? null : Times.fromJson(json["times"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "numberOfLessons": numberOfLessons == null
            ? null
            : List<dynamic>.from(numberOfLessons.map((x) => x.toJson())),
        "prerequisiteSubject":
            prerequisiteSubject == null ? null : prerequisiteSubject.toJson(),
        "closeRgister":
            closeRgister == null ? null : closeRgister.toIso8601String(),
        "isHasGreatExercise":
            isHasGreatExercise == null ? null : isHasGreatExercise,
        "isOnline": isOnline == null ? null : isOnline,
        "note": note == null ? null : note,
        "openRegister":
            openRegister == null ? null : openRegister.toIso8601String(),
        "schoolFee": schoolFee == null ? null : schoolFee,
        "population": population == null ? null : population,
        "status": status == null ? null : status,
        "listTimelineClass": listTimelineClass == null
            ? null
            : List<dynamic>.from(listTimelineClass.map((x) => x.toJson())),
        "optionListBook": optionListBook == null
            ? null
            : List<dynamic>.from(optionListBook.map((x) => x)),
        "requiredListBook": requiredListBook == null
            ? null
            : List<dynamic>.from(requiredListBook.map((x) => x)),
        "listTeacher": listTeacher == null
            ? null
            : List<dynamic>.from(listTeacher.map((x) => x.toJson())),
        "id": subjectModelId == null ? null : subjectModelId,
        "semester": semester == null ? null : semester.toJson(),
        "subject": subject == null ? null : subject.toJson(),
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
        "haveRegistered": haveRegistered == null ? null : haveRegistered,
        "times": times == null ? null : times.toJson(),
      };
}

class PrerequisiteSubject {
  PrerequisiteSubject({
    this.id,
    this.credits,
    this.description,
    this.name,
    this.porpose,
    this.prerequisiteSubjectId,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.type,
  });

  String id;
  int credits;
  String description;
  String name;
  String porpose;
  String prerequisiteSubjectId;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  Type type;

  factory PrerequisiteSubject.fromJson(Map<String, dynamic> json) =>
      PrerequisiteSubject(
        id: json["id"] == null ? null : json["id"],
        credits: json["credits"] == null ? null : json["credits"],
        description: json["description"] == null ? null : json["description"],
        name: json["name"] == null ? null : json["name"],
        porpose: json["porpose"] == null ? null : json["porpose"],
        prerequisiteSubjectId: json["id"] == null ? null : json["id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
        type: json["type"] == null ? null : typeValues.map[json["type"]],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : idValues.reverse[id],
        "credits": credits == null ? null : credits,
        "description": description == null ? null : description,
        "name": name == null ? null : nameValues.reverse[name],
        "porpose": porpose == null ? null : porpose,
        "id": prerequisiteSubjectId == null
            ? null
            : idEnumValues.reverse[prerequisiteSubjectId],
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
        "type": type == null ? null : typeValues.reverse[type],
      };
}

enum Id {
  THE_6090_B5_EB0_B8557178_EAAAC20,
  THE_6090_B5_EB0_B8557178_EAAAC21,
  THE_6090_B5_EB0_B8557178_EAAAC22
}

final idValues = EnumValues({
  "6090b5eb0b8557178eaaac20": Id.THE_6090_B5_EB0_B8557178_EAAAC20,
  "6090b5eb0b8557178eaaac21": Id.THE_6090_B5_EB0_B8557178_EAAAC21,
  "6090b5eb0b8557178eaaac22": Id.THE_6090_B5_EB0_B8557178_EAAAC22
});

enum Name { TING_TRUNG_1, TING_TRUNG_2, K_NNG_NGHE_NI_C_VIT_TRUNG_1 }

final nameValues = EnumValues({
  "Kỹ năng nghe, nói, đọc, viết Trung 1": Name.K_NNG_NGHE_NI_C_VIT_TRUNG_1,
  "Tiếng Trung 1": Name.TING_TRUNG_1,
  "Tiếng Trung 2": Name.TING_TRUNG_2
});

enum IdEnum { GZ101, GZ102, GZ151 }

final idEnumValues = EnumValues(
    {"GZ101": IdEnum.GZ101, "GZ102": IdEnum.GZ102, "GZ151": IdEnum.GZ151});

enum Type { BASE, SPECIALIZED }

final typeValues =
    EnumValues({"BASE": Type.BASE, "SPECIALIZED": Type.SPECIALIZED});

class UserFullName {
  UserFullName({
    this.firstName,
    this.lastName,
  });

  String firstName;
  String lastName;

  factory UserFullName.fromJson(Map<String, dynamic> json) => UserFullName(
        firstName: json["firstName"] == null ? null : json["firstName"],
        lastName: json["lastName"] == null ? null : json["lastName"],
      );

  Map<String, dynamic> toJson() => {
        "firstName": firstName == null ? null : firstName,
        "lastName": lastName == null ? null : lastName,
      };
}

class ListTimelineClass {
  ListTimelineClass({
    this.code,
    this.teacher,
    this.timeLines,
  });

  String code;
  Teacher teacher;
  List<TimeLine> timeLines;

  factory ListTimelineClass.fromJson(Map<String, dynamic> json) =>
      ListTimelineClass(
        code: json["code"] == null ? null : json["code"],
        teacher:
            json["teacher"] == null ? null : Teacher.fromJson(json["teacher"]),
        timeLines: json["timeLines"] == null
            ? null
            : List<TimeLine>.from(
                json["timeLines"].map((x) => TimeLine.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "code": code == null ? null : code,
        "teacher": teacher == null ? null : teacher.toJson(),
        "timeLines": timeLines == null
            ? null
            : List<dynamic>.from(timeLines.map((x) => x.toJson())),
      };
}

class TimeLine {
  TimeLine({
    this.id,
    this.fromDate,
    this.toDate,
    this.timeLineId,
    this.roomId,
    this.listSchedule,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String id;
  DateTime fromDate;
  DateTime toDate;
  String timeLineId;
  String roomId;
  List<ListSchedule> listSchedule;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory TimeLine.fromJson(Map<String, dynamic> json) => TimeLine(
        id: json["_id"] == null ? null : json["_id"],
        fromDate:
            json["fromDate"] == null ? null : DateTime.parse(json["fromDate"]),
        toDate: json["toDate"] == null ? null : DateTime.parse(json["toDate"]),
        timeLineId: json["id"] == null ? null : json["id"],
        roomId: json["roomId"] == null ? null : json["roomId"],
        listSchedule: json["listSchedule"] == null
            ? null
            : List<ListSchedule>.from(
                json["listSchedule"].map((x) => ListSchedule.fromJson(x))),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "fromDate": fromDate == null ? null : fromDate.toIso8601String(),
        "toDate": toDate == null ? null : toDate.toIso8601String(),
        "id": timeLineId == null ? null : timeLineId,
        "roomId": roomId == null ? null : roomId,
        "listSchedule": listSchedule == null
            ? null
            : List<dynamic>.from(listSchedule.map((x) => x.toJson())),
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
      };
}

class ListSchedule {
  ListSchedule({
    this.listSession,
    this.note,
    this.address,
    this.content,
    this.dayOfWeek,
  });

  List<ListSession> listSession;
  String note;
  String address;
  String content;
  int dayOfWeek;

  factory ListSchedule.fromJson(Map<String, dynamic> json) => ListSchedule(
        listSession: json["listSession"] == null
            ? null
            : List<ListSession>.from(
                json["listSession"].map((x) => ListSession.fromJson(x))),
        note: json["note"] == null ? null : json["note"],
        address: json["address"] == null ? null : json["address"],
        content: json["content"] == null ? null : json["content"],
        dayOfWeek: json["dayOfWeek"] == null ? null : json["dayOfWeek"],
      );

  Map<String, dynamic> toJson() => {
        "listSession": listSession == null
            ? null
            : List<dynamic>.from(listSession.map((x) => x.toJson())),
        "note": note == null ? null : note,
        "address": address == null ? null : address,
        "content": content == null ? null : content,
        "dayOfWeek": dayOfWeek == null ? null : dayOfWeek,
      };
}

class ListSession {
  ListSession({
    this.id,
    this.listSessionId,
    this.name,
    this.startTime,
    this.endTime,
    this.durationMinus,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String id;
  String listSessionId;
  String name;
  Time startTime;
  Time endTime;
  int durationMinus;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory ListSession.fromJson(Map<String, dynamic> json) => ListSession(
        id: json["_id"] == null ? null : json["_id"],
        listSessionId: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        startTime:
            json["startTime"] == null ? null : Time.fromJson(json["startTime"]),
        endTime:
            json["endTime"] == null ? null : Time.fromJson(json["endTime"]),
        durationMinus:
            json["durationMinus"] == null ? null : json["durationMinus"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "id": listSessionId == null ? null : listSessionId,
        "name": name == null ? null : name,
        "startTime": startTime == null ? null : startTime.toJson(),
        "endTime": endTime == null ? null : endTime.toJson(),
        "durationMinus": durationMinus == null ? null : durationMinus,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
      };
}

class Time {
  Time({
    this.date,
    this.day,
    this.hours,
    this.minutes,
    this.month,
    this.seconds,
    this.time,
    this.timezoneOffset,
    this.year,
  });

  int date;
  int day;
  int hours;
  int minutes;
  int month;
  int seconds;
  int time;
  int timezoneOffset;
  int year;

  factory Time.fromJson(Map<String, dynamic> json) => Time(
        date: json["date"] == null ? null : json["date"],
        day: json["day"] == null ? null : json["day"],
        hours: json["hours"] == null ? null : json["hours"],
        minutes: json["minutes"] == null ? null : json["minutes"],
        month: json["month"] == null ? null : json["month"],
        seconds: json["seconds"] == null ? null : json["seconds"],
        time: json["time"] == null ? null : json["time"],
        timezoneOffset:
            json["timezoneOffset"] == null ? null : json["timezoneOffset"],
        year: json["year"] == null ? null : json["year"],
      );

  Map<String, dynamic> toJson() => {
        "date": date == null ? null : date,
        "day": day == null ? null : day,
        "hours": hours == null ? null : hours,
        "minutes": minutes == null ? null : minutes,
        "month": month == null ? null : month,
        "seconds": seconds == null ? null : seconds,
        "time": time == null ? null : time,
        "timezoneOffset": timezoneOffset == null ? null : timezoneOffset,
        "year": year == null ? null : year,
      };
}

class NumberOfLesson {
  NumberOfLesson({
    this.quanlity,
    this.type,
  });

  int quanlity;
  String type;

  factory NumberOfLesson.fromJson(Map<String, dynamic> json) => NumberOfLesson(
        quanlity: json["quanlity"] == null ? null : json["quanlity"],
        type: json["type"] == null ? null : json["type"],
      );

  Map<String, dynamic> toJson() => {
        "quanlity": quanlity == null ? null : quanlity,
        "type": type == null ? null : type,
      };
}

class Semester {
  Semester({
    this.id,
    this.endTime,
    this.isCurrent,
    this.name,
    this.startTime,
    this.semesterId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String id;
  String endTime;
  bool isCurrent;
  String name;
  String startTime;
  String semesterId;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Semester.fromJson(Map<String, dynamic> json) => Semester(
        id: json["_id"] == null ? null : json["_id"],
        endTime: json["endTime"] == null ? null : json["endTime"],
        isCurrent: json["isCurrent"] == null ? null : json["isCurrent"],
        name: json["name"] == null ? null : json["name"],
        startTime: json["startTime"] == null ? null : json["startTime"],
        semesterId: json["id"] == null ? null : json["id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "endTime": endTime == null ? null : endTime,
        "isCurrent": isCurrent == null ? null : isCurrent,
        "name": name == null ? null : name,
        "startTime": startTime == null ? null : startTime,
        "id": semesterId == null ? null : semesterId,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
      };
}

class Times {
  Times({
    this.lectures,
    this.practices,
    this.total,
  });

  int lectures;
  int practices;
  int total;

  factory Times.fromJson(Map<String, dynamic> json) => Times(
        lectures: json["lectures"] == null ? null : json["lectures"],
        practices: json["practices"] == null ? null : json["practices"],
        total: json["total"] == null ? null : json["total"],
      );

  Map<String, dynamic> toJson() => {
        "lectures": lectures == null ? null : lectures,
        "practices": practices == null ? null : practices,
        "total": total == null ? null : total,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
