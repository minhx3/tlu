import 'package:thanglong_university/app/configuration/base/enum-values.dart';

enum NotificationTypeEnum {
  SCHEDULE,
  REGISTER,
  CONTACT,
  TRAINING,
  SUPPORT,
  OTHER
}

final notificationTypeValues = EnumValues({
  "SCHEDULE": NotificationTypeEnum.SCHEDULE,
  "REGISTER": NotificationTypeEnum.REGISTER,
  "CONTACT": NotificationTypeEnum.CONTACT,
  "TRAINING": NotificationTypeEnum.TRAINING,
  "SUPPORT": NotificationTypeEnum.SUPPORT,
  "OTHER": NotificationTypeEnum.OTHER,
});

final notificationTypeSwitch = EnumValues({
  "Quản lý lịch": NotificationTypeEnum.SCHEDULE,
  "Đăng ký học": NotificationTypeEnum.REGISTER,
  "Liên lạc": NotificationTypeEnum.CONTACT,
  "Đào tạo": NotificationTypeEnum.TRAINING,
  "Hỗ trợ": NotificationTypeEnum.SUPPORT,
  "Khác": NotificationTypeEnum.OTHER,
});
