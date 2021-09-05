// @dart=2.9

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thanglong_university/app/model/chat/chat.dart';
import 'package:thanglong_university/app/model/chat/subject_class_entity.dart';
import 'package:thanglong_university/app/model/chat/user_entity.dart';
import 'package:thanglong_university/app/service/api/app_client.dart';
import 'package:thanglong_university/app/service/notification.dart';
import 'package:thanglong_university/app/service/storage/storage.dart';
import 'package:tiengviet/tiengviet.dart';

class ChatDetailController extends GetxController {
  FocusNode focusNode;
  final _hasFocus = false.obs;

  RxList<UserEntity> u = RxList();
  RxList<UserEntity> uf = RxList();

  bool get hasFocus => _hasFocus.value;
  final TextEditingController tec = TextEditingController();
  final TextEditingController searchCtrl = TextEditingController();
  final list = <Chat>[].obs;
  final showAttachment = true.obs;
  final showEmoij = false.obs;

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
    super.onInit();

    await FirebaseMessaging.instance.subscribeToTopic(cg.groupId);
    list.bindStream(ChatCrud.instance.chatStream(cg.groupId));
    focusNode = FocusNode()
      ..addListener(() {
        _hasFocus(focusNode.hasFocus);
        showAttachment(focusNode.hasFocus);
        Future.delayed(Duration(milliseconds: 250))
            .whenComplete(() => scrollController.animateTo(
                  scrollController.position.minScrollExtent,
                  duration: 200.milliseconds,
                  curve: Curves.fastLinearToSlowEaseIn,
                ));
      });
  }

  final _loading = false.obs;

  bool get loading => _loading.value;

  final _error = ''.obs;

  String get error => _error.value;

  void getListUser() async {
    List<UserEntity> res = await Appclient.shared.getUserList(cg.groupId);
    UserEntity tec = UserEntity(
        id: cg.teacher?.id,
        isTeacher: true,
        name: cg.teacher.fullName,
        mobile: cg.teacher.mobile,
        email: cg.teacher.email,
        avatar: cg.teacher.avatar,
        faculty: cg.teacher.faculty,
        teachingList: cg.teacher.teachingList);
    u([tec, ...res]);
    uf([tec, ...res]);
  }

  Future<void> sendMessage({String img, String file, String fileName}) async {
    if (tec.text.isEmpty && img == null && file == null) {
      return;
    }
    try {
      String uidFrom = getUserId;
      await ChatCrud.instance.sendNewChat(
          chat: Chat(
              type: file != null ? 'attachment' : getType(),
              replyId: messageReply()?.id,
              replyText: messageReply()?.text,
              replyUserId: messageReply()?.uidFrom,
              uidFrom: uidFrom,
              text: fileName != null ? fileName : tec.text,
              file: file,
              img: img,
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
          uidFrom: getUserId,
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
    return u().firstWhere((element) => element?.id == id, orElse: () => null);
  }

  Future<PickedFile> pickFile(
      {ImageSource source = ImageSource.gallery,
      double maxWidth = 600,
      double maxHeight = 600,
      int quality = 70}) async {
    try {
      final ImagePicker _picker = ImagePicker();
      if (source == ImageSource.camera) {
        return _picker.getImage(source: source);
      } else {
        return _picker.getImage(
          source: source,
          maxWidth: maxWidth,
          maxHeight: maxHeight,
          imageQuality: quality,
        );
      }
    } catch (e) {
      print(e);
    }
  }

  sendImg(source) async {
    try {
      PickedFile file = await pickFile(source: source);
      var url = await Appclient.shared.uploadFile(file);
      sendMessage(img: url);
      return url.toString();
    } on Exception catch (e) {
      print(e);
      // TODO
    }
  }

  sendFile() async {
    try {
      FilePickerResult file = await FilePicker.platform.pickFiles();
      if (file != null) {
        var url = await Appclient.shared.uploadFile(file?.files?.first);
        sendMessage(file: url, fileName: file?.files?.first?.name);
      } else {
        // User canceled the picker
      }
    } on Exception catch (e) {
      print(e);
      // TODO
    }
  }

  filterList() {
    String keyword = searchCtrl.text;
    if (u.isEmpty || keyword.isEmpty) return;

    String search = TiengViet.parse(keyword).toLowerCase();
    var data = u.where((trans) {
      String title = TiengViet.parse(trans.name).toLowerCase();
      return title.contains(search);
    }).toList();

    uf(data);
  }
}
