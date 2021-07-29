import 'package:thanglong_university/app/model/teacher_entity.dart';

teacherEntityFromJson(TeacherEntity data, Map<String, dynamic> json) {
	if (json['avatar'] != null) {
		data.avatar = json['avatar'].toString();
	}
	if (json['degree'] != null) {
		data.degree = json['degree'].toString();
	}
	if (json['dob'] != null) {
		data.dob = json['dob'].toString();
	}
	if (json['email'] != null) {
		data.email = json['email'].toString();
	}
	if (json['fullName'] != null) {
		data.fullName = json['fullName'].toString();
	}
	if (json['id'] != null) {
		data.id = json['id'].toString();
	}
	if (json['mobile'] != null) {
		data.mobile = json['mobile'].toString();
	}
	if (json['teachingList'] != null) {
		data.teachingList = (json['teachingList'] as List).map((v) => TeacherTeachingList().fromJson(v)).toList();
	}
	return data;
}

Map<String, dynamic> teacherEntityToJson(TeacherEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['avatar'] = entity.avatar;
	data['degree'] = entity.degree;
	data['dob'] = entity.dob;
	data['email'] = entity.email;
	data['fullName'] = entity.fullName;
	data['id'] = entity.id;
	data['mobile'] = entity.mobile;
	data['teachingList'] =  entity.teachingList?.map((v) => v.toJson())?.toList();
	return data;
}

teacherTeachingListFromJson(TeacherTeachingList data, Map<String, dynamic> json) {
	if (json['credits'] != null) {
		data.credits = json['credits'] is String
				? int.tryParse(json['credits'])
				: json['credits'].toInt();
	}
	if (json['description'] != null) {
		data.description = json['description'].toString();
	}
	if (json['factor'] != null) {
		data.factor = json['factor'] is String
				? double.tryParse(json['factor'])
				: json['factor'].toDouble();
	}
	if (json['id'] != null) {
		data.id = json['id'].toString();
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['porpose'] != null) {
		data.porpose = json['porpose'].toString();
	}
	if (json['type'] != null) {
		data.type = json['type'].toString();
	}
	return data;
}

Map<String, dynamic> teacherTeachingListToJson(TeacherTeachingList entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['credits'] = entity.credits;
	data['description'] = entity.description;
	data['factor'] = entity.factor;
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['porpose'] = entity.porpose;
	data['type'] = entity.type;
	return data;
}