import 'package:thanglong_university/app/configuration/base/enum-values.dart';

enum SubjectClassStatusEnum { PENDING, REGI, ACTV }

final subjectClassStatus = EnumValues({
  "PENDING": SubjectClassStatusEnum.PENDING,
  "REGI": SubjectClassStatusEnum.REGI,
  "ACTV": SubjectClassStatusEnum.ACTV,
});

final subjectClassStatusSwitch = EnumValues({
  "Chờ đăng ký": SubjectClassStatusEnum.PENDING,
  "Cho đăng ký": SubjectClassStatusEnum.REGI,
  "Lớp đã đủ": SubjectClassStatusEnum.ACTV,
});
