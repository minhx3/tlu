import 'dart:convert';

import 'package:thanglong_university/app/enums/notification_status_enum.dart';
import 'package:thanglong_university/app/enums/notification_type_enum.dart';

class NotificationModel {
  NotificationModel({
    this.createDate,
    this.expriteDate,
    this.title,
    this.desc,
    this.type,
    this.id,
    this.status,
  });

  int createDate;
  int expriteDate;
  String title;
  String desc;
  NotificationTypeEnum type;
  String id;
  NotificationStatusEnum status;

  factory NotificationModel.fromRawJson(String str) =>
      NotificationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        id: json["id"] == null ? null : json["id"],
        createDate: json["createDate"] == null ? null : json["createDate"],
        expriteDate: json["expriteDate"] == null ? null : json["expriteDate"],
        title: json["title"] == null ? null : json["title"],
        desc: json["desc"] == null ? null : json["desc"],
        type: json["type"] == null
            ? null
            : notificationTypeValues.map[json["type"]],
        status: json["status"] == null
            ? null
            : notificationStatusValues.map[json["status"]],
      );

  Map<String, dynamic> toJson() => {
        "createDate": createDate == null ? null : createDate,
        "expriteDate": expriteDate == null ? null : expriteDate,
        "title": title == null ? null : title,
        "desc": desc == null ? null : desc,
        "type": type == null ? null : type,
        "id": id == null ? null : id,
        "status": status == null ? null : status,
      };
}
