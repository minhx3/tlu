// To parse this JSON data, do
//
//     final scheduleModel = scheduleModelFromJson(jsonString);

import 'dart:convert';

List<ScheduleModel> scheduleModelFromJson(String str) =>
    List<ScheduleModel>.from(
        json.decode(str).map((x) => ScheduleModel.fromJson(x)));

String scheduleModelToJson(List<ScheduleModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ScheduleModel {
  ScheduleModel({
    this.startTime,
    this.endTime,
    this.recurrent,
    this.address,
    this.content,
    this.day,
    this.isFavourite,
    this.isReminder,
    this.title,
    this.id,
    this.customerId,
    this.taskId,
    this.note,
    this.subjectClassId,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.teacher,
    this.startTimeString,
    this.endTimeString,
    this.scheduleModelId,
  });

  Time startTime;
  Time endTime;
  Recurrent recurrent;
  String address;
  String content;
  String day;
  bool isFavourite;
  bool isReminder;
  String title;
  String id;
  String customerId;
  String taskId;
  String note;
  String subjectClassId;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  Teacher teacher;
  DateTime startTimeString;
  DateTime endTimeString;
  String scheduleModelId;

  factory ScheduleModel.fromJson(Map<String, dynamic> json) => ScheduleModel(
        startTime:
            json["startTime"] == null ? null : Time.fromJson(json["startTime"]),
        endTime:
            json["endTime"] == null ? null : Time.fromJson(json["endTime"]),
        recurrent: json["recurrent"] == null
            ? null
            : Recurrent.fromJson(json["recurrent"]),
        address: json["address"] == null ? null : json["address"],
        content: json["content"] == null ? null : json["content"],
        day: json["day"] == null ? null : json["day"],
        isFavourite: json["isFavourite"] == null ? null : json["isFavourite"],
        isReminder: json["isReminder"] == null ? null : json["isReminder"],
        title: json["title"] == null ? null : json["title"],
        id: json["_id"] == null ? null : json["_id"],
        customerId: json["customerId"] == null ? null : json["customerId"],
        taskId: json["taskId"] == null ? null : json["taskId"],
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
        teacher:
            json["teacher"] == null ? null : Teacher.fromJson(json["teacher"]),
        startTimeString: json["startTimeString"] == null
            ? null
            : DateTime.parse(json["startTimeString"]),
        endTimeString: json["endTimeString"] == null
            ? null
            : DateTime.parse(json["endTimeString"]),
        scheduleModelId: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "startTime": startTime == null ? null : startTime.toJson(),
        "endTime": endTime == null ? null : endTime.toJson(),
        "recurrent": recurrent == null ? null : recurrent.toJson(),
        "address": address == null ? null : address,
        "content": content == null ? null : content,
        "day": day == null ? null : day,
        "isFavourite": isFavourite == null ? null : isFavourite,
        "isReminder": isReminder == null ? null : isReminder,
        "title": title == null ? null : title,
        "_id": id == null ? null : id,
        "customerId": customerId == null ? null : customerId,
        "taskId": taskId == null ? null : taskId,
        "note": note == null ? null : note,
        "subjectClassId": subjectClassId == null ? null : subjectClassId,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
        "teacher": teacher == null ? null : teacher.toJson(),
        "startTimeString":
            startTimeString == null ? null : startTimeString.toIso8601String(),
        "endTimeString":
            endTimeString == null ? null : endTimeString.toIso8601String(),
        "id": scheduleModelId == null ? null : scheduleModelId,
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

class Teacher {
  Teacher({
    this.userFullName,
    this.avatar,
    this.dob,
    this.email,
    this.mobile,
    this.degree,
    this.teachingList,
    this.id,
    this.identityId,
    this.teacherId,
    this.sex,
    this.facultyId,
    this.universityInfo,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.fullName,
  });

  UserFullName userFullName;
  String avatar;
  String dob;
  String email;
  String mobile;
  String degree;
  List<TeachingList> teachingList;
  String id;
  int identityId;
  String teacherId;
  String sex;
  String facultyId;
  UniversityInfo universityInfo;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String fullName;

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
        userFullName: json["userFullName"] == null
            ? null
            : UserFullName.fromJson(json["userFullName"]),
        avatar: json["avatar"] == null ? null : json["avatar"],
        dob: json["dob"] == null ? null : json["dob"],
        email: json["email"] == null ? null : json["email"],
        mobile: json["mobile"] == null ? null : json["mobile"],
        degree: json["degree"] == null ? null : json["degree"],
        teachingList: json["teachingList"] == null
            ? null
            : List<TeachingList>.from(
                json["teachingList"].map((x) => TeachingList.fromJson(x))),
        id: json["_id"] == null ? null : json["_id"],
        identityId: json["identityId"] == null ? null : json["identityId"],
        teacherId: json["id"] == null ? null : json["id"],
        sex: json["sex"] == null ? null : json["sex"],
        facultyId: json["facultyId"] == null ? null : json["facultyId"],
        universityInfo: json["universityInfo"] == null
            ? null
            : UniversityInfo.fromJson(json["universityInfo"]),
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
        fullName: json["fullName"] == null ? null : json["fullName"],
      );

  Map<String, dynamic> toJson() => {
        "userFullName": userFullName == null ? null : userFullName.toJson(),
        "avatar": avatar == null ? null : avatar,
        "dob": dob == null ? null : dob,
        "email": email == null ? null : email,
        "mobile": mobile == null ? null : mobile,
        "degree": degree == null ? null : degree,
        "teachingList": teachingList == null
            ? null
            : List<dynamic>.from(teachingList.map((x) => x.toJson())),
        "_id": id == null ? null : id,
        "identityId": identityId == null ? null : identityId,
        "id": teacherId == null ? null : teacherId,
        "sex": sex == null ? null : sex,
        "facultyId": facultyId == null ? null : facultyId,
        "universityInfo":
            universityInfo == null ? null : universityInfo.toJson(),
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
        "fullName": fullName == null ? null : fullName,
      };
}

class TeachingList {
  TeachingList({
    this.credits,
    this.description,
    this.name,
    this.porpose,
    this.factor,
    this.id,
    this.teachingListId,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.type,
  });

  int credits;
  String description;
  String name;
  String porpose;
  int factor;
  String id;
  String teachingListId;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String type;

  factory TeachingList.fromJson(Map<String, dynamic> json) => TeachingList(
        credits: json["credits"] == null ? null : json["credits"],
        description: json["description"] == null ? null : json["description"],
        name: json["name"] == null ? null : json["name"],
        porpose: json["porpose"] == null ? null : json["porpose"],
        factor: json["factor"] == null ? null : json["factor"],
        id: json["_id"] == null ? null : json["_id"],
        teachingListId: json["id"] == null ? null : json["id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
        type: json["type"] == null ? null : json["type"],
      );

  Map<String, dynamic> toJson() => {
        "credits": credits == null ? null : credits,
        "description": description == null ? null : description,
        "name": name == null ? null : name,
        "porpose": porpose == null ? null : porpose,
        "factor": factor == null ? null : factor,
        "_id": id == null ? null : id,
        "id": teachingListId == null ? null : teachingListId,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
        "type": type == null ? null : type,
      };
}

class UniversityInfo {
  UniversityInfo({
    this.address,
    this.code,
    this.dateOfEstablishment,
    this.fullName,
    this.id,
    this.universityInfoId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String address;
  String code;
  String dateOfEstablishment;
  String fullName;
  String id;
  String universityInfoId;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory UniversityInfo.fromJson(Map<String, dynamic> json) => UniversityInfo(
        address: json["address"] == null ? null : json["address"],
        code: json["code"] == null ? null : json["code"],
        dateOfEstablishment: json["dateOfEstablishment"] == null
            ? null
            : json["dateOfEstablishment"],
        fullName: json["fullName"] == null ? null : json["fullName"],
        id: json["_id"] == null ? null : json["_id"],
        universityInfoId: json["id"] == null ? null : json["id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "address": address == null ? null : address,
        "code": code == null ? null : code,
        "dateOfEstablishment":
            dateOfEstablishment == null ? null : dateOfEstablishment,
        "fullName": fullName == null ? null : fullName,
        "_id": id == null ? null : id,
        "id": universityInfoId == null ? null : universityInfoId,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
      };
}

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
