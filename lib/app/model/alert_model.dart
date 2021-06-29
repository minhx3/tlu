// To parse this JSON data, do
//
//     final alertModel = alertModelFromJson(jsonString);

import 'dart:convert';

AlertModel alertModelFromJson(String str) =>
    AlertModel.fromJson(json.decode(str));

String alertModelToJson(AlertModel data) => json.encode(data.toJson());

class AlertModel {
  AlertModel({
    this.id,
    this.startTime,
    this.endTime,
    this.startTimeString,
    this.endTimeString,
    this.groupId,
    this.groupName,
    this.semsterInfo,
    this.status,
  });

  String id;
  Time startTime;
  Time endTime;
  DateTime startTimeString;
  DateTime endTimeString;
  String groupId;
  String groupName;
  SemsterInfo semsterInfo;
  String status;

  factory AlertModel.fromJson(Map<String, dynamic> json) => AlertModel(
        id: json["_id"] == null ? null : json["_id"],
        startTime:
            json["startTime"] == null ? null : Time.fromJson(json["startTime"]),
        endTime:
            json["endTime"] == null ? null : Time.fromJson(json["endTime"]),
        startTimeString: json["startTimeString"] == null
            ? null
            : DateTime.parse(json["startTimeString"]),
        endTimeString: json["endTimeString"] == null
            ? null
            : DateTime.parse(json["endTimeString"]),
        groupId: json["groupId"] == null ? null : json["groupId"],
        groupName: json["groupName"] == null ? null : json["groupName"],
        semsterInfo: json["semsterInfo"] == null
            ? null
            : SemsterInfo.fromJson(json["semsterInfo"]),
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "startTime": startTime == null ? null : startTime.toJson(),
        "endTime": endTime == null ? null : endTime.toJson(),
        "startTimeString":
            startTimeString == null ? null : startTimeString.toIso8601String(),
        "endTimeString":
            endTimeString == null ? null : endTimeString.toIso8601String(),
        "groupId": groupId == null ? null : groupId,
        "groupName": groupName == null ? null : groupName,
        "semsterInfo": semsterInfo == null ? null : semsterInfo.toJson(),
        "status": status == null ? null : status,
      };

  int getCountDownTime() => DateTime.now()
      .add(Duration(
          milliseconds: startTime.time - DateTime.now().millisecondsSinceEpoch))
      .millisecondsSinceEpoch; //startTime.time - Duration(days: 2).inMilliseconds;
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

  String getDay() => "$hours\h$minutes\n$date/$month/$year";

  getIsOpenReigsterTime() {
    final now = DateTime.now().millisecondsSinceEpoch;
    return time > now && time - now <= 48 ? true : false;
  }
}

class SemsterInfo {
  SemsterInfo({
    this.id,
    this.endTime,
    this.isCurrent,
    this.name,
    this.startTime,
    this.semsterInfoId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String id;
  String endTime;
  bool isCurrent;
  String name;
  String startTime;
  String semsterInfoId;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory SemsterInfo.fromJson(Map<String, dynamic> json) => SemsterInfo(
        id: json["_id"] == null ? null : json["_id"],
        endTime: json["endTime"] == null ? null : json["endTime"],
        isCurrent: json["isCurrent"] == null ? null : json["isCurrent"],
        name: json["name"] == null ? null : json["name"],
        startTime: json["startTime"] == null ? null : json["startTime"],
        semsterInfoId: json["id"] == null ? null : json["id"],
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
        "id": semsterInfoId == null ? null : semsterInfoId,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
      };
}
