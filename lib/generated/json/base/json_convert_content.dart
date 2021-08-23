// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:thanglong_university/app/model/register_entity.dart';
import 'package:thanglong_university/generated/json/register_entity_helper.dart';
import 'package:thanglong_university/app/model/teacher_entity.dart';
import 'package:thanglong_university/generated/json/teacher_entity_helper.dart';
import 'package:thanglong_university/app/model/register_subject_entity.dart';
import 'package:thanglong_university/generated/json/register_subject_entity_helper.dart';
import 'package:thanglong_university/app/model/score_detail_entity.dart';
import 'package:thanglong_university/generated/json/score_detail_entity_helper.dart';
import 'package:thanglong_university/app/model/chat_group_entity.dart';
import 'package:thanglong_university/generated/json/chat_group_entity_helper.dart';
import 'package:thanglong_university/app/model/chat/user_entity.dart';
import 'package:thanglong_university/generated/json/user_entity_helper.dart';
import 'package:thanglong_university/app/model/chat/subject_class_entity.dart';
import 'package:thanglong_university/generated/json/subject_class_entity_helper.dart';

class JsonConvert<T> {
	T fromJson(Map<String, dynamic> json) {
		return _getFromJson<T>(runtimeType, this, json);
	}

  Map<String, dynamic> toJson() {
		return _getToJson<T>(runtimeType, this);
  }

  static _getFromJson<T>(Type type, data, json) {
		switch (type) {
			case RegisterEntity:
				return registerEntityFromJson(data as RegisterEntity, json) as T;
			case RegisterSemsterInfo:
				return registerSemsterInfoFromJson(data as RegisterSemsterInfo, json) as T;
			case TeacherEntity:
				return teacherEntityFromJson(data as TeacherEntity, json) as T;
			case TeacherTeachingList:
				return teacherTeachingListFromJson(data as TeacherTeachingList, json) as T;
			case RegisterSubjectEntity:
				return registerSubjectEntityFromJson(data as RegisterSubjectEntity, json) as T;
			case RegisterSubjectListTeacher:
				return registerSubjectListTeacherFromJson(data as RegisterSubjectListTeacher, json) as T;
			case RegisterSubjectListTeacherTeachingList:
				return registerSubjectListTeacherTeachingListFromJson(data as RegisterSubjectListTeacherTeachingList, json) as T;
			case RegisterSubjectListTimelineClass:
				return registerSubjectListTimelineClassFromJson(data as RegisterSubjectListTimelineClass, json) as T;
			case RegisterSubjectListTimelineClassTeacher:
				return registerSubjectListTimelineClassTeacherFromJson(data as RegisterSubjectListTimelineClassTeacher, json) as T;
			case RegisterSubjectListTimelineClassTeacherTeachingList:
				return registerSubjectListTimelineClassTeacherTeachingListFromJson(data as RegisterSubjectListTimelineClassTeacherTeachingList, json) as T;
			case RegisterSubjectListTimelineClassTimeLines:
				return registerSubjectListTimelineClassTimeLinesFromJson(data as RegisterSubjectListTimelineClassTimeLines, json) as T;
			case RegisterSubjectListTimelineClassTimeLinesListSchedule:
				return registerSubjectListTimelineClassTimeLinesListScheduleFromJson(data as RegisterSubjectListTimelineClassTimeLinesListSchedule, json) as T;
			case RegisterSubjectListTimelineClassTimeLinesListScheduleListSession:
				return registerSubjectListTimelineClassTimeLinesListScheduleListSessionFromJson(data as RegisterSubjectListTimelineClassTimeLinesListScheduleListSession, json) as T;
			case RegisterSubjectListTimelineClassTimeLinesListScheduleListSessionEndTime:
				return registerSubjectListTimelineClassTimeLinesListScheduleListSessionEndTimeFromJson(data as RegisterSubjectListTimelineClassTimeLinesListScheduleListSessionEndTime, json) as T;
			case RegisterSubjectListTimelineClassTimeLinesListScheduleListSessionStartTime:
				return registerSubjectListTimelineClassTimeLinesListScheduleListSessionStartTimeFromJson(data as RegisterSubjectListTimelineClassTimeLinesListScheduleListSessionStartTime, json) as T;
			case RegisterSubjectNumberOfLessons:
				return registerSubjectNumberOfLessonsFromJson(data as RegisterSubjectNumberOfLessons, json) as T;
			case RegisterSubjectOptionListBook:
				return registerSubjectOptionListBookFromJson(data as RegisterSubjectOptionListBook, json) as T;
			case RegisterSubjectPrerequisiteSubject:
				return registerSubjectPrerequisiteSubjectFromJson(data as RegisterSubjectPrerequisiteSubject, json) as T;
			case RegisterSubjectRequiredListBook:
				return registerSubjectRequiredListBookFromJson(data as RegisterSubjectRequiredListBook, json) as T;
			case RegisterSubjectSemester:
				return registerSubjectSemesterFromJson(data as RegisterSubjectSemester, json) as T;
			case RegisterSubjectSubject:
				return registerSubjectSubjectFromJson(data as RegisterSubjectSubject, json) as T;
			case ScoreDetailEntity:
				return scoreDetailEntityFromJson(data as ScoreDetailEntity, json) as T;
			case ScoreDetailListScoreDetail:
				return scoreDetailListScoreDetailFromJson(data as ScoreDetailListScoreDetail, json) as T;
			case ChatGroupEntity:
				return chatGroupEntityFromJson(data as ChatGroupEntity, json) as T;
			case UserEntity:
				return userEntityFromJson(data as UserEntity, json) as T;
			case SubjectClassEntity:
				return subjectClassEntityFromJson(data as SubjectClassEntity, json) as T;
			case SubjectClassTeacher:
				return subjectClassTeacherFromJson(data as SubjectClassTeacher, json) as T;
			case SubjectClassTeacherTeachingList:
				return subjectClassTeacherTeachingListFromJson(data as SubjectClassTeacherTeachingList, json) as T;
			case SubjectClassSemester:
				return subjectClassSemesterFromJson(data as SubjectClassSemester, json) as T;    }
		return data as T;
	}

  static _getToJson<T>(Type type, data) {
		switch (type) {
			case RegisterEntity:
				return registerEntityToJson(data as RegisterEntity);
			case RegisterSemsterInfo:
				return registerSemsterInfoToJson(data as RegisterSemsterInfo);
			case TeacherEntity:
				return teacherEntityToJson(data as TeacherEntity);
			case TeacherTeachingList:
				return teacherTeachingListToJson(data as TeacherTeachingList);
			case RegisterSubjectEntity:
				return registerSubjectEntityToJson(data as RegisterSubjectEntity);
			case RegisterSubjectListTeacher:
				return registerSubjectListTeacherToJson(data as RegisterSubjectListTeacher);
			case RegisterSubjectListTeacherTeachingList:
				return registerSubjectListTeacherTeachingListToJson(data as RegisterSubjectListTeacherTeachingList);
			case RegisterSubjectListTimelineClass:
				return registerSubjectListTimelineClassToJson(data as RegisterSubjectListTimelineClass);
			case RegisterSubjectListTimelineClassTeacher:
				return registerSubjectListTimelineClassTeacherToJson(data as RegisterSubjectListTimelineClassTeacher);
			case RegisterSubjectListTimelineClassTeacherTeachingList:
				return registerSubjectListTimelineClassTeacherTeachingListToJson(data as RegisterSubjectListTimelineClassTeacherTeachingList);
			case RegisterSubjectListTimelineClassTimeLines:
				return registerSubjectListTimelineClassTimeLinesToJson(data as RegisterSubjectListTimelineClassTimeLines);
			case RegisterSubjectListTimelineClassTimeLinesListSchedule:
				return registerSubjectListTimelineClassTimeLinesListScheduleToJson(data as RegisterSubjectListTimelineClassTimeLinesListSchedule);
			case RegisterSubjectListTimelineClassTimeLinesListScheduleListSession:
				return registerSubjectListTimelineClassTimeLinesListScheduleListSessionToJson(data as RegisterSubjectListTimelineClassTimeLinesListScheduleListSession);
			case RegisterSubjectListTimelineClassTimeLinesListScheduleListSessionEndTime:
				return registerSubjectListTimelineClassTimeLinesListScheduleListSessionEndTimeToJson(data as RegisterSubjectListTimelineClassTimeLinesListScheduleListSessionEndTime);
			case RegisterSubjectListTimelineClassTimeLinesListScheduleListSessionStartTime:
				return registerSubjectListTimelineClassTimeLinesListScheduleListSessionStartTimeToJson(data as RegisterSubjectListTimelineClassTimeLinesListScheduleListSessionStartTime);
			case RegisterSubjectNumberOfLessons:
				return registerSubjectNumberOfLessonsToJson(data as RegisterSubjectNumberOfLessons);
			case RegisterSubjectOptionListBook:
				return registerSubjectOptionListBookToJson(data as RegisterSubjectOptionListBook);
			case RegisterSubjectPrerequisiteSubject:
				return registerSubjectPrerequisiteSubjectToJson(data as RegisterSubjectPrerequisiteSubject);
			case RegisterSubjectRequiredListBook:
				return registerSubjectRequiredListBookToJson(data as RegisterSubjectRequiredListBook);
			case RegisterSubjectSemester:
				return registerSubjectSemesterToJson(data as RegisterSubjectSemester);
			case RegisterSubjectSubject:
				return registerSubjectSubjectToJson(data as RegisterSubjectSubject);
			case ScoreDetailEntity:
				return scoreDetailEntityToJson(data as ScoreDetailEntity);
			case ScoreDetailListScoreDetail:
				return scoreDetailListScoreDetailToJson(data as ScoreDetailListScoreDetail);
			case ChatGroupEntity:
				return chatGroupEntityToJson(data as ChatGroupEntity);
			case UserEntity:
				return userEntityToJson(data as UserEntity);
			case SubjectClassEntity:
				return subjectClassEntityToJson(data as SubjectClassEntity);
			case SubjectClassTeacher:
				return subjectClassTeacherToJson(data as SubjectClassTeacher);
			case SubjectClassTeacherTeachingList:
				return subjectClassTeacherTeachingListToJson(data as SubjectClassTeacherTeachingList);
			case SubjectClassSemester:
				return subjectClassSemesterToJson(data as SubjectClassSemester);
			}
			return data as T;
		}
  //Go back to a single instance by type
	static _fromJsonSingle<M>( json) {
		String type = M.toString();
		if(type == (RegisterEntity).toString()){
			return RegisterEntity().fromJson(json);
		}
		if(type == (RegisterSemsterInfo).toString()){
			return RegisterSemsterInfo().fromJson(json);
		}
		if(type == (TeacherEntity).toString()){
			return TeacherEntity().fromJson(json);
		}
		if(type == (TeacherTeachingList).toString()){
			return TeacherTeachingList().fromJson(json);
		}
		if(type == (RegisterSubjectEntity).toString()){
			return RegisterSubjectEntity().fromJson(json);
		}
		if(type == (RegisterSubjectListTeacher).toString()){
			return RegisterSubjectListTeacher().fromJson(json);
		}
		if(type == (RegisterSubjectListTeacherTeachingList).toString()){
			return RegisterSubjectListTeacherTeachingList().fromJson(json);
		}
		if(type == (RegisterSubjectListTimelineClass).toString()){
			return RegisterSubjectListTimelineClass().fromJson(json);
		}
		if(type == (RegisterSubjectListTimelineClassTeacher).toString()){
			return RegisterSubjectListTimelineClassTeacher().fromJson(json);
		}
		if(type == (RegisterSubjectListTimelineClassTeacherTeachingList).toString()){
			return RegisterSubjectListTimelineClassTeacherTeachingList().fromJson(json);
		}
		if(type == (RegisterSubjectListTimelineClassTimeLines).toString()){
			return RegisterSubjectListTimelineClassTimeLines().fromJson(json);
		}
		if(type == (RegisterSubjectListTimelineClassTimeLinesListSchedule).toString()){
			return RegisterSubjectListTimelineClassTimeLinesListSchedule().fromJson(json);
		}
		if(type == (RegisterSubjectListTimelineClassTimeLinesListScheduleListSession).toString()){
			return RegisterSubjectListTimelineClassTimeLinesListScheduleListSession().fromJson(json);
		}
		if(type == (RegisterSubjectListTimelineClassTimeLinesListScheduleListSessionEndTime).toString()){
			return RegisterSubjectListTimelineClassTimeLinesListScheduleListSessionEndTime().fromJson(json);
		}
		if(type == (RegisterSubjectListTimelineClassTimeLinesListScheduleListSessionStartTime).toString()){
			return RegisterSubjectListTimelineClassTimeLinesListScheduleListSessionStartTime().fromJson(json);
		}
		if(type == (RegisterSubjectNumberOfLessons).toString()){
			return RegisterSubjectNumberOfLessons().fromJson(json);
		}
		if(type == (RegisterSubjectOptionListBook).toString()){
			return RegisterSubjectOptionListBook().fromJson(json);
		}
		if(type == (RegisterSubjectPrerequisiteSubject).toString()){
			return RegisterSubjectPrerequisiteSubject().fromJson(json);
		}
		if(type == (RegisterSubjectRequiredListBook).toString()){
			return RegisterSubjectRequiredListBook().fromJson(json);
		}
		if(type == (RegisterSubjectSemester).toString()){
			return RegisterSubjectSemester().fromJson(json);
		}
		if(type == (RegisterSubjectSubject).toString()){
			return RegisterSubjectSubject().fromJson(json);
		}
		if(type == (ScoreDetailEntity).toString()){
			return ScoreDetailEntity().fromJson(json);
		}
		if(type == (ScoreDetailListScoreDetail).toString()){
			return ScoreDetailListScoreDetail().fromJson(json);
		}
		if(type == (ChatGroupEntity).toString()){
			return ChatGroupEntity().fromJson(json);
		}
		if(type == (UserEntity).toString()){
			return UserEntity().fromJson(json);
		}
		if(type == (SubjectClassEntity).toString()){
			return SubjectClassEntity().fromJson(json);
		}
		if(type == (SubjectClassTeacher).toString()){
			return SubjectClassTeacher().fromJson(json);
		}
		if(type == (SubjectClassTeacherTeachingList).toString()){
			return SubjectClassTeacherTeachingList().fromJson(json);
		}
		if(type == (SubjectClassSemester).toString()){
			return SubjectClassSemester().fromJson(json);
		}

		return null;
	}

  //list is returned by type
	static M _getListChildType<M>(List data) {
		if(<RegisterEntity>[] is M){
			return data.map<RegisterEntity>((e) => RegisterEntity().fromJson(e)).toList() as M;
		}
		if(<RegisterSemsterInfo>[] is M){
			return data.map<RegisterSemsterInfo>((e) => RegisterSemsterInfo().fromJson(e)).toList() as M;
		}
		if(<TeacherEntity>[] is M){
			return data.map<TeacherEntity>((e) => TeacherEntity().fromJson(e)).toList() as M;
		}
		if(<TeacherTeachingList>[] is M){
			return data.map<TeacherTeachingList>((e) => TeacherTeachingList().fromJson(e)).toList() as M;
		}
		if(<RegisterSubjectEntity>[] is M){
			return data.map<RegisterSubjectEntity>((e) => RegisterSubjectEntity().fromJson(e)).toList() as M;
		}
		if(<RegisterSubjectListTeacher>[] is M){
			return data.map<RegisterSubjectListTeacher>((e) => RegisterSubjectListTeacher().fromJson(e)).toList() as M;
		}
		if(<RegisterSubjectListTeacherTeachingList>[] is M){
			return data.map<RegisterSubjectListTeacherTeachingList>((e) => RegisterSubjectListTeacherTeachingList().fromJson(e)).toList() as M;
		}
		if(<RegisterSubjectListTimelineClass>[] is M){
			return data.map<RegisterSubjectListTimelineClass>((e) => RegisterSubjectListTimelineClass().fromJson(e)).toList() as M;
		}
		if(<RegisterSubjectListTimelineClassTeacher>[] is M){
			return data.map<RegisterSubjectListTimelineClassTeacher>((e) => RegisterSubjectListTimelineClassTeacher().fromJson(e)).toList() as M;
		}
		if(<RegisterSubjectListTimelineClassTeacherTeachingList>[] is M){
			return data.map<RegisterSubjectListTimelineClassTeacherTeachingList>((e) => RegisterSubjectListTimelineClassTeacherTeachingList().fromJson(e)).toList() as M;
		}
		if(<RegisterSubjectListTimelineClassTimeLines>[] is M){
			return data.map<RegisterSubjectListTimelineClassTimeLines>((e) => RegisterSubjectListTimelineClassTimeLines().fromJson(e)).toList() as M;
		}
		if(<RegisterSubjectListTimelineClassTimeLinesListSchedule>[] is M){
			return data.map<RegisterSubjectListTimelineClassTimeLinesListSchedule>((e) => RegisterSubjectListTimelineClassTimeLinesListSchedule().fromJson(e)).toList() as M;
		}
		if(<RegisterSubjectListTimelineClassTimeLinesListScheduleListSession>[] is M){
			return data.map<RegisterSubjectListTimelineClassTimeLinesListScheduleListSession>((e) => RegisterSubjectListTimelineClassTimeLinesListScheduleListSession().fromJson(e)).toList() as M;
		}
		if(<RegisterSubjectListTimelineClassTimeLinesListScheduleListSessionEndTime>[] is M){
			return data.map<RegisterSubjectListTimelineClassTimeLinesListScheduleListSessionEndTime>((e) => RegisterSubjectListTimelineClassTimeLinesListScheduleListSessionEndTime().fromJson(e)).toList() as M;
		}
		if(<RegisterSubjectListTimelineClassTimeLinesListScheduleListSessionStartTime>[] is M){
			return data.map<RegisterSubjectListTimelineClassTimeLinesListScheduleListSessionStartTime>((e) => RegisterSubjectListTimelineClassTimeLinesListScheduleListSessionStartTime().fromJson(e)).toList() as M;
		}
		if(<RegisterSubjectNumberOfLessons>[] is M){
			return data.map<RegisterSubjectNumberOfLessons>((e) => RegisterSubjectNumberOfLessons().fromJson(e)).toList() as M;
		}
		if(<RegisterSubjectOptionListBook>[] is M){
			return data.map<RegisterSubjectOptionListBook>((e) => RegisterSubjectOptionListBook().fromJson(e)).toList() as M;
		}
		if(<RegisterSubjectPrerequisiteSubject>[] is M){
			return data.map<RegisterSubjectPrerequisiteSubject>((e) => RegisterSubjectPrerequisiteSubject().fromJson(e)).toList() as M;
		}
		if(<RegisterSubjectRequiredListBook>[] is M){
			return data.map<RegisterSubjectRequiredListBook>((e) => RegisterSubjectRequiredListBook().fromJson(e)).toList() as M;
		}
		if(<RegisterSubjectSemester>[] is M){
			return data.map<RegisterSubjectSemester>((e) => RegisterSubjectSemester().fromJson(e)).toList() as M;
		}
		if(<RegisterSubjectSubject>[] is M){
			return data.map<RegisterSubjectSubject>((e) => RegisterSubjectSubject().fromJson(e)).toList() as M;
		}
		if(<ScoreDetailEntity>[] is M){
			return data.map<ScoreDetailEntity>((e) => ScoreDetailEntity().fromJson(e)).toList() as M;
		}
		if(<ScoreDetailListScoreDetail>[] is M){
			return data.map<ScoreDetailListScoreDetail>((e) => ScoreDetailListScoreDetail().fromJson(e)).toList() as M;
		}
		if(<ChatGroupEntity>[] is M){
			return data.map<ChatGroupEntity>((e) => ChatGroupEntity().fromJson(e)).toList() as M;
		}
		if(<UserEntity>[] is M){
			return data.map<UserEntity>((e) => UserEntity().fromJson(e)).toList() as M;
		}
		if(<SubjectClassEntity>[] is M){
			return data.map<SubjectClassEntity>((e) => SubjectClassEntity().fromJson(e)).toList() as M;
		}
		if(<SubjectClassTeacher>[] is M){
			return data.map<SubjectClassTeacher>((e) => SubjectClassTeacher().fromJson(e)).toList() as M;
		}
		if(<SubjectClassTeacherTeachingList>[] is M){
			return data.map<SubjectClassTeacherTeachingList>((e) => SubjectClassTeacherTeachingList().fromJson(e)).toList() as M;
		}
		if(<SubjectClassSemester>[] is M){
			return data.map<SubjectClassSemester>((e) => SubjectClassSemester().fromJson(e)).toList() as M;
		}

		throw Exception("not found");
	}

  static M fromJsonAsT<M>(json) {
		if (json is List) {
			return _getListChildType<M>(json);
		} else {
			return _fromJsonSingle<M>(json) as M;
		}
	}
}