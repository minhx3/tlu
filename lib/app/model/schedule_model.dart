import 'dart:convert';

import 'package:intl/intl.dart';
import 'package:thanglong_university/app/model/teacher_model.dart';

List<ScheduleModel> scheduleModelFromJson(String str) =>
    List<ScheduleModel>.from(
        json.decode(str).map((x) => ScheduleModel.fromJson(x)));

String scheduleModelToJson(List<ScheduleModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

List<String> sessionName = ['ses1', 'ses2', 'ses3', 'ses4'];

class ScheduleModel {
  ScheduleModel({
    this.address,
    this.content,
    this.startTime,
    this.endTime,
    this.day,
    this.customerId,
    this.subjectName,
    this.favourite,
    this.isReminder,
    this.note,
    this.subjectClassId,
    this.title,
    this.subjectId,
    this.taskId,
    this.listSession,
    this.recurrent,
    this.teacher,
  });

  String address;
  String content;
  int startTime;
  int endTime;
  DateTime day;
  String customerId;
  String subjectName;
  bool favourite;
  bool isReminder;
  String note;
  String subjectClassId;
  String title;
  String subjectId;
  String taskId;
  List<ListSession> listSession;
  List<Recurrent> recurrent;
  Teacher teacher;

  ScheduleModel copyWith({
    String address,
    String content,
    int startTime,
    int endTime,
    DateTime day,
    String customerId,
    String subjectName,
    bool favourite,
    bool isReminder,
    String note,
    String subjectClassId,
    String title,
    String subjectId,
    String taskId,
    List<ListSession> listSession,
    List<Recurrent> recurrent,
    Teacher teacher,
  }) =>
      ScheduleModel(
        address: address ?? this.address,
        content: content ?? this.content,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        day: day ?? this.day,
        customerId: customerId ?? this.customerId,
        subjectName: subjectName ?? this.subjectName,
        favourite: favourite ?? this.favourite,
        isReminder: isReminder ?? this.isReminder,
        note: note ?? this.note,
        subjectClassId: subjectClassId ?? this.subjectClassId,
        title: title ?? this.title,
        subjectId: subjectId ?? this.subjectId,
        taskId: taskId ?? this.taskId,
        listSession: listSession ?? this.listSession,
        recurrent: recurrent ?? this.recurrent,
        teacher: teacher ?? this.teacher,
      );

  factory ScheduleModel.fromJson(Map<String, dynamic> json) => ScheduleModel(
        address: json["address"] == null ? null : json["address"],
        content: json["content"] == null ? null : json["content"],
        startTime: json["startTime"] == null ? null : json["startTime"],
        endTime: json["endTime"] == null ? null : json["endTime"],
        day: json["day"] == null ? null :DateTime.parse(json["day"]) ,
        customerId: json["customerId"] == null ? null : json["customerId"],
        subjectName: json["subjectName"] == null ? null : json["subjectName"],
        favourite: json["favourite"] == null ? null : json["favourite"],
        isReminder: json["isReminder"] == null ? null : json["isReminder"],
        note: json["note"] == null ? null : json["note"],
        subjectClassId:
            json["subjectClassId"] == null ? null : json["subjectClassId"],
        title: json["title"] == null ? null : json["title"],
        subjectId: json["subjectId"] == null ? null : json["subjectId"],
        taskId: json["taskId"] == null ? null : json["taskId"],
        listSession: json["listSession"] == null
            ? null
            : List<ListSession>.from(
                json["listSession"].map((x) => ListSession.fromJson(x))),
        recurrent: json["recurrent"] == null
            ? null
            : List<Recurrent>.from(
                json["recurrent"].map((x) => Recurrent.fromJson(x))),
        teacher:
            json["teacher"] == null ? null : Teacher.fromJson(json["teacher"]),
      );

  Map<String, dynamic> toJson() => {
        "address": address == null ? null : address,
        "content": content == null ? null : content,
        "startTime": startTime == null ? null : startTime,
        "endTime": endTime == null ? null : endTime,
        "day": day == null ? null : day,
        "customerId": customerId == null ? null : customerId,
        "subjectName": subjectName == null ? null : subjectName,
        "favourite": favourite == null ? null : favourite,
        "isReminder": isReminder == null ? null : isReminder,
        "note": note == null ? null : note,
        "subjectClassId": subjectClassId == null ? null : subjectClassId,
        "title": title == null ? null : title,
        "subjectId": subjectId == null ? null : subjectId,
        "taskId": taskId == null ? null : taskId,
        "listSession": listSession == null
            ? null
            : List<dynamic>.from(listSession.map((x) => x.toJson())),
        "recurrent": recurrent == null
            ? null
            : List<dynamic>.from(recurrent.map((x) => x.toJson())),
        "teacher": teacher == null ? null : teacher.toJson(),
      };

  String get getSession {
    List<String> ids =
        this.listSession.map((e) => e.id.replaceAll('ses', '')).toList();
    return '(Ca ${ids.join('-')})';
  }

  String get getTime {
    DateTime startDate =
        DateTime.fromMicrosecondsSinceEpoch(this.startTime).toLocal();
    DateTime endDate =
        DateTime.fromMicrosecondsSinceEpoch(this.endTime).toLocal();

    String startTime = DateFormat('hh#mm').format(startDate);
    String endTime = DateFormat('hh#mm').format(endDate);
    // 10h00 - 10h50 - 16/04/2021
    String time = '$startTime - $endTime';
    return time.replaceAll('#', 'h');
  }

  String get getTimeWithDate {
    return '${this.getTime}, ${this.day}';
  }
}

class ListSession {
  ListSession({
    this.id,
    this.name,
    this.startTime,
    this.endTime,
    this.durationMinus,
  });

  String id;
  String name;
  Time startTime;
  Time endTime;
  int durationMinus;

  ListSession copyWith({
    String id,
    String name,
    Time startTime,
    Time endTime,
    int durationMinus,
  }) =>
      ListSession(
        id: id ?? this.id,
        name: name ?? this.name,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        durationMinus: durationMinus ?? this.durationMinus,
      );

  factory ListSession.fromJson(Map<String, dynamic> json) => ListSession(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        startTime:
            json["startTime"] == null ? null : Time.fromJson(json["startTime"]),
        endTime:
            json["endTime"] == null ? null : Time.fromJson(json["endTime"]),
        durationMinus:
            json["durationMinus"] == null ? null : json["durationMinus"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "startTime": startTime == null ? null : startTime.toJson(),
        "endTime": endTime == null ? null : endTime.toJson(),
        "durationMinus": durationMinus == null ? null : durationMinus,
      };
}

class Time {
  Time({
    this.hours,
    this.minutes,
    this.seconds,
  });

  int hours;
  int minutes;
  int seconds;

  Time copyWith({
    int hours,
    int minutes,
    int seconds,
  }) =>
      Time(
        hours: hours ?? this.hours,
        minutes: minutes ?? this.minutes,
        seconds: seconds ?? this.seconds,
      );

  factory Time.fromJson(Map<String, dynamic> json) => Time(
        hours: json["hours"] == null ? null : json["hours"],
        minutes: json["minutes"] == null ? null : json["minutes"],
        seconds: json["seconds"] == null ? null : json["seconds"],
      );

  Map<String, dynamic> toJson() => {
        "hours": hours == null ? null : hours,
        "minutes": minutes == null ? null : minutes,
        "seconds": seconds == null ? null : seconds,
      };
}

class Recurrent {
  Recurrent({
    this.execuday,
    this.recurEveryNumber,
    this.requenceType,
  });

  int execuday;
  String recurEveryNumber;
  String requenceType;

  Recurrent copyWith({
    int execuday,
    String recurEveryNumber,
    String requenceType,
  }) =>
      Recurrent(
        execuday: execuday ?? this.execuday,
        recurEveryNumber: recurEveryNumber ?? this.recurEveryNumber,
        requenceType: requenceType ?? this.requenceType,
      );

  factory Recurrent.fromJson(Map<String, dynamic> json) => Recurrent(
        execuday: json["execuday"] == null ? null : json["execuday"],
        recurEveryNumber:
            json["recurEveryNumber"] == null ? null : json["recurEveryNumber"],
        requenceType:
            json["requenceType"] == null ? null : json["requenceType"],
      );

  Map<String, dynamic> toJson() => {
        "execuday": execuday == null ? null : execuday,
        "recurEveryNumber": recurEveryNumber == null ? null : recurEveryNumber,
        "requenceType": requenceType == null ? null : requenceType,
      };
}
