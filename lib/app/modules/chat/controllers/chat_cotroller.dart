import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:thanglong_university/app/model/chat/chat.dart';
import 'package:thanglong_university/app/model/chat/group_chat_model.dart';
import 'package:thanglong_university/app/model/chat/subject_class_entity.dart';
import 'package:thanglong_university/app/model/schedule_teacher_model.dart';
import 'package:thanglong_university/app/service/api/app_client.dart';
import 'package:thanglong_university/app/service/storage/storage.dart';

class ChatController extends GetxController {
  RxList<GroupChatModel> group = RxList();
  RxList<GroupChatModel> groupArchive = RxList();
  final listLastMessage = <Chat>[].obs;
  RxBool showArchive = RxBool(false);

  List<GroupChatModel> get getGroupWithBadge {
    return group().map((e) {
      Chat c = listLastMessage.firstWhere(
          (element) => element.id == e.subjectClassId,
          orElse: () => null);
      if (c != null) {
        e.latestMessage = c;
      }
      return e;
    }).toList()
      ..sort((a, b) {
        Timestamp ta = a?.latestMessage?.dateCreated;
        Timestamp tb = b?.latestMessage?.dateCreated;
        if (ta == null) {
          return 1;
        }
        if (tb == null) {
          return -1;
        }
        return tb.compareTo(ta);
      });
  }

  Map<String, List<GroupChatModel>> get groupTeacherWithBadge {
    return groupBy(getGroupWithBadge, (e) => e.subjectClassName);
  }

  @override
  void onInit() {
    super.onInit();
    getGroup();
    getGroupArchive();
  }

  @override
  void onReady() {
    super.onReady();
    listLastMessage.bindStream(ChatCrud.instance.chatUserStream(getUserId));
  }

  getGroup() async {
    try {
      if (isTeacher) {
        List<ScheduleTeacherModel> resTeacher =
            await Appclient.shared.getScheduleTeacherList();
        group(resTeacher
            .map((e) => GroupChatModel(
                  subjectClassId: e.subjectClassId,
                  subjectClassName: e.subjectClassName,
                ))
            .toList());
        return;
      }
      List<SubjectClassEntity> res =
          await Appclient.shared.getSubjectClassList(true);
      group(res
          .map((e) =>
              GroupChatModel(subjectClassId: e.id, subjectClassName: e.name))
          .toList());

      // ignore: unused_catch_clause
    } on Exception catch (e) {} finally {}
  }

  getGroupArchive() async {
    // showArchive.toggle();
    // if (showArchive.isTrue) {
    //   return;
    // }
    try {
      List<SubjectClassEntity> res =
          await Appclient.shared.getSubjectClassList(false);
      groupArchive(res.map((e) => GroupChatModel()).toList());
    } on Exception catch (e) {} finally {}
  }
}
