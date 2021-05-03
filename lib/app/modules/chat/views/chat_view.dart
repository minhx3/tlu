import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/modules/chat/controllers/chat_cotroller.dart';
import 'package:thanglong_university/app/modules/chat/views/chat_list_student.dart';
import 'package:thanglong_university/app/views/views/app_bar_view.dart';

class ChatView extends GetView<ChatController> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColor.chatBackground,
        child: Column(children: [
          AppBarView(
            automaticallyImplyLeading: false,
            type: AppBarType.chat,
            title: "Chat",
          ),
          Expanded(child: ChatListStudentView())
        ]));
  }
}
