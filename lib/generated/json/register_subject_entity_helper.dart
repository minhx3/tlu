import 'package:thanglong_university/app/model/register_subject_entity.dart';
import 'package:thanglong_university/app/model/chat_group_entity.dart';

registerSubjectEntityFromJson(RegisterSubjectEntity data, Map<String, dynamic> json) {
	if (json['closeRgister'] != null) {
		data.closeRgister = json['closeRgister'].toString();
	}
	if (json['openRegister'] != null) {
		data.openRegister = json['openRegister'].toString();
	}
	if (json['status'] != null) {
		data.status = json['status'].toString();
	}
	if (json['examCnditions'] != null) {
		data.examCnditions = json['examCnditions'].toString();
	}
	if (json['haveRegistered'] != null) {
		data.haveRegistered = json['haveRegistered'] is String
				? int.tryParse(json['haveRegistered'])
				: json['haveRegistered'].toInt();
	}
	if (json['id'] != null) {
		data.id = json['id'].toString();
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['isHasGreatExercise'] != null) {
		data.isHasGreatExercise = json['isHasGreatExercise'];
	}
	if (json['isOnline'] != null) {
		data.isOnline = json['isOnline'];
	}
	if (json['group'] != null) {
		data.group = json['group'].toString();
	}
	if (json['listTeacher'] != null) {
		data.listTeacher = (json['listTeacher'] as List).map((v) => RegisterSubjectListTeacher().fromJson(v)).toList();
	}
	if (json['listTimelineClass'] != null) {
		data.listTimelineClass = (json['listTimelineClass'] as List).map((v) => RegisterSubjectListTimelineClassTimeLines().fromJson(v)).toList();
	}
	if (json['note'] != null) {
		data.note = json['note'].toString();
	}
	if (json['numberOfLessons'] != null) {
		data.numberOfLessons = (json['numberOfLessons'] as List).map((v) => RegisterSubjectNumberOfLessons().fromJson(v)).toList();
	}
	if (json['optionListBook'] != null) {
		data.optionListBook = (json['optionListBook'] as List).map((v) => RegisterSubjectOptionListBook().fromJson(v)).toList();
	}
	if (json['population'] != null) {
		data.population = json['population'] is String
				? int.tryParse(json['population'])
				: json['population'].toInt();
	}
	if (json['prerequisiteSubject'] != null) {
		data.prerequisiteSubject = RegisterSubjectPrerequisiteSubject().fromJson(json['prerequisiteSubject']);
	}
	if (json['requiredListBook'] != null) {
		data.requiredListBook = (json['requiredListBook'] as List).map((v) => RegisterSubjectRequiredListBook().fromJson(v)).toList();
	}
	if (json['schoolFee'] != null) {
		data.schoolFee = json['schoolFee'] is String
				? int.tryParse(json['schoolFee'])
				: json['schoolFee'].toInt();
	}
	if (json['scoringMethod'] != null) {
		data.scoringMethod = json['scoringMethod'].toString();
	}
	if (json['semester'] != null) {
		data.semester = RegisterSubjectSemester().fromJson(json['semester']);
	}
	if (json['subjectId'] != null) {
		data.subjectId = RegisterSubjectSubjectId().fromJson(json['subjectId']);
	}
	return data;
}

Map<String, dynamic> registerSubjectEntityToJson(RegisterSubjectEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['closeRgister'] = entity.closeRgister;
	data['openRegister'] = entity.openRegister;
	data['status'] = entity.status;
	data['examCnditions'] = entity.examCnditions;
	data['haveRegistered'] = entity.haveRegistered;
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['isHasGreatExercise'] = entity.isHasGreatExercise;
	data['isOnline'] = entity.isOnline;
	data['group'] = entity.group;
	data['listTeacher'] =  entity.listTeacher?.map((v) => v.toJson())?.toList();
	data['listTimelineClass'] =  entity.listTimelineClass?.map((v) => v.toJson())?.toList();
	data['note'] = entity.note;
	data['numberOfLessons'] =  entity.numberOfLessons?.map((v) => v.toJson())?.toList();
	data['optionListBook'] =  entity.optionListBook?.map((v) => v.toJson())?.toList();
	data['population'] = entity.population;
	data['prerequisiteSubject'] = entity.prerequisiteSubject?.toJson();
	data['requiredListBook'] =  entity.requiredListBook?.map((v) => v.toJson())?.toList();
	data['schoolFee'] = entity.schoolFee;
	data['scoringMethod'] = entity.scoringMethod;
	data['semester'] = entity.semester?.toJson();
	data['subjectId'] = entity.subjectId?.toJson();
	return data;
}

registerSubjectListTeacherFromJson(RegisterSubjectListTeacher data, Map<String, dynamic> json) {
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
		data.teachingList = (json['teachingList'] as List).map((v) => RegisterSubjectListTeacherTeachingList().fromJson(v)).toList();
	}
	return data;
}

Map<String, dynamic> registerSubjectListTeacherToJson(RegisterSubjectListTeacher entity) {
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

registerSubjectListTeacherTeachingListFromJson(RegisterSubjectListTeacherTeachingList data, Map<String, dynamic> json) {
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

Map<String, dynamic> registerSubjectListTeacherTeachingListToJson(RegisterSubjectListTeacherTeachingList entity) {
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

registerSubjectListTimelineClassFromJson(RegisterSubjectListTimelineClass data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code'].toString();
	}
	if (json['teacher'] != null) {
		data.teacher = RegisterSubjectListTimelineClassTeacher().fromJson(json['teacher']);
	}
	if (json['timeLines'] != null) {
		data.timeLines = (json['timeLines'] as List).map((v) => RegisterSubjectListTimelineClassTimeLines().fromJson(v)).toList();
	}
	return data;
}

Map<String, dynamic> registerSubjectListTimelineClassToJson(RegisterSubjectListTimelineClass entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['teacher'] = entity.teacher?.toJson();
	data['timeLines'] =  entity.timeLines?.map((v) => v.toJson())?.toList();
	return data;
}

registerSubjectListTimelineClassTeacherFromJson(RegisterSubjectListTimelineClassTeacher data, Map<String, dynamic> json) {
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
		data.teachingList = (json['teachingList'] as List).map((v) => RegisterSubjectListTimelineClassTeacherTeachingList().fromJson(v)).toList();
	}
	return data;
}

Map<String, dynamic> registerSubjectListTimelineClassTeacherToJson(RegisterSubjectListTimelineClassTeacher entity) {
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

registerSubjectListTimelineClassTeacherTeachingListFromJson(RegisterSubjectListTimelineClassTeacherTeachingList data, Map<String, dynamic> json) {
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

Map<String, dynamic> registerSubjectListTimelineClassTeacherTeachingListToJson(RegisterSubjectListTimelineClassTeacherTeachingList entity) {
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

registerSubjectListTimelineClassTimeLinesFromJson(RegisterSubjectListTimelineClassTimeLines data, Map<String, dynamic> json) {
	if (json['fromDate'] != null) {
		data.fromDate = json['fromDate'].toString();
	}
	if (json['id'] != null) {
		data.id = json['id'].toString();
	}
	if (json['listSchedule'] != null) {
		data.listSchedule = (json['listSchedule'] as List).map((v) => RegisterSubjectListTimelineClassTimeLinesListSchedule().fromJson(v)).toList();
	}
	if (json['toDate'] != null) {
		data.toDate = json['toDate'].toString();
	}
	if (json['teacher'] != null) {
		data.teacher = RegisterSubjectListTimelineClassTeacher().fromJson(json['teacher']);
	}
	return data;
}

Map<String, dynamic> registerSubjectListTimelineClassTimeLinesToJson(RegisterSubjectListTimelineClassTimeLines entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['fromDate'] = entity.fromDate;
	data['id'] = entity.id;
	data['listSchedule'] =  entity.listSchedule?.map((v) => v.toJson())?.toList();
	data['toDate'] = entity.toDate;
	data['teacher'] = entity.teacher?.toJson();
	return data;
}

registerSubjectListTimelineClassTimeLinesListScheduleFromJson(RegisterSubjectListTimelineClassTimeLinesListSchedule data, Map<String, dynamic> json) {
	if (json['address'] != null) {
		data.address = json['address'].toString();
	}
	if (json['dayOfWeek'] != null) {
		data.dayOfWeek = json['dayOfWeek'] is String
				? int.tryParse(json['dayOfWeek'])
				: json['dayOfWeek'].toInt();
	}
	if (json['listSession'] != null) {
		data.listSession = (json['listSession'] as List).map((v) => RegisterSubjectListTimelineClassTimeLinesListScheduleListSession().fromJson(v)).toList();
	}
	if (json['note'] != null) {
		data.note = json['note'].toString();
	}
	return data;
}

Map<String, dynamic> registerSubjectListTimelineClassTimeLinesListScheduleToJson(RegisterSubjectListTimelineClassTimeLinesListSchedule entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['address'] = entity.address;
	data['dayOfWeek'] = entity.dayOfWeek;
	data['listSession'] =  entity.listSession?.map((v) => v.toJson())?.toList();
	data['note'] = entity.note;
	return data;
}

registerSubjectListTimelineClassTimeLinesListScheduleListSessionFromJson(RegisterSubjectListTimelineClassTimeLinesListScheduleListSession data, Map<String, dynamic> json) {
	if (json['durationMinus'] != null) {
		data.durationMinus = json['durationMinus'] is String
				? int.tryParse(json['durationMinus'])
				: json['durationMinus'].toInt();
	}
	if (json['endTime'] != null) {
		data.endTime = RegisterSubjectListTimelineClassTimeLinesListScheduleListSessionEndTime().fromJson(json['endTime']);
	}
	if (json['id'] != null) {
		data.id = json['id'].toString();
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['startTime'] != null) {
		data.startTime = RegisterSubjectListTimelineClassTimeLinesListScheduleListSessionStartTime().fromJson(json['startTime']);
	}
	return data;
}

Map<String, dynamic> registerSubjectListTimelineClassTimeLinesListScheduleListSessionToJson(RegisterSubjectListTimelineClassTimeLinesListScheduleListSession entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['durationMinus'] = entity.durationMinus;
	data['endTime'] = entity.endTime?.toJson();
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['startTime'] = entity.startTime?.toJson();
	return data;
}

registerSubjectListTimelineClassTimeLinesListScheduleListSessionEndTimeFromJson(RegisterSubjectListTimelineClassTimeLinesListScheduleListSessionEndTime data, Map<String, dynamic> json) {
	if (json['hours'] != null) {
		data.hours = json['hours'] is String
				? int.tryParse(json['hours'])
				: json['hours'].toInt();
	}
	if (json['minutes'] != null) {
		data.minutes = json['minutes'] is String
				? int.tryParse(json['minutes'])
				: json['minutes'].toInt();
	}
	if (json['seconds'] != null) {
		data.seconds = json['seconds'] is String
				? int.tryParse(json['seconds'])
				: json['seconds'].toInt();
	}
	return data;
}

Map<String, dynamic> registerSubjectListTimelineClassTimeLinesListScheduleListSessionEndTimeToJson(RegisterSubjectListTimelineClassTimeLinesListScheduleListSessionEndTime entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['hours'] = entity.hours;
	data['minutes'] = entity.minutes;
	data['seconds'] = entity.seconds;
	return data;
}

registerSubjectListTimelineClassTimeLinesListScheduleListSessionStartTimeFromJson(RegisterSubjectListTimelineClassTimeLinesListScheduleListSessionStartTime data, Map<String, dynamic> json) {
	if (json['hours'] != null) {
		data.hours = json['hours'] is String
				? int.tryParse(json['hours'])
				: json['hours'].toInt();
	}
	if (json['minutes'] != null) {
		data.minutes = json['minutes'] is String
				? int.tryParse(json['minutes'])
				: json['minutes'].toInt();
	}
	if (json['seconds'] != null) {
		data.seconds = json['seconds'] is String
				? int.tryParse(json['seconds'])
				: json['seconds'].toInt();
	}
	return data;
}

Map<String, dynamic> registerSubjectListTimelineClassTimeLinesListScheduleListSessionStartTimeToJson(RegisterSubjectListTimelineClassTimeLinesListScheduleListSessionStartTime entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['hours'] = entity.hours;
	data['minutes'] = entity.minutes;
	data['seconds'] = entity.seconds;
	return data;
}

registerSubjectNumberOfLessonsFromJson(RegisterSubjectNumberOfLessons data, Map<String, dynamic> json) {
	if (json['quanlity'] != null) {
		data.quanlity = json['quanlity'] is String
				? int.tryParse(json['quanlity'])
				: json['quanlity'].toInt();
	}
	if (json['type'] != null) {
		data.type = json['type'].toString();
	}
	return data;
}

Map<String, dynamic> registerSubjectNumberOfLessonsToJson(RegisterSubjectNumberOfLessons entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['quanlity'] = entity.quanlity;
	data['type'] = entity.type;
	return data;
}

registerSubjectOptionListBookFromJson(RegisterSubjectOptionListBook data, Map<String, dynamic> json) {
	if (json['author'] != null) {
		data.author = json['author'].toString();
	}
	if (json['id'] != null) {
		data.id = json['id'].toString();
	}
	if (json['link'] != null) {
		data.link = json['link'].toString();
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['publishingYear'] != null) {
		data.publishingYear = json['publishingYear'].toString();
	}
	return data;
}

Map<String, dynamic> registerSubjectOptionListBookToJson(RegisterSubjectOptionListBook entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['author'] = entity.author;
	data['id'] = entity.id;
	data['link'] = entity.link;
	data['name'] = entity.name;
	data['publishingYear'] = entity.publishingYear;
	return data;
}

registerSubjectPrerequisiteSubjectFromJson(RegisterSubjectPrerequisiteSubject data, Map<String, dynamic> json) {
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
				? int.tryParse(json['factor'])
				: json['factor'].toInt();
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

Map<String, dynamic> registerSubjectPrerequisiteSubjectToJson(RegisterSubjectPrerequisiteSubject entity) {
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

registerSubjectRequiredListBookFromJson(RegisterSubjectRequiredListBook data, Map<String, dynamic> json) {
	if (json['author'] != null) {
		data.author = json['author'].toString();
	}
	if (json['id'] != null) {
		data.id = json['id'].toString();
	}
	if (json['link'] != null) {
		data.link = json['link'].toString();
	}
	if (json['name'] != null) {
		data.name = json['name'].toString();
	}
	if (json['publishingYear'] != null) {
		data.publishingYear = json['publishingYear'].toString();
	}
	return data;
}

Map<String, dynamic> registerSubjectRequiredListBookToJson(RegisterSubjectRequiredListBook entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['author'] = entity.author;
	data['id'] = entity.id;
	data['link'] = entity.link;
	data['name'] = entity.name;
	data['publishingYear'] = entity.publishingYear;
	return data;
}

registerSubjectSemesterFromJson(RegisterSubjectSemester data, Map<String, dynamic> json) {
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

Map<String, dynamic> registerSubjectSemesterToJson(RegisterSubjectSemester entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['endTime'] = entity.endTime;
	data['id'] = entity.id;
	data['name'] = entity.name;
	data['startTime'] = entity.startTime;
	return data;
}

registerSubjectSubjectIdFromJson(RegisterSubjectSubjectId data, Map<String, dynamic> json) {
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

Map<String, dynamic> registerSubjectSubjectIdToJson(RegisterSubjectSubjectId entity) {
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