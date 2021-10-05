import 'package:flutter/material.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';
import 'package:thanglong_university/app/model/chat/chat.dart';
import 'package:thanglong_university/app/model/chat/group_chat_model.dart';
import 'package:thanglong_university/app/modules/chat/controllers/chat_cotroller.dart';
import 'package:thanglong_university/app/routes/app_pages.dart';

import 'item_group_chat_by_subject_view.dart';

class ChatListTeacherView extends StatelessWidget {
  final ChatController controller;

  ChatListTeacherView({this.controller});

  @override
  Widget build(BuildContext context) {
    Map<String, List<GroupChatModel>> groupTeacher =
        controller.groupTeacherWithBadge;
    return Expanded(
      child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 12),
          children: groupTeacher.entries
              .map((e) => _ItemGroupBySubjectView(
                    subjectName: e.key,
                    itemChilds: e.value,
                  ))
              .toList()),
    );
  }
}

class _ItemGroupBySubjectView extends StatelessWidget {
  final String subjectName;

  final List<GroupChatModel> itemChilds;

  const _ItemGroupBySubjectView(
      {Key key, @required this.subjectName, @required this.itemChilds})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            subjectName,
            style: fontInter(16, color: AppColor.labelColor),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        ListView.separated(
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (c, index) {
            GroupChatModel g = itemChilds[index];
            return ItemGroupChatBySubjectView(
              item: g,
              onPressed: () {
                ChatCrud.instance.userViewMessage(g.subjectClassId);
                pushTo(Routes.CHAT_DETAIL, arguments: g);
              },
            );
          },
          itemCount: itemChilds.length ?? 0,
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              thickness: 1,
              indent: 12,
              endIndent: 12,
              color: AppColor.ce6e6e6,
            );
          },
        ),
        Divider(
          thickness: 1.5,
          indent: 12,
          endIndent: 12,
          color: AppColor.cbfbfbf,
        )
      ],
    );
  }
}

class ItemChatBySubject {}
