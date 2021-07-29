import 'package:thanglong_university/app/model/subject_model.dart';
import 'package:thanglong_university/app/model/university_model.dart';
import 'package:thanglong_university/generated/json/base/json_field.dart';

class Teacher {
  Teacher({
    this.id,
    this.fullName,
    this.avatar,
    this.dob,
    this.email,
    this.mobile,
    this.degree,
    this.identityId,
    this.teacherId,
    this.sex,
    this.facultyId,
    this.universityInfo,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.teachingList,
  });

  String id;
  String fullName;
  String avatar;
  String dob;
  String email;
  String mobile;
  String degree;
  int identityId;
  @Deprecated('Should use ID to replace')
  String teacherId;
  String sex;
  String facultyId;
  UniversityInfo universityInfo;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  List<TeachingList> teachingList;

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
        id: json["id"] == null ? null : json["id"],
        fullName: json["fullName"] == null ? null : json["fullName"],
        avatar: json["avatar"] == null ? null : json["avatar"],
        dob: json["dob"] == null ? null : json["dob"],
        email: json["email"] == null ? null : json["email"],
        mobile: json["mobile"] == null ? null : json["mobile"],
        degree: json["degree"] == null ? null : json["degree"],
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
        teachingList: json["teachingList"] == null
            ? null
            : List<TeachingList>.from(
                json["teachingList"].map((x) => TeachingList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName == null ? null : fullName,
        "avatar": avatar == null ? null : avatar,
        "dob": dob == null ? null : dob,
        "email": email == null ? null : email,
        "mobile": mobile == null ? null : mobile,
        "degree": degree == null ? null : degree,
        "identityId": identityId == null ? null : identityId,
        "id": id == null ? null : id,
        "sex": sex == null ? null : sex,
        "facultyId": facultyId == null ? null : facultyId,
        "universityInfo":
            universityInfo == null ? null : universityInfo.toJson(),
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
        "teachingList": teachingList == null
            ? null
            : List<dynamic>.from(teachingList.map((x) => x.toJson())),
      };
}

class TeachingList {
  TeachingList({
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
    double factor,
  });

  Id id;
  int credits;
  String description;
  String name;
  String porpose;
  String prerequisiteSubjectId;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  Type type;
  double factor;

  TeachingList copyWith({
    int credits,
    String description,
    double factor,
    String id,
    String name,
    String porpose,
    String type,
  }) =>
      TeachingList(
        credits: credits ?? this.credits,
        description: description ?? this.description,
        factor: factor ?? this.factor,
        id: id ?? this.id,
        name: name ?? this.name,
        porpose: porpose ?? this.porpose,
        type: type ?? this.type,
      );

  factory TeachingList.fromJson(Map<String, dynamic> json) => TeachingList(
        id: json["_id"] == null ? null : idValues.map[json["_id"]],
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
