import 'package:thanglong_university/app/model/score_detail_entity1.dart';

scoreDetailEntity1FromJson(ScoreDetailEntity1 data, Map<String, dynamic> json) {
	if (json['listScoreDetail'] != null) {
		data.listScoreDetail = (json['listScoreDetail'] as List).map((v) => ScoreDetailListScoreDetail().fromJson(v)).toList();
	}
	if (json['scoreName'] != null) {
		data.scoreName = json['scoreName'].toString();
	}
	return data;
}

Map<String, dynamic> scoreDetailEntity1ToJson(ScoreDetailEntity1 entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['listScoreDetail'] =  entity.listScoreDetail?.map((v) => v.toJson())?.toList();
	data['scoreName'] = entity.scoreName;
	return data;
}

scoreDetailListScoreDetailFromJson(ScoreDetailListScoreDetail data, Map<String, dynamic> json) {
	if (json['scoreSkill'] != null) {
		data.scoreSkill = json['scoreSkill'] is String
				? int.tryParse(json['scoreSkill'])
				: json['scoreSkill'].toInt();
	}
	if (json['skill'] != null) {
		data.skill = json['skill'].toString();
	}
	return data;
}

Map<String, dynamic> scoreDetailListScoreDetailToJson(ScoreDetailListScoreDetail entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['scoreSkill'] = entity.scoreSkill;
	data['skill'] = entity.skill;
	return data;
}