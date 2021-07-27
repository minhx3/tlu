import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:thanglong_university/app/model/chat/chat.dart';
import 'package:thanglong_university/app/model/chat/subject_class_entity.dart';
import 'package:thanglong_university/app/model/chat/user_entity.dart';
import 'package:thanglong_university/app/modules/profile/controllers/profile_controller.dart';
import 'package:thanglong_university/app/service/api/app_client.dart';
import 'package:thanglong_university/app/service/notification.dart';

class ChatDetailController extends GetxController {
  FocusNode focusNode;
  final crud = Get.find<ChatCrud>();
  final _hasFocus = false.obs;

  RxList<UserEntity> u = RxList();

  bool get hasFocus => _hasFocus.value;
  final TextEditingController tec = TextEditingController();
  final list = <Chat>[].obs;

  final ScrollController scrollController = ScrollController();

  SubjectClassEntity cg = Get.arguments;

  Rx<Chat> messageReply = Rx();

  @override
  void onClose() {
    scrollController?.dispose();
    super.onClose();
  }

  @override
  void onInit() async {
    await FirebaseMessaging.instance.subscribeToTopic(cg.groupId);
    list.bindStream(crud.chatStream(cg.groupId));
    focusNode = FocusNode()
      ..addListener(() {
        _hasFocus(focusNode.hasFocus);
        Future.delayed(Duration(milliseconds: 250))
            .whenComplete(() => scrollController.animateTo(
                  scrollController.position.minScrollExtent,
                  duration: 200.milliseconds,
                  curve: Curves.fastLinearToSlowEaseIn,
                ));
      });
    super.onInit();
    getListUser();
  }

  final _loading = false.obs;

  bool get loading => _loading.value;

  final _error = ''.obs;

  String get error => _error.value;

  void getListUser() async {
    List<UserEntity> res = await Appclient.shared.getUserList(cg.groupId);
    UserEntity tec = UserEntity(
        id: cg.teacher.id,
        isTeacher: true,
        name: cg.teacher.fullName,
        mobile: cg.teacher.mobile,
        email: cg.teacher.email,
        avatar: cg.teacher.avatar,
        faculty: cg.teacher.faculty,
        teachingList: cg.teacher.teachingList);
    u([tec, ...res]);
  }

  Future<void> sendMessage(BuildContext context) async {
    try {
      String uidFrom = ProfileController.to.myUserId;
      await crud.sendNewChat(
          chat: Chat(
              type: getType(),
              replyId: messageReply()?.id,
              replyText: messageReply()?.text,
              replyUserId: messageReply()?.uidFrom,
              uidFrom: uidFrom,
              text: tec.text,
              badge: 0),
          groupId: cg.groupId,
          listUser: u());
      await NotificationFCB.instance.sendNotificationMessageToPeerUser(
          unReadMSGCount: 0,
          messageType: getType(),
          textFromTextField: tec.text,
          myName: 'Leo Messi',
          chatroomId: cg.groupId,
          myImageUrl: '');

      cleanMessage();
      tec.clear();
      scrollController.animateTo(
        scrollController.position.minScrollExtent,
        duration: 500.milliseconds,
        curve: Curves.easeIn,
      );
    } catch (e) {
      list.add(
        Chat(
          id: 'ERRORID',
          dateCreated: Timestamp.now(),
          uidFrom: ProfileController.to.myUserId,
          text: e.toString(),
        ),
      );
      _loading(false);
    }
  }

  void selectMessage(Chat message) {
    messageReply(message);
    focusNode.requestFocus();
  }

  String getType() {
    String type = 'raw';
    if (messageReply() != null) {
      type = 'reply';
    }
    return type;
  }

  void cleanMessage() {
    if (messageReply() != null) {
      messageReply.value = null;
    }
  }

  UserEntity getUserById(id) {
    return u().firstWhere((element) => element.id == id, orElse: () => null);
  }
}
