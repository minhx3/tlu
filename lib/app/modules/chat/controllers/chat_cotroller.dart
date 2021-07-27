import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:thanglong_university/app/model/chat/chat.dart';
import 'package:thanglong_university/app/model/chat/subject_class_entity.dart';
import 'package:thanglong_university/app/modules/profile/controllers/profile_controller.dart';
import 'package:thanglong_university/app/service/api/app_client.dart';

class ChatController extends GetxController {
  final crud = Get.put(ChatCrud());

  RxList<SubjectClassEntity> group = RxList();
  final list = <Chat>[].obs;

  List<SubjectClassEntity> get getGroupWithBadge {
    List<Chat> latestChat = ProfileController.to.listUserChat;

    return group().map((e) {
      Chat c = latestChat.firstWhere((element) => element.id == e.groupId,
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

  @override
  void onInit() {
    super.onInit();
    getGroup();
  }

  @override
  void onReady() {
    super.onReady();
    // String myUserId = ProfileController.to.myUserId;
    // print(myUserId);
    // list.bindStream(crud.chatUserStream(myUserId));
  }

  getGroup() async {
    try {
      List<SubjectClassEntity> res =
          await Appclient.shared.getSubjectClassList(true);
      group(res);
    } on Exception catch (e) {} finally {}
  }
}
