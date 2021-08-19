import 'package:thanglong_university/app/configuration/base/enum-values.dart';

enum SubjectTypeEnum { DC, CN }

final subjectTypeValues = EnumValues({
  "DC": SubjectTypeEnum.DC,
  "CN": SubjectTypeEnum.CN,
});

final subjectTypesSwitch = EnumValues({
  "Đại cương": SubjectTypeEnum.DC,
  "Chuyên ngành": SubjectTypeEnum.CN,
});
