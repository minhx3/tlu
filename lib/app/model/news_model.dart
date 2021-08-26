// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

import 'dart:typed_data';

class NewsModel {
  NewsModel({
    this.imageDescription,
    this.publishingTime,
    this.title,
    this.htmlContent,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.id,
  });

  String imageDescription;
  DateTime publishingTime;
  String title;
  String htmlContent;
  String type;
  DateTime createdAt;
  DateTime updatedAt;
  String id;
  Uint8List get thumb {
    if (imageDescription?.contains("http") == false)
      return base64Decode(
          imageDescription.replaceAll("data:image/jpeg;base64,", ""));
    return null;
  }

  factory NewsModel.fromRawJson(String str) =>
      NewsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        imageDescription:
            json["imageDescription"] == null ? null : json["imageDescription"],
        publishingTime: json["publishingTime"] == null
            ? null
            : DateTime.parse(json["publishingTime"]),
        title: json["title"] == null ? null : json["title"],
        htmlContent: json["htmlContent"] == null ? null : json["htmlContent"],
        type: json["type"] == null ? null : json["type"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "imageDescription": imageDescription == null ? null : imageDescription,
        "publishingTime": publishingTime == null
            ? null
            : "${publishingTime.year.toString().padLeft(4, '0')}-${publishingTime.month.toString().padLeft(2, '0')}-${publishingTime.day.toString().padLeft(2, '0')}",
        "title": title == null ? null : title,
        "htmlContent": htmlContent == null ? null : htmlContent,
        "type": type == null ? null : type,
        "createdAt": createdAt == null ? null : createdAt.toIso8601String(),
        "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
        "id": id == null ? null : id,
      };
}
