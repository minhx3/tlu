import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thanglong_university/app/model/chat/chat.dart';

class ChatDetailController extends GetxController {
  FocusNode focusNode;
  final crud = Get.put(ChatCrud());
  final _hasFocus = false.obs;
  bool get hasFocus => _hasFocus.value;
  final TextEditingController tec = TextEditingController();
  final list = <Chat>[].obs;

  final ScrollController scrollController = ScrollController();

  @override
  void onClose() {
    scrollController?.dispose();
    _listWorker?.dispose();
    super.onClose();
  }

  listOnChange(List<Chat> val) {
    list.stream.handleError((onError) {});
    if (val.isEmpty) {
    } else if (list.stream == null) {
    } else {}
  }

  Worker _listWorker;
  @override
  void onInit() {
    list.bindStream(crud.chatStream());
    _listWorker = ever(list, listOnChange);
    focusNode = FocusNode()
      ..addListener(() {
        _hasFocus(focusNode.hasFocus);
      });
    super.onInit();
  }

  final _loading = false.obs;
  bool get loading => _loading.value;

  final _error = ''.obs;
  String get error => _error.value;

  Future<void> sendMessege(BuildContext context) async {
    try {
      FocusScope.of(context).unfocus();
      await crud.addchat(
        chat: Chat(
          uidFrom: '_authController.currentUser.uid',
          messege: tec.text,
        ),
      );
      tec.clear();
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: 500.milliseconds,
        curve: Curves.easeIn,
      );
    } catch (e) {
      list.add(
        Chat(
          id: 'ERRORID',
          dateCreated: Timestamp.now(),
          uidFrom: '_authController.currentUser.uid',
          messege: e.toString(),
        ),
      );
      _loading(false);
    }
  }
}
