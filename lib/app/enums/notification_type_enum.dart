import 'package:thanglong_university/app/configuration/base/enum-values.dart';

enum NotificationTypeEnum {
  ALL,
  SCHEDULE,
  REGISTER,
  CONTACT,
  TRAINING,
  SUPPORT,
  OTHER
}

final notificationTypeValues = EnumValues({
  "ALL": NotificationTypeEnum.ALL,
  "SCHEDULE": NotificationTypeEnum.SCHEDULE,
  "REGISTER": NotificationTypeEnum.REGISTER,
  "CONTACT": NotificationTypeEnum.CONTACT,
  "TRAINING": NotificationTypeEnum.TRAINING,
  "SUPPORT": NotificationTypeEnum.SUPPORT,
  "OTHER": NotificationTypeEnum.OTHER,
});

final notificationTypeSwitch = EnumValues({
  "Tất cả": NotificationTypeEnum.ALL,
  "Quản lý lịch": NotificationTypeEnum.SCHEDULE,
  "Đăng ký học": NotificationTypeEnum.REGISTER,
  "Liên lạc": NotificationTypeEnum.CONTACT,
  "Đào tạo": NotificationTypeEnum.TRAINING,
  "Hỗ trợ": NotificationTypeEnum.SUPPORT,
  "Khác": NotificationTypeEnum.OTHER,
});
