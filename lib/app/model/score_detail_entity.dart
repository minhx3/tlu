// To parse this JSON data, do
//
//     final scoreDetailModel = scoreDetailModelFromJson(jsonString);

import 'dart:convert';

ScoreDetailEntity scoreDetailModelFromJson(String str) => ScoreDetailEntity.fromJson(json.decode(str));

String scoreDetailModelToJson(ScoreDetailEntity data) => json.encode(data.toJson());

class ScoreDetailEntity {
  ScoreDetailEntity({
    this.gpa,
    this.id,
    this.subject,
    this.subjectClassId,
    this.scores,
  });

  double gpa;
  String id;
  Subject subject;
  String subjectClassId;
  List<Score> scores;

  factory ScoreDetailEntity.fromJson(Map<String, dynamic> json) => ScoreDetailEntity(
    gpa: json["gpa"] == null ? null : json["gpa"].toDouble(),
    id: json["id"] == null ? null : json["id"],
    subject: json["subject"] == null ? null : Subject.fromJson(json["subject"]),
    subjectClassId: json["subjectClassId"] == null ? null : json["subjectClassId"],
    scores: json["scores"] == null ? null : List<Score>.from(json["scores"].map((x) => Score.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "gpa": gpa == null ? null : gpa,
    "id": id == null ? null : id,
    "subject": subject == null ? null : subject.toJson(),
    "subjectClassId": subjectClassId == null ? null : subjectClassId,
    "scores": scores == null ? null : List<dynamic>.from(scores.map((x) => x.toJson())),
  };
}

class Score {
  Score({
    this.listScoreDetail,
    this.scoreName,
  });

  List<ListScoreDetail> listScoreDetail;
  String scoreName;

  factory Score.fromJson(Map<String, dynamic> json) => Score(
    listScoreDetail: json["listScoreDetail"] == null ? null : List<ListScoreDetail>.from(json["listScoreDetail"].map((x) => ListScoreDetail.fromJson(x))),
    scoreName: json["scoreName"] == null ? null : json["scoreName"],
  );

  Map<String, dynamic> toJson() => {
    "listScoreDetail": listScoreDetail == null ? null : List<dynamic>.from(listScoreDetail.map((x) => x.toJson())),
    "scoreName": scoreName == null ? null : scoreName,
  };

  String get scoreAvg {
    var res = listScoreDetail.map((e) => e.scoreSkill).reduce((a, b) => a + b) /
        listScoreDetail.length;
    return res.toString();
  }
}

class ListScoreDetail {
  ListScoreDetail({
    this.scoreSkill,
    this.skill,
  });

  int scoreSkill;
  String skill;

  factory ListScoreDetail.fromJson(Map<String, dynamic> json) => ListScoreDetail(
    scoreSkill: json["scoreSkill"] == null ? null : json["scoreSkill"],
    skill: json["skill"] == null ? null : json["skill"],
  );

  Map<String, dynamic> toJson() => {
    "scoreSkill": scoreSkill == null ? null : scoreSkill,
    "skill": skill == null ? null : skill,
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
