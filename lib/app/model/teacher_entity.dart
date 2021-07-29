import 'package:thanglong_university/generated/json/base/json_convert_content.dart';

class TeacherEntity with JsonConvert<TeacherEntity> {
	String avatar;
	String degree;
	String dob;
	String email;
	String fullName;
	String id;
	String mobile;
	List<TeacherTeachingList> teachingList;
}

class TeacherTeachingList with JsonConvert<TeacherTeachingList> {
	int credits;
	String description;
	double factor;
	String id;
	String name;
	String porpose;
	String type;
}
