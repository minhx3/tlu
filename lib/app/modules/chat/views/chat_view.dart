import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';
import 'package:thanglong_university/app/modules/chat/controllers/chat_cotroller.dart';
import 'package:thanglong_university/app/modules/chat/views/chat_list_student.dart';
import 'package:thanglong_university/app/routes/app_pages.dart';
import 'package:thanglong_university/app/views/views/app_bar_view.dart';

import 'item_group_chat_by_subject_view.dart';

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
          Expanded(
              child: Obx(() => ListView.separated(
                    padding: EdgeInsets.zero,
                    itemBuilder: (c, index) {
                      return ItemGroupChatBySubjectView(
                        onPressed: () {
                          pushTo(Routes.CHAT_DETAIL);
                        },
                      );
                    },
                    itemCount: controller.group.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        thickness: 1,
                        indent: 12,
                        endIndent: 12,
                        color: AppColor.lineColor,
                      );
                    },
                  )))
        ]));
  }
}
