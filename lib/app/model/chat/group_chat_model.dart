import 'package:thanglong_university/app/model/chat/subject_class_entity.dart';

import 'chat.dart';

class GroupChatModel {
  String subjectClassId;
  String subjectClassName;
  String subjectId;
  String title;
  Chat latestMessage;
  int badge;
  SubjectClassTeacher teacher;

  GroupChatModel(
      {this.subjectClassId,
      this.subjectClassName,
      this.subjectId,
      this.title,
      this.latestMessage,
      this.badge,
      this.teacher});
}
