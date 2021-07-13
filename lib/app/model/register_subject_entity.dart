import 'package:thanglong_university/generated/json/base/json_convert_content.dart';

class RegisterSubjectEntity with JsonConvert<RegisterSubjectEntity> {
	String closeRgister;
	String openRegister;
	String status;
	String examCnditions;
	int haveRegistered;
	String id;
	bool isHasGreatExercise;
	bool isOnline;
	String group;
	List<RegisterSubjectListTeacher> listTeacher;
	List<RegisterSubjectListTimelineClass> listTimelineClass;
	String note;
	List<RegisterSubjectNumberOfLessons> numberOfLessons;
	List<RegisterSubjectOptionListBook> optionListBook;
	int population;
	RegisterSubjectPrerequisiteSubject prerequisiteSubject;
	List<RegisterSubjectRequiredListBook> requiredListBook;
	int schoolFee;
	String scoringMethod;
	RegisterSubjectSemester semester;
	RegisterSubjectSubjectId subjectId;
}

class RegisterSubjectListTeacher with JsonConvert<RegisterSubjectListTeacher> {
	String avatar;
	String degree;
	String dob;
	String email;
	String fullName;
	String id;
	String mobile;
	List<RegisterSubjectListTeacherTeachingList> teachingList;
}

class RegisterSubjectListTeacherTeachingList with JsonConvert<RegisterSubjectListTeacherTeachingList> {
	int credits;
	String description;
	double factor;
	String id;
	String name;
	String porpose;
	String type;
}

class RegisterSubjectListTimelineClass with JsonConvert<RegisterSubjectListTimelineClass> {
	String code;
	RegisterSubjectListTimelineClassTeacher teacher;
	List<RegisterSubjectListTimelineClassTimeLines> timeLines;

	String get getAllTime{
		// return timeLines.map((e) => e.listSchedule.getTime)
	}
}

class RegisterSubjectListTimelineClassTeacher with JsonConvert<RegisterSubjectListTimelineClassTeacher> {
	String avatar;
	String degree;
	String dob;
	String email;
	String fullName;
	String id;
	String mobile;
	List<RegisterSubjectListTimelineClassTeacherTeachingList> teachingList;
}

class RegisterSubjectListTimelineClassTeacherTeachingList with JsonConvert<RegisterSubjectListTimelineClassTeacherTeachingList> {
	int credits;
	String description;
	double factor;
	String id;
	String name;
	String porpose;
	String type;
}

class RegisterSubjectListTimelineClassTimeLines with JsonConvert<RegisterSubjectListTimelineClassTimeLines> {
	String fromDate;
	String id;
	List<RegisterSubjectListTimelineClassTimeLinesListSchedule> listSchedule;
	String toDate;
}

List dayOfWeekToName = ['CN','T2','T3','T4','T5','T6','T7'];

class RegisterSubjectListTimelineClassTimeLinesListSchedule with JsonConvert<RegisterSubjectListTimelineClassTimeLinesListSchedule> {
	String address;
	int dayOfWeek;
	List<RegisterSubjectListTimelineClassTimeLinesListScheduleListSession> listSession;
	String note;

	String get getTime {
		String ses = listSession.map((e)=>e.id.replaceAll('ses', '')).join('-');
		return '${dayOfWeekToName[dayOfWeek]}, $ses';
}
}

class RegisterSubjectListTimelineClassTimeLinesListScheduleListSession with JsonConvert<RegisterSubjectListTimelineClassTimeLinesListScheduleListSession> {
	int durationMinus;
	RegisterSubjectListTimelineClassTimeLinesListScheduleListSessionEndTime endTime;
	String id;
	String name;
	RegisterSubjectListTimelineClassTimeLinesListScheduleListSessionStartTime startTime;



}

class RegisterSubjectListTimelineClassTimeLinesListScheduleListSessionEndTime with JsonConvert<RegisterSubjectListTimelineClassTimeLinesListScheduleListSessionEndTime> {
	int hours;
	int minutes;
	int seconds;
}

class RegisterSubjectListTimelineClassTimeLinesListScheduleListSessionStartTime with JsonConvert<RegisterSubjectListTimelineClassTimeLinesListScheduleListSessionStartTime> {
	int hours;
	int minutes;
	int seconds;
}

class RegisterSubjectNumberOfLessons with JsonConvert<RegisterSubjectNumberOfLessons> {
	int quanlity;
	String type;
}

class RegisterSubjectOptionListBook with JsonConvert<RegisterSubjectOptionListBook> {
	String author;
	String id;
	String link;
	String name;
	String publishingYear;
}

class RegisterSubjectPrerequisiteSubject with JsonConvert<RegisterSubjectPrerequisiteSubject> {
	int credits;
	String description;
	int factor;
	String id;
	String name;
	String porpose;
	String type;
}

class RegisterSubjectRequiredListBook with JsonConvert<RegisterSubjectRequiredListBook> {
	String author;
	String id;
	String link;
	String name;
	String publishingYear;
}

class RegisterSubjectSemester with JsonConvert<RegisterSubjectSemester> {
	String endTime;
	String id;
	String name;
	String startTime;
}

class RegisterSubjectSubjectId with JsonConvert<RegisterSubjectSubjectId> {
	int credits;
	String description;
	double factor;
	String id;
	String name;
	String porpose;
	String type;
}
