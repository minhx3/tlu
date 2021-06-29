// To parse this JSON data, do
//
//     final transcriptModel = transcriptModelFromJson(jsonString);

import 'dart:convert';

List<TranscriptModel> transcriptModelFromJson(String str) =>
    List<TranscriptModel>.from(
        json.decode(str).map((x) => TranscriptModel.fromJson(x)));

String transcriptModelToJson(List<TranscriptModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TranscriptModel {
  TranscriptModel({
    this.gpa,
    this.transcriptModelId,
    this.id,
    this.scores,
    this.semester,
    this.subject,
    this.subjectClassId,
  });

  double gpa;
  String transcriptModelId;
  String id;
  List<Score> scores;
  Semester semester;
  Subject subject;
  String subjectClassId;

  factory TranscriptModel.fromJson(Map<String, dynamic> json) =>
      TranscriptModel(
        gpa: json["gpa"] == null ? null : json["gpa"].toDouble(),
        transcriptModelId: json["id"] == null ? null : json["id"],
        id: json["_id"] == null ? null : json["_id"],
        scores: json["scores"] == null
            ? null
            : List<Score>.from(json["scores"].map((x) => Score.fromJson(x))),
        semester: json["semester"] == null
            ? null
            : Semester.fromJson(json["semester"]),
        subject:
            json["subject"] == null ? null : Subject.fromJson(json["subject"]),
        subjectClassId:
            json["subjectClassId"] == null ? null : json["subjectClassId"],
      );

  Map<String, dynamic> toJson() => {
        "gpa": gpa == null ? null : gpa,
        "id": transcriptModelId == null ? null : transcriptModelId,
        "_id": id == null ? null : id,
        "scores": scores == null
            ? null
            : List<dynamic>.from(scores.map((x) => x.toJson())),
        "semester": semester == null ? null : semester.toJson(),
        "subject": subject == null ? null : subject.toJson(),
        "subjectClassId": subjectClassId == null ? null : subjectClassId,
      };
}

class Score {
  Score({
    this.scoreLevel,
    this.scoreName,
    this.scoreValue,
  });

  String scoreLevel;
  String scoreName;
  int scoreValue;

  factory Score.fromJson(Map<String, dynamic> json) => Score(
        scoreLevel: json["scoreLevel"] == null ? null : json["scoreLevel"],
        scoreName: json["scoreName"] == null ? null : json["scoreName"],
        scoreValue: json["scoreValue"] == null ? null : json["scoreValue"],
      );

  Map<String, dynamic> toJson() => {
        "scoreLevel": scoreLevel == null ? null : scoreLevel,
        "scoreName": scoreName == null ? null : scoreName,
        "scoreValue": scoreValue == null ? null : scoreValue,
      };
}

class Semester {
  Semester({
    this.endTime,
    this.name,
    this.startTime,
    this.id,
    this.isCurrent,
    this.semesterId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String endTime;
  String name;
  String startTime;
  String id;
  bool isCurrent;
  String semesterId;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Semester.fromJson(Map<String, dynamic> json) => Semester(
        endTime: json["endTime"] == null ? null : json["endTime"],
        name: json["name"] == null ? null : json["name"],
        startTime: json["startTime"] == null ? null : json["startTime"],
        id: json["_id"] == null ? null : json["_id"],
        isCurrent: json["isCurrent"] == null ? null : json["isCurrent"],
        semesterId: json["id"] == null ? null : json["id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "endTime": endTime == null ? null : endTime,
        "name": name == null ? null : name,
        "startTime": startTime == null ? null : startTime,
        "_id": id == null ? null : id,
        "isCurrent": isCurrent == null ? null : isCurrent,
        "id": semesterId == null ? null : semesterId,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
      };
}

class Subject {
  Subject({
    this.credits,
    this.description,
    this.name,
    this.porpose,
    this.id,
    this.subjectId,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  int credits;
  String description;
  String name;
  String porpose;
  String id;
  String subjectId;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Subject.fromJson(Map<String, dynamic> json) => Subject(
        credits: json["credits"] == null ? null : json["credits"],
        description: json["description"] == null ? null : json["description"],
        name: json["name"] == null ? null : json["name"],
        porpose: json["porpose"] == null ? null : json["porpose"],
        id: json["_id"] == null ? null : json["_id"],
        subjectId: json["id"] == null ? null : json["id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "credits": credits == null ? null : credits,
        "description": description == null ? null : description,
        "name": name == null ? null : name,
        "porpose": porpose == null ? null : porpose,
        "_id": id == null ? null : id,
        "id": subjectId == null ? null : subjectId,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "__v": v == null ? null : v,
      };
}
