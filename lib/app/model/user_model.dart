// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.userFullName,
    this.avatar,
    this.dob,
    this.email,
    this.mobile,
    this.username,
    this.id,
    this.identityId,
    this.userModelId,
    this.sex,
    this.universityInfo,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.classInfo,
    this.fullName,
  });

  UserFullName userFullName;
  String avatar;
  String dob;
  String email;
  String mobile;
  String username;
  String id;
  int identityId;
  String userModelId;
  String sex;
  UniversityInfo universityInfo;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  ClassInfo classInfo;
  String fullName;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        userFullName: json["userFullName"] == null
            ? null
            : UserFullName.fromJson(json["userFullName"]),
        avatar: json["avatar"] == null ? null : json["avatar"],
        dob: json["dob"] == null ? null : json["dob"],
        email: json["email"] == null ? null : json["email"],
        mobile: json["mobile"] == null ? null : json["mobile"],
        username: json["username"] == null ? null : json["username"],
        id: json["_id"] == null ? null : json["_id"],
        identityId: json["identityId"] == null ? null : json["identityId"],
        userModelId: json["id"] == null ? null : json["id"],
        sex: json["sex"] == null ? null : json["sex"],
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
        classInfo: json["classInfo"] == null
            ? null
            : ClassInfo.fromJson(json["classInfo"]),
        fullName: json["fullName"] == null ? null : json["fullName"],
      );

  Map<String, dynamic> toJson() => {
        "userFullName": userFullName == null ? null : userFullName.toJson(),
        "avatar": avatar == null ? null : avatar,
        "dob": dob == null ? null : dob,
        "email": email == null ? null : email,
        "mobile": mobile == null ? null : mobile,
        "username": username == null ? null : username,
        "_id": id == null ? null : id,
        "identityId": identityId == null ? null : identityId,
        "id": userModelId == null ? null : userModelId,
        "sex": sex == null ? null : sex,
        "universityInfo":
            universityInfo == null ? null : universityInfo.toJson(),
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
        "classInfo": classInfo == null ? null : classInfo.toJson(),
        "fullName": fullName == null ? null : fullName,
      };
}

class ClassInfo {
  ClassInfo({
    this.fullName,
    this.quanlityStudent,
    this.scholastic,
    this.shortName,
    this.id,
    this.classInfoId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String fullName;
  int quanlityStudent;
  String scholastic;
  String shortName;
  String id;
  String classInfoId;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory ClassInfo.fromJson(Map<String, dynamic> json) => ClassInfo(
        fullName: json["fullName"] == null ? null : json["fullName"],
        quanlityStudent:
            json["quanlityStudent"] == null ? null : json["quanlityStudent"],
        scholastic: json["scholastic"] == null ? null : json["scholastic"],
        shortName: json["shortName"] == null ? null : json["shortName"],
        id: json["_id"] == null ? null : json["_id"],
        classInfoId: json["id"] == null ? null : json["id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName == null ? null : fullName,
        "quanlityStudent": quanlityStudent == null ? null : quanlityStudent,
        "scholastic": scholastic == null ? null : scholastic,
        "shortName": shortName == null ? null : shortName,
        "_id": id == null ? null : id,
        "id": classInfoId == null ? null : classInfoId,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
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
