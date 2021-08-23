import 'package:thanglong_university/app/model/register_entity.dart';
import 'package:intl/intl.dart';
import 'package:thanglong_university/app/enums/subject_group_status_enum.dart';

registerEntityFromJson(RegisterEntity data, Map<String, dynamic> json) {
	if (json['endTime'] != null) {
		data.endTime = json['endTime'] is String
				? int.tryParse(json['endTime'])
				: json['endTime'].toInt();
	}
	if (json['startTime'] != null) {
		data.startTime = json['startTime'] is String
				? int.tryParse(json['startTime'])
				: json['startTime'].toInt();
	}
	if (json['groupId'] != null) {
		data.groupId = json['groupId'].toString();
	}
	if (json['groupName'] != null) {
		data.groupName = json['groupName'].toString();
	}
	if (json['semsterInfo'] != null) {
		data.semsterInfo = RegisterSemsterInfo().fromJson(json['semsterInfo']);
	}
	if (json['title'] != null) {
		data.title = json['title'].toString();
	}
	return data;
}

Map<String, dynamic> registerEntityToJson(RegisterEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['endTime'] = entity.endTime;
	data['startTime'] = entity.startTime;
	data['groupId'] = entity.groupId;
	data['groupName'] = entity.groupName;
	data['semsterInfo'] = entity.semsterInfo?.toJson();
	data['title'] = entity.title;
	return data;
}

registerSemsterInfoFromJson(RegisterSemsterInfo data, Map<String, dynamic> json) {
	if (json['endTime'] != null) {
		data.endTime = json['endTime'].toString();
	}
	if (json['id'] != null) {
		data.id = json['id'].toString();
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['startTime'] != null) {
		data.startTime = json['startTime'].toString();
	}
	return data;
}

Map<String, dynamic> registerSemsterInfoToJson(RegisterSemsterInfo entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['endTime'] = entity.endTime;
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['startTime'] = entity.startTime;
	return data;
}