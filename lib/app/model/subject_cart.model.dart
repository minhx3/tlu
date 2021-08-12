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
  List<RegisterSubjectEntity> subjectClasses;

  factory SubjectCartModel.fromJson(Map<String, dynamic> json) =>
      SubjectCartModel(
        sumSchoolFee:
            json["sumSchoolFee"] == null ? null : json["sumSchoolFee"],
        sumCredits: json["sumCredits"] == null ? null : json["sumCredits"],
        subjectClasses: json["subjectClasses"] == null
            ? null
            : List<RegisterSubjectEntity>.from(json["subjectClasses"]
                .map((x) => RegisterSubjectEntity().fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "sumSchoolFee": sumSchoolFee == null ? null : sumSchoolFee,
        "sumCredits": sumCredits == null ? null : sumCredits,
        "subjectClasses": subjectClasses == null
            ? null
            : List<dynamic>.from(subjectClasses.map((x) => x.toJson())),
      };
}
