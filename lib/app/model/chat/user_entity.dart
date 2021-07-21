import 'package:thanglong_university/app/model/chat/base_model.dart';
import 'package:thanglong_university/app/model/chat/subject_class_entity.dart';
import 'package:thanglong_university/generated/json/base/json_convert_content.dart';

class UserEntity extends UserModel with JsonConvert<UserEntity> {
  String id;
  bool isTeacher;
  String name;
  String avatar;
  String dob;
  String email;
  String mobile;
  String className;
  String majors;
  String degree;
  String faculty;
  List<SubjectClassTeacherTeachingList> teachingList;

  UserEntity(
      {this.id,
      this.isTeacher = false,
      this.name,
      this.avatar,
      this.dob,
      this.email,
      this.mobile,
      this.className,
      this.majors,
        this.faculty,
      this.degree,
      this.teachingList});

  String get getTeaching {
    return teachingList.map((e) => e.name).join(', ');
  }

}
