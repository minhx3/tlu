import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';
import 'package:thanglong_university/app/model/chat/chat.dart';
import 'package:thanglong_university/app/model/chat/group_chat_model.dart';
import 'package:thanglong_university/app/model/chat/subject_class_entity.dart';
import 'package:thanglong_university/app/modules/chat/controllers/chat_cotroller.dart';
import 'package:thanglong_university/app/modules/chat/views/chat_list_teacher.dart';
import 'package:thanglong_university/app/routes/app_pages.dart';
import 'package:thanglong_university/app/views/views/app_bar_view.dart';
import 'package:thanglong_university/app/views/views/button_view.dart';

import 'chat_list_student.dart';
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
          Expanded(child: ChatListTeacherView(controller))
        ]));
  }
}

class ChatListStudent extends StatelessWidget {
  const ChatListStudent({
    Key key,
    @required this.controller,
  }) : super(key: key);

  final ChatController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        shrinkWrap: true,
        children: [
          Obx(() => ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (c, index) {
                  GroupChatModel g = controller.getGroupWithBadge[index];
                  return ItemGroupChatBySubjectView(
                    item: g,
                    onPressed: () {
                      ChatCrud.instance.userViewMessage(g.subjectClassId);
                      pushTo(Routes.CHAT_DETAIL, arguments: g);
                    },
                  );
                },
                itemCount: controller.getGroupWithBadge.length,
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    thickness: 1,
                    indent: 20,
                    endIndent: 20,
                    color: AppColor.lineColor,
                  );
                },
              )),
          Obx(() => ButtonView(
                type: ButtonType.outline,
                verticalSpacing: 12,
                horizontalSpacing: 20,
                title: controller.showArchive.isTrue
                    ? 'Ẩn lưu trữ'
                    : 'Xem lưu trữ',
                onTap: () {
                  controller.showArchive.toggle();
                },
              )),
          Obx(() => controller.showArchive.isTrue
              ? ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemBuilder: (c, index) {
                    GroupChatModel g = controller.groupArchive[index];
                    return ItemGroupChatBySubjectView(
                      item: g,
                      onPressed: () {
                        ChatCrud.instance.userViewMessage(g.subjectClassId);
                        pushTo(Routes.CHAT_DETAIL, arguments: g);
                      },
                    );
                  },
                  itemCount: controller.groupArchive.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      thickness: 1,
                      indent: 20,
                      endIndent: 20,
                      color: AppColor.lineColor,
                    );
                  },
                )
              : SizedBox.shrink()),
        ],
      ),
    );
  }
}
