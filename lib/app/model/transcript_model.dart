// To parse this JSON data, do
//
//     final transcriptModel = transcriptModelFromJson(jsonString);

import 'dart:convert';

TranscriptModel transcriptModelFromJson(String str) => TranscriptModel.fromJson(json.decode(str));

String transcriptModelToJson(TranscriptModel data) => json.encode(data.toJson());

class TranscriptModel {
  TranscriptModel({
    this.gpa,
    this.id,
    this.subject,
    this.subjectClassId,
  });

  double gpa;
  String id;
  Subject subject;
  String subjectClassId;

  factory TranscriptModel.fromJson(Map<String, dynamic> json) => TranscriptModel(
    gpa: json["gpa"] == null ? null : json["gpa"].toDouble(),
    id: json["id"] == null ? null : json["id"],
    subject: json["subject"] == null ? null : Subject.fromJson(json["subject"]),
    subjectClassId: json["subjectClassId"] == null ? null : json["subjectClassId"],
  );

  Map<String, dynamic> toJson() => {
    "gpa": gpa == null ? null : gpa,
    "id": id == null ? null : id,
    "subject": subject == null ? null : subject.toJson(),
    "subjectClassId": subjectClassId == null ? null : subjectClassId,
  };
}

class Subject {
  Subject({
    this.id,
    this.credits,
    this.description,
    this.name,
    this.porpose,
    this.type,
  });

  String id;
  int credits;
  String description;
  String name;
  String porpose;
  String type;

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
    id: json["id"] == null ? null : json["id"],
    credits: json["credits"] == null ? null : json["credits"],
    description: json["description"] == null ? null : json["description"],
    name: json["name"] == null ? null : json["name"],
    porpose: json["porpose"] == null ? null : json["porpose"],
    type: json["type"] == null ? null : json["type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "credits": credits == null ? null : credits,
    "description": description == null ? null : description,
    "name": name == null ? null : name,
    "porpose": porpose == null ? null : porpose,
    "type": type == null ? null : type,
  };
}
