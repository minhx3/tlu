import 'dart:convert';

import 'package:thanglong_university/app/model/chat/base_model.dart';
import 'package:thanglong_university/app/model/chat/subject_class_entity.dart';
import 'package:thanglong_university/app/model/university_model.dart';

class UserInfo extends UserModel {
  UserInfo({
    this.avatar,
    this.classInfo,
    this.dob,
    this.email,
    this.mobile,
    this.fullName,
    this.schoolYear,
    this.faculty,
    this.username,
    this.password,
    this.id,
    this.majorsInfo,
    this.universityInfo,
    this.semesters,
    this.teachingList,
  }) {
    this.name = this.fullName;
    this.majors = this.majorsInfo?.fullName;
    this.className = this.classInfo?.shortName;
  }

  String avatar;
  ClassInfo classInfo;
  String dob;
  String email;
  String mobile;
  String fullName;
  String faculty;
  String schoolYear;
  String username;
  String password;
  String id;
  MajorsInfo majorsInfo;
  UniversityInfo universityInfo;
  List<Semester> semesters;
  List<SubjectClassTeacherTeachingList> teachingList;

  // factory UserInfo.fromRawJson(String str) =>
  //     UserInfo.fromJson(json.decode(str));

  // String toRawJson() => json.encode(toJson());

  String get getTeaching {
    return teachingList.map((e) => e.name).join(', ');
  }

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        avatar: json["avatar"] == null ? null : json["avatar"],
        classInfo: json["classInfo"] == null
            ? null
            : ClassInfo.fromJson(json["classInfo"]),
        dob: json["dob"] == null ? null : json["dob"],
        email: json["email"] == null ? null : json["email"],
        mobile: json["mobile"] == null ? null : json["mobile"],
        fullName: json["fullName"] == null ? null : json["fullName"],
        schoolYear: json["schoolYear"] == null ? null : json["schoolYear"],
        faculty: json["faculty"] == null ? null : json["faculty"],
        username: json["username"] == null ? null : json["username"],
        password: json["password"] == null ? null : json["password"],
        id: json["id"] == null ? null : json["id"],
        majorsInfo: json["majorsInfo"] == null
            ? null
            : MajorsInfo.fromJson(json["majorsInfo"]),
        universityInfo: json["universityInfo"] == null
            ? null
            : UniversityInfo.fromJson(json["universityInfo"]),
        semesters: json["semesters"] == null
            ? null
            : List<Semester>.from(
                json["semesters"].map((x) => Semester.fromJson(x))),
        teachingList: json["teachingList"] == null
            ? null
            : (json['teachingList'] as List)
                .map((v) => SubjectClassTeacherTeachingList().fromJson(v))
                .toList(),
      );

  Map<String, dynamic> toJson() => {
        "avatar": avatar == null ? null : avatar,
        "classInfo": classInfo == null ? null : classInfo.toJson(),
        "dob": dob == null ? null : dob,
        "email": email == null ? null : email,
        "mobile": mobile == null ? null : mobile,
        "fullName": fullName == null ? null : fullName,
        "faculty": faculty == null ? null : faculty,
        "schoolYear": schoolYear == null ? null : schoolYear,
        "username": username == null ? null : username,
        "password": password == null ? null : password,
        "id": id == null ? null : id,
        "majorsInfo": majorsInfo == null ? null : majorsInfo.toJson(),
        "universityInfo":
            universityInfo == null ? null : universityInfo.toJson(),
        "semesters": semesters == null
            ? null
            : List<dynamic>.from(semesters.map((x) => x.toJson())),
        "teachingList": teachingList == null
            ? null
            : List<dynamic>.from(teachingList.map((x) => x.toJson())),
      };
}

class ClassInfo {
  ClassInfo({
    this.fullName,
    this.homeroomTeacherId,
    this.id,
    this.majorsId,
    this.quanlityStudent,
    this.scholastic,
    this.shortName,
  });

  String fullName;
  String homeroomTeacherId;
  String id;
  String majorsId;
  int quanlityStudent;
  String scholastic;
  String shortName;

  factory ClassInfo.fromRawJson(String str) =>
      ClassInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ClassInfo.fromJson(Map<String, dynamic> json) => ClassInfo(
        fullName: json["fullName"] == null ? null : json["fullName"],
        homeroomTeacherId: json["homeroomTeacherId"] == null
            ? null
            : json["homeroomTeacherId"],
        id: json["id"] == null ? null : json["id"],
        majorsId: json["majorsId"] == null ? null : json["majorsId"],
        quanlityStudent:
            json["quanlityStudent"] == null ? null : json["quanlityStudent"],
        scholastic: json["scholastic"] == null ? null : json["scholastic"],
        shortName: json["shortName"] == null ? null : json["shortName"],
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName == null ? null : fullName,
        "homeroomTeacherId":
            homeroomTeacherId == null ? null : homeroomTeacherId,
        "id": id == null ? null : id,
        "majorsId": majorsId == null ? null : majorsId,
        "quanlityStudent": quanlityStudent == null ? null : quanlityStudent,
        "scholastic": scholastic == null ? null : scholastic,
        "shortName": shortName == null ? null : shortName,
      };
}

class MajorsInfo {
  MajorsInfo({
    this.facultyId,
    this.fullName,
    this.id,
    this.shortName,
  });

  String facultyId;
  String fullName;
  String id;
  String shortName;

  factory MajorsInfo.fromRawJson(String str) =>
      MajorsInfo.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MajorsInfo.fromJson(Map<String, dynamic> json) => MajorsInfo(
        facultyId: json["facultyId"] == null ? null : json["facultyId"],
        fullName: json["fullName"] == null ? null : json["fullName"],
        id: json["id"] == null ? null : json["id"],
        shortName: json["shortName"] == null ? null : json["shortName"],
      );

  Map<String, dynamic> toJson() => {
        "facultyId": facultyId == null ? null : facultyId,
        "fullName": fullName == null ? null : fullName,
        "id": id == null ? null : id,
        "shortName": shortName == null ? null : shortName,
      };
}

class Semester {
  Semester({
    this.endTime,
    this.id,
    this.isCurrent,
    this.name,
    this.startTime,
  });

  DateTime endTime;
  String id;
  bool isCurrent;
  String name;
  DateTime startTime;

  factory Semester.fromRawJson(String str) =>
      Semester.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Semester.fromJson(Map<String, dynamic> json) => Semester(
        endTime:
            json["endTime"] == null ? null : DateTime.parse(json["endTime"]),
        id: json["id"] == null ? null : json["id"],
        isCurrent: json["isCurrent"] == null ? null : json["isCurrent"],
        name: json["name"] == null ? null : json["name"],
        startTime: json["startTime"] == null
            ? null
            : DateTime.parse(json["startTime"]),
      );

  Map<String, dynamic> toJson() => {
        "endTime": endTime == null
            ? null
            : "${endTime.year.toString().padLeft(4, '0')}-${endTime.month.toString().padLeft(2, '0')}-${endTime.day.toString().padLeft(2, '0')}",
        "id": id == null ? null : id,
        "isCurrent": isCurrent == null ? null : isCurrent,
        "name": name == null ? null : name,
        "startTime": startTime == null
            ? null
            : "${startTime.year.toString().padLeft(4, '0')}-${startTime.month.toString().padLeft(2, '0')}-${startTime.day.toString().padLeft(2, '0')}",
      };
}
