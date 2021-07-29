import 'package:thanglong_university/app/model/chat_group_entity.dart';
import 'package:thanglong_university/app/model/teacher_model.dart';
import 'package:thanglong_university/generated/json/base/json_convert_content.dart';
import 'package:thanglong_university/generated/json/base/json_field.dart';

class RegisterSubjectEntity with JsonConvert<RegisterSubjectEntity> {
  String closeRgister;
  String openRegister;
  String status;
  String examConditions;
  int haveRegistered;
  String id;
  String name;
  bool isHasGreatExercise;
  bool isOnline;
  String group;
  @JSONField(myModel: true)
  List<Teacher> listTeacher;
  List<RegisterSubjectListTimelineClassTimeLines> listTimelineClass;
  String note;
  List<RegisterSubjectNumberOfLessons> numberOfLessons;
  List<RegisterSubjectOptionListBook> optionListBook;
  int population;
  RegisterSubjectPrerequisiteSubject prerequisiteSubject;
  List<RegisterSubjectRequiredListBook> requiredListBook;
  int schoolFee;
  String scoringMethod;
  RegisterSubjectSemester semester;
  RegisterSubjectSubject subject;

  List<ChatGroupEntity> get getListSubject {
    return listTeacher
        .map((e) => e.teachingList.map((e1) {
              return ChatGroupEntity(
                  id: '${id}_${e.id}_${e1.id}', name: e1.name, sbId: e.id);
            }))
        .expand((e2) => e2)
        .toList();
  }
}

@deprecated
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

@deprecated
class RegisterSubjectListTeacherTeachingList
    with JsonConvert<RegisterSubjectListTeacherTeachingList> {
  int credits;
  String description;
  double factor;
  String id;
  String name;
  String porpose;
  String type;
}

class RegisterSubjectListTimelineClass
    with JsonConvert<RegisterSubjectListTimelineClass> {
  String code;
  @JSONField(myModel: true)
  Teacher teacher;
  List<RegisterSubjectListTimelineClassTimeLines> timeLines;

  String get getAllTime {
    return timeLines.map((e) => e.listSchedule.map((e) => e.getTime)).join(',');
  }
}

@deprecated
class RegisterSubjectListTimelineClassTeacher
    with JsonConvert<RegisterSubjectListTimelineClassTeacher> {
  String avatar;
  String degree;
  String dob;
  String email;
  String fullName;
  String id;
  String mobile;
  @JSONField(myModel: true)
  List<TeachingList> teachingList;
}

@deprecated
class RegisterSubjectListTimelineClassTeacherTeachingList
    with JsonConvert<RegisterSubjectListTimelineClassTeacherTeachingList> {
  int credits;
  String description;
  double factor;
  String id;
  String name;
  String porpose;
  String type;
}

class RegisterSubjectListTimelineClassTimeLines
    with JsonConvert<RegisterSubjectListTimelineClassTimeLines> {
  String fromDate;
  String id;
  List<RegisterSubjectListTimelineClassTimeLinesListSchedule> listSchedule;
  String toDate;
  @JSONField(myModel: true)
  Teacher teacher;

  String get getAllTime {
    return listSchedule.map((e) => e.getTime).join(',');
  }

  String get getAllTimeToolTip {
    return listSchedule.map((e) => e.getTimeName).join(',');
  }
}

List dayOfWeekToName = ['CN', 'T2', 'T3', 'T4', 'T5', 'T6', 'T7'];

class RegisterSubjectListTimelineClassTimeLinesListSchedule
    with JsonConvert<RegisterSubjectListTimelineClassTimeLinesListSchedule> {
  String address;
  int dayOfWeek;
  List<RegisterSubjectListTimelineClassTimeLinesListScheduleListSession>
      listSession;
  String note;

  String get getTime {
    String ses = listSession
        .map((e) => e.name.toLowerCase().replaceAll('tiết ', ''))
        .join('-');
    return '${dayOfWeekToName[dayOfWeek]}, $ses';
  }

  String get getTimeName {
    String ses = listSession.map((e) => e.name).join('-');
    return '${dayOfWeekToName[dayOfWeek]}, $ses';
  }
}

class RegisterSubjectListTimelineClassTimeLinesListScheduleListSession
    with
        JsonConvert<
            RegisterSubjectListTimelineClassTimeLinesListScheduleListSession> {
  int durationMinus;
  RegisterSubjectListTimelineClassTimeLinesListScheduleListSessionEndTime
      endTime;
  String id;
  String name;
  RegisterSubjectListTimelineClassTimeLinesListScheduleListSessionStartTime
      startTime;
}

class RegisterSubjectListTimelineClassTimeLinesListScheduleListSessionEndTime
    with
        JsonConvert<
            RegisterSubjectListTimelineClassTimeLinesListScheduleListSessionEndTime> {
  int hours;
  int minutes;
  int seconds;
}

class RegisterSubjectListTimelineClassTimeLinesListScheduleListSessionStartTime
    with
        JsonConvert<
            RegisterSubjectListTimelineClassTimeLinesListScheduleListSessionStartTime> {
  int hours;
  int minutes;
  int seconds;
}

class RegisterSubjectNumberOfLessons
    with JsonConvert<RegisterSubjectNumberOfLessons> {
  int quanlity;
  String type;
}

class RegisterSubjectOptionListBook
    with JsonConvert<RegisterSubjectOptionListBook> {
  String author;
  String id;
  String link;
  String name;
  String publishingYear;
}

class RegisterSubjectPrerequisiteSubject
    with JsonConvert<RegisterSubjectPrerequisiteSubject> {
  int credits;
  String description;
  int factor;
  String id;
  String name;
  String porpose;
  String type;
}

class RegisterSubjectRequiredListBook
    with JsonConvert<RegisterSubjectRequiredListBook> {
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

class RegisterSubjectSubject with JsonConvert<RegisterSubjectSubject> {
  int credits;
  String description;
  double factor;
  String id;
  String name;
  String porpose;
  String type;
}
