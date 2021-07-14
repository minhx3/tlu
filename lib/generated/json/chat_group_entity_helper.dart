import 'package:thanglong_university/app/model/chat_group_entity.dart';

chatGroupEntityFromJson(ChatGroupEntity data, Map<String, dynamic> json) {
	if (json['id'] != null) {
		data.id = json['id'].toString();
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	return data;
}

Map<String, dynamic> chatGroupEntityToJson(ChatGroupEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['id'] = entity.id;
	data['name'] = entity.name;
	return data;
}