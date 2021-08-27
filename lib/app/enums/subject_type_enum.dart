import 'package:thanglong_university/app/configuration/base/enum-values.dart';

enum SubjectTypeEnum { DC, CN, TC }

final subjectTypeValues = EnumValues({
  "DC": SubjectTypeEnum.DC,
  "CN": SubjectTypeEnum.CN,
  "TC": SubjectTypeEnum.TC,
});

final subjectTypesSwitch = EnumValues({
  "Đại cương": SubjectTypeEnum.DC,
  "Chuyên ngành": SubjectTypeEnum.CN,
  "Tự chọn": SubjectTypeEnum.TC,
});
