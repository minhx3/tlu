import 'package:thanglong_university/app/model/chat/user_entity.dart';

userEntityFromJson(UserEntity data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id'].toString();
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
	return data;
}

Map<String, dynamic> userEntityToJson(UserEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['avatar'] = entity.avatar;
	data['dob'] = entity.dob;
	data['email'] = entity.email;
	data['mobile'] = entity.mobile;
	data['className'] = entity.className;
	data['majors'] = entity.majors;
	return data;
}