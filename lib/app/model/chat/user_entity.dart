import 'package:thanglong_university/generated/json/base/json_convert_content.dart';

class UserEntity with JsonConvert<UserEntity> {
	String id;
	String name;
	String avatar;
	String dob;
	String email;
	String mobile;
	String className;
	String majors;
}
