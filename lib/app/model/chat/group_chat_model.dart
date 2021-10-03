import 'chat.dart';

class GroupChatModel {
  String subjectClassId;
  String subjectClassName;
  String subjectId;
  String title;
  Chat latestMessage;
  int badge;

  GroupChatModel(
      {this.subjectClassId,
      this.subjectClassName,
      this.subjectId,
      this.title,
      this.latestMessage,
      this.badge});
}