// To parse this JSON data, do
//
//     final accessTokenModel = accessTokenModelFromJson(jsonString);

import 'dart:convert';

AccessTokenModel accessTokenModelFromJson(String str) =>
    AccessTokenModel.fromJson(json.decode(str));

String accessTokenModelToJson(AccessTokenModel data) =>
    json.encode(data.toJson());

class AccessTokenModel {
  AccessTokenModel({
    this.accessToken,
    this.expriredDownTime,
    this.tokenType,
  });

  String accessToken;
  num expriredDownTime;
  String tokenType;

  factory AccessTokenModel.fromJson(Map<String, dynamic> json) =>
      AccessTokenModel(
        accessToken: json["accessToken"] == null ? null : json["accessToken"],
        expriredDownTime:
            json["expriredDownTime"] == null ? null : json["expriredDownTime"],
        tokenType: json["tokenType"] == null ? null : json["tokenType"],
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken == null ? null : accessToken,
        "expriredDownTime": expriredDownTime == null ? null : expriredDownTime,
        "tokenType": tokenType == null ? null : tokenType,
      };
}
