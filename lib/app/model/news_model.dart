// To parse this JSON data, do
//
//     final newsModel = newsModelFromJson(jsonString);

import 'dart:convert';

import 'dart:typed_data';

List<NewsModel> newsModelFromJson(String str) =>
    List<NewsModel>.from(json.decode(str).map((x) => NewsModel.fromJson(x)));

String newsModelToJson(List<NewsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NewsModel {
  NewsModel({
    this.fullInfo,
    this.imageDescription,
    this.publishingTime,
    this.sumInfo,
    this.title,
    this.type,
    this.id,
    this.newsModelId,
  });

  String fullInfo;
  String imageDescription;
  DateTime publishingTime;
  String sumInfo;
  String title;
  String type;
  String id;
  String newsModelId;
  Uint8List thumb;

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        fullInfo: json["fullInfo"] == null ? null : json["fullInfo"],
        imageDescription:
            json["imageDescription"] == null ? null : json["imageDescription"],
        publishingTime: json["publishingTime"] == null
            ? null
            : DateTime.parse(json["publishingTime"]),
        sumInfo: json["sumInfo"] == null ? null : json["sumInfo"],
        title: json["title"] == null ? null : json["title"],
        type: json["type"] == null ? null : json["type"],
        id: json["_id"] == null ? null : json["_id"],
        newsModelId: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "fullInfo": fullInfo == null ? null : fullInfo,
        "imageDescription": imageDescription == null ? null : imageDescription,
        "publishingTime":
            publishingTime == null ? null : publishingTime.toIso8601String(),
        "sumInfo": sumInfo == null ? null : sumInfo,
        "title": title == null ? null : title,
        "type": type == null ? null : type,
        "_id": id == null ? null : id,
        "id": newsModelId == null ? null : newsModelId,
      };
}
