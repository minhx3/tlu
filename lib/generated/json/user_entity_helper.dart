import 'package:thanglong_university/app/model/chat/user_entity.dart';
import 'package:thanglong_university/app/model/chat/subject_class_entity.dart';

userEntityFromJson(UserEntity data, Map<String, dynamic> json) {
  if (json['id'] != null) {
    data.id = json['id'].toString();
  }
  if (json['isTeacher'] != null) {
    data.isTeacher = json['isTeacher'];
  }
  if (json['name'] != null) {
    data.name = json['name'].toString();
  }
  if (json['avatar'] != null) {
    data.avatar = json['avatar'].toString();
  }
  if (json['dob'] != null) {
    data.dob = json['dob'].toString();
  }
  if (json['email'] != null) {
    data.email = json['email'].toString();
  }
  if (json['mobile'] != null) {
    data.mobile = json['mobile'].toString();
  }
  if (json['className'] != null) {
    data.className = json['className'].toString();
  }
  if (json['majors'] != null) {
    data.majors = json['majors'].toString();
  }
  if (json['degree'] != null) {
    data.degree = json['degree'].toString();
  }
  if (json['faculty'] != null) {
    data.faculty = json['faculty'].toString();
  }
  if (json['schoolYear'] != null) {
    data.schoolYear = json['schoolYear'].toString();
  }
  if (json['teachingList'] != null) {
    data.teachingList = (json['teachingList'] as List)
        .map((v) => SubjectClassTeacherTeachingList().fromJson(v))
        .toList();
  }
  return data;
}

Map<String, dynamic> userEntityToJson(UserEntity entity) {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = entity.id;
  data['isTeacher'] = entity.isTeacher;
  data['name'] = entity.name;
  data['avatar'] = entity.avatar;
  data['dob'] = entity.dob;
  data['email'] = entity.email;
  data['mobile'] = entity.mobile;
  data['className'] = entity.className;
  data['majors'] = entity.majors;
  data['degree'] = entity.degree;
  data['faculty'] = entity.faculty;
  data['schoolYear'] = entity.schoolYear;
  data['teachingList'] = entity.teachingList?.map((v) => v.toJson())?.toList();
  return data;
}
