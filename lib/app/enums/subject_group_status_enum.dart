import 'package:thanglong_university/app/configuration/base/enum-values.dart';

enum SujectGroupStatusEnum { OPEN, RE_OPEN, PENDING, CLOSE }

final subjectGroupStatus = EnumValues({
  "OPEN": SujectGroupStatusEnum.OPEN,
  "RE_OPEN": SujectGroupStatusEnum.RE_OPEN,
  "PENDING": SujectGroupStatusEnum.PENDING,
  "CLOSE": SujectGroupStatusEnum.CLOSE,
});

final subjectGroupStatusSwitch = EnumValues({
  "Đang mở": SujectGroupStatusEnum.OPEN,
  "Mở lại": SujectGroupStatusEnum.RE_OPEN,
  "Sắp mở": SujectGroupStatusEnum.PENDING,
  "Đã khóa": SujectGroupStatusEnum.CLOSE,
});
