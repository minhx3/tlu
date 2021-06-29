// To parse this JSON data, do
//
//     final processModel = processModelFromJson(jsonString);

import 'dart:convert';

ProcessModel processModelFromJson(String str) =>
    ProcessModel.fromJson(json.decode(str));

String processModelToJson(ProcessModel data) => json.encode(data.toJson());

class ProcessModel {
  ProcessModel({
    this.gpa,
    this.completeCredits,
    this.sumCredits,
    this.sumCreditsInSemster,
  });

  double gpa;
  int completeCredits;
  int sumCredits;
  int sumCreditsInSemster;

  factory ProcessModel.fromJson(Map<String, dynamic> json) => ProcessModel(
        gpa: json["gpa"] == null ? null : json["gpa"].toDouble(),
        completeCredits:
            json["completeCredits"] == null ? null : json["completeCredits"],
        sumCredits: json["sumCredits"] == null ? null : json["sumCredits"],
        sumCreditsInSemster: json["sumCreditsInSemster"] == null
            ? null
            : json["sumCreditsInSemster"],
      );

  Map<String, dynamic> toJson() => {
        "gpa": gpa == null ? null : gpa,
        "completeCredits": completeCredits == null ? null : completeCredits,
        "sumCredits": sumCredits == null ? null : sumCredits,
        "sumCreditsInSemster":
            sumCreditsInSemster == null ? null : sumCreditsInSemster,
      };
}
