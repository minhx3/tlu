import 'package:flutter/material.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';
import 'package:thanglong_university/app/modules/chat/views/item_group_chat_by_subject_view.dart';
import 'package:thanglong_university/app/routes/app_pages.dart';

class ChatListStudentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemBuilder: (c, index) {
        return ItemGroupChatBySubjectView(
          onPressed: () {
            pushTo(Routes.CHAT_DETAIL);
          },
        );
      },
      itemCount: 10,
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          thickness: 1,
          indent: 12,
          endIndent: 12,
          color: AppColor.ce6e6e6,
        );
      },
    );
  }
}
