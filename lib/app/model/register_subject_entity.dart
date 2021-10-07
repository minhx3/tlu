import 'package:thanglong_university/app/enums/subject_class_status.dart';
import 'package:thanglong_university/app/model/chat_group_entity.dart';
import 'package:thanglong_university/app/model/teacher_model.dart';
import 'package:thanglong_university/generated/json/base/json_convert_content.dart';
import 'package:thanglong_university/generated/json/base/json_field.dart';

class RegisterSubjectEntity with JsonConvert<RegisterSubjectEntity> {
  String closeRgister;
  String openRegister;
  @JSONField(serialize: false, deserialize: false)
  SubjectClassStatusEnum status;
  String examConditions;
  int haveRegistered;
  String id;
  String transciptId;
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

  RegisterSubjectEntity(
      {this.closeRgister,
      this.openRegister,
      this.status,
      this.examConditions,
      this.haveRegistered,
      this.id,
      this.transciptId,
      this.name,
      this.isHasGreatExercise,
      this.isOnline,
      this.group,
      this.listTeacher,
      this.listTimelineClass,
      this.note,
      this.numberOfLessons,
      this.optionListBook,
      this.population,
      this.prerequisiteSubject,
      this.requiredListBook,
      this.schoolFee,
      this.scoringMethod,
      this.semester,
      this.subject});

  List<ChatGroupEntity> get getListSubject {
    return listTeacher
        .map((e) => e.teachingList.map((e1) {
              return ChatGroupEntity(
                  id: '${id}_${e.id}_${e1.id}', name: e1.name, sbId: e.id);
            }))
        .expand((e2) => e2)
        .toList();
  }

  String get getAllTime {
    return listTimelineClass
        .map((e) => e.listSchedule.map((e) => e.getTime).join(' - '))
        .join('\n');
  }

  factory RegisterSubjectEntity.fromJson(Map<String, dynamic> json) =>
      RegisterSubjectEntity(
        id: json["id"] == null ? null : json["id"],
        semester: json["semester"] == null
            ? null
            : RegisterSubjectSemester().fromJson(json['semester']),
        examConditions:
            json["examConditions"] == null ? null : json["examConditions"],
        isHasGreatExercise: json["isHasGreatExercise"] == null
            ? null
            : json["isHasGreatExercise"],
        isOnline: json["isOnline"] == null ? null : json["isOnline"],
        population: json["population"] == null ? null : json["population"],
        status: json["status"] == null
            ? null
            : subjectClassStatus.map[json["status"]],
        schoolFee: json["schoolFee"] == null ? null : json["schoolFee"],
        scoringMethod:
            json["scoringMethod"] == null ? null : json["scoringMethod"],
        note: json["note"] == null ? null : json["note"],
        listTimelineClass: json["listTimelineClass"] == null
            ? null
            : (json['listTimelineClass'] as List)
                .map((v) =>
                    RegisterSubjectListTimelineClassTimeLines.fromJson(v))
                .toList(),
        numberOfLessons: json["numberOfLessons"] == null
            ? null
            : (json['numberOfLessons'] as List)
                .map((v) => RegisterSubjectNumberOfLessons().fromJson(v))
                .toList(),
        optionListBook: json["optionListBook"] == null
            ? null
            : (json['optionListBook'] as List)
                .map((v) => RegisterSubjectOptionListBook().fromJson(v))
                .toList(),
        prerequisiteSubject: json["prerequisiteSubject"] == null
            ? null
            : RegisterSubjectPrerequisiteSubject()
                .fromJson(json['prerequisiteSubject']),
        requiredListBook: json["requiredListBook"] == null
            ? null
            : (json['requiredListBook'] as List)
                .map((v) => RegisterSubjectRequiredListBook().fromJson(v))
                .toList(),
        subject: json["subject"] == null
            ? null
            : RegisterSubjectSubject().fromJson(json['subject']),
        haveRegistered:
            json["haveRegistered"] == null ? null : json["haveRegistered"],
        closeRgister: json["closeRgister"],
        group: json["group"],
        listTeacher: json["listTeacher"] == null
            ? null
            : List<Teacher>.from(
                json["listTeacher"].map((e) => Teacher.fromJson(e))),
        name: json["name"],
        openRegister: json["openRegister"],
        transciptId: json["transciptId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "semester": semester == null ? null : semester.toJson(),
        "examConditions": examConditions == null ? null : examConditions,
        "isHasGreatExercise":
            isHasGreatExercise == null ? null : isHasGreatExercise,
        "isOnline": isOnline == null ? null : isOnline,
        "population": population == null ? null : population,
        "status": status == null ? null : status,
        "schoolFee": schoolFee == null ? null : schoolFee,
        "scoringMethod": scoringMethod == null ? null : scoringMethod,
        "note": note == null ? null : note,
        "listTimelineClass": listTimelineClass == null
            ? null
            : List<dynamic>.from(listTimelineClass.map((x) => x.toJson())),
        "numberOfLessons": numberOfLessons == null
            ? null
            : List<dynamic>.from(numberOfLessons.map((x) => x.toJson())),
        "optionListBook": optionListBook == null
            ? null
            : List<dynamic>.from(optionListBook.map((x) => x.toJson())),
        "prerequisiteSubject":
            prerequisiteSubject == null ? null : prerequisiteSubject.toJson(),
        "requiredListBook": requiredListBook == null
            ? null
            : List<dynamic>.from(requiredListBook.map((x) => x.toJson())),
        "subject": subject == null ? null : subject.toJson(),
        "haveRegistered": haveRegistered == null ? null : haveRegistered,
        "listTeacher": listTeacher == null
            ? null
            : List<dynamic>.from(listTeacher.map((x) => x.toJson())),
        "closeRgister": closeRgister,
        "group": group,
        "name": name,
        "openRegister": openRegister,
        "transciptId": transciptId,
      };
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

  RegisterSubjectListTimelineClass({this.code, this.timeLines, this.teacher});

  String get getAllTime {
    return timeLines.map((e) => e.listSchedule.map((e) => e.getTime)).join(',');
  }

  factory RegisterSubjectListTimelineClass.fromJson(
          Map<String, dynamic> json) =>
      RegisterSubjectListTimelineClass(
        code: json["code"] == null ? null : json["code"],
        teacher:
            json["teacher"] == null ? null : Teacher.fromJson(json['teacher']),
        timeLines: json["timeLines"] == null
            ? null
            : (json['timeLines'] as List)
                .map((v) =>
                    RegisterSubjectListTimelineClassTimeLines.fromJson(v))
                .toList(),
      );
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
  bool isExerciseClass;
  @JSONField(myModel: true)
  Teacher teacher;

  RegisterSubjectListTimelineClassTimeLines(
      {this.id,
      this.fromDate,
      this.listSchedule,
      this.toDate,
      this.isExerciseClass,
      this.teacher});

  String get getAllTime {
    return listSchedule.map((e) => e.getTime).join(',');
  }

  String get getAllTimeToolTip {
    return listSchedule.map((e) => e.getTimeName).join(',');
  }

  factory RegisterSubjectListTimelineClassTimeLines.fromJson(
          Map<String, dynamic> json) =>
      RegisterSubjectListTimelineClassTimeLines(
        id: json["id"] == null ? null : json["id"],
        fromDate: json["fromDate"] == null ? null : json["fromDate"],
        toDate: json["toDate"] == null ? null : json["toDate"],
        isExerciseClass:
            json["isExerciseClass"] == null ? null : json["isExerciseClass"],
        teacher:
            json["teacher"] == null ? null : Teacher.fromJson(json['teacher']),
        listSchedule: json["listSchedule"] == null
            ? null
            : (json['listSchedule'] as List)
                .map((v) =>
                    RegisterSubjectListTimelineClassTimeLinesListSchedule()
                        .fromJson(v))
                .toList(),
      );
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
