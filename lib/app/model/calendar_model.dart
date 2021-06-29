// To parse this JSON data, do
//
//     final calendarModel = calendarModelFromJson(jsonString);

import 'dart:convert';

List<CalendarModel> calendarModelFromJson(String str) =>
    List<CalendarModel>.from(
        json.decode(str).map((x) => CalendarModel.fromJson(x)));

String calendarModelToJson(List<CalendarModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CalendarModel {
  CalendarModel({
    this.id,
    this.recurrent,
    this.address,
    this.content,
    this.startTime,
    this.endTime,
    this.day,
    this.isFavourite,
    this.isReminder,
    this.title,
    this.customerId,
    this.eventType,
    this.note,
    this.subjectClassId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String id;
  Recurrent recurrent;
  String address;
  String content;
  Time startTime;
  Time endTime;
  String day;
  bool isFavourite;
  bool isReminder;
  String title;
  String customerId;
  String eventType;
  String note;
  String subjectClassId;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory CalendarModel.fromJson(Map<String, dynamic> json) => CalendarModel(
        id: json["_id"] == null ? null : json["_id"],
        recurrent: json["recurrent"] == null
            ? null
            : Recurrent.fromJson(json["recurrent"]),
        address: json["address"] == null ? null : json["address"],
        content: json["content"] == null ? null : json["content"],
        startTime:
            json["startTime"] == null ? null : Time.fromJson(json["startTime"]),
        endTime:
            json["endTime"] == null ? null : Time.fromJson(json["endTime"]),
        day: json["day"] == null ? null : json["day"],
        isFavourite: json["isFavourite"] == null ? null : json["isFavourite"],
        isReminder: json["isReminder"] == null ? null : json["isReminder"],
        title: json["title"] == null ? null : json["title"],
        customerId: json["customerId"] == null ? null : json["customerId"],
        eventType: json["eventType"] == null ? null : json["eventType"],
        note: json["note"] == null ? null : json["note"],
        subjectClassId:
            json["subjectClassId"] == null ? null : json["subjectClassId"],
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
        "recurrent": recurrent == null ? null : recurrent.toJson(),
        "address": address == null ? null : address,
        "content": content == null ? null : content,
        "startTime": startTime == null ? null : startTime.toJson(),
        "endTime": endTime == null ? null : endTime.toJson(),
        "day": day == null ? null : day,
        "isFavourite": isFavourite == null ? null : isFavourite,
        "isReminder": isReminder == null ? null : isReminder,
        "title": title == null ? null : title,
        "customerId": customerId == null ? null : customerId,
        "eventType": eventType == null ? null : eventType,
        "note": note == null ? null : note,
        "subjectClassId": subjectClassId == null ? null : subjectClassId,
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

  getDay() => "$hours\h$minutes - $day/$month/$year";
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
