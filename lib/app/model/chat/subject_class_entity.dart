import 'package:thanglong_university/generated/json/base/json_convert_content.dart';

class SubjectClassEntity with JsonConvert<SubjectClassEntity> {
  String id;
  SubjectClassTeacher teacher;
  SubjectClassSemester semester;
  String timelineId;
  String name;

  String get groupId {
    return '${id}_${teacher?.teachingList[0]?.id ?? ''}';
  }
}

class SubjectClassTeacher with JsonConvert<SubjectClassTeacher> {
  String avatar;
  String degree;
  String dob;
  String email;
  String fullName;
  String id;
  String mobile;
  String faculty;
  List<SubjectClassTeacherTeachingList> teachingList;
}

class SubjectClassTeacherTeachingList
    with JsonConvert<SubjectClassTeacherTeachingList> {
  int credits;
  String description;
  double factor;
  String id;
  String name;
  String porpose;
  String type;
}

class SubjectClassSemester with JsonConvert<SubjectClassSemester> {
  String endTime;
  String id;
  String name;
  String startTime;
}
