import 'dart:convert';

class UserSetting {
    UserSetting({
        this.darkMode,
        this.loginBiometric,
        this.notificationSetting,
    });

    bool darkMode;
    bool loginBiometric;
    List<NotificationSetting> notificationSetting;

    factory UserSetting.fromRawJson(String str) => UserSetting.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UserSetting.fromJson(Map<String, dynamic> json) => UserSetting(
        darkMode: json["darkMode"] == null ? null : json["darkMode"],
        loginBiometric: json["loginBiometric"] == null ? null : json["loginBiometric"],
        notificationSetting: json["notificationSetting"] == null ? null : List<NotificationSetting>.from(json["notificationSetting"].map((x) => NotificationSetting.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "darkMode": darkMode == null ? null : darkMode,
        "loginBiometric": loginBiometric == null ? null : loginBiometric,
        "notificationSetting": notificationSetting == null ? null : List<dynamic>.from(notificationSetting.map((x) => x.toJson())),
    };
}

class NotificationSetting {
    NotificationSetting({
        this.enable,
        this.type,
        this.name,
    });

    bool enable;
    String type;
    String name;

    factory NotificationSetting.fromRawJson(String str) => NotificationSetting.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory NotificationSetting.fromJson(Map<String, dynamic> json) => NotificationSetting(
        enable: json["enable"] == null ? null : json["enable"],
        type: json["type"] == null ? null : json["type"],
        name: json["name"] == null ? null : json["name"],
    );

    Map<String, dynamic> toJson() => {
        "enable": enable == null ? null : enable,
        "type": type == null ? null : type,
        "name": name == null ? null : name,
    };
}
