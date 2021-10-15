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
  final bool isHome;

  const ChatListTeacherView({this.controller, this.isHome = false});

  @override
  Widget build(BuildContext context) {
    Map<String, List<GroupChatModel>> groupTeacher =
        controller.groupTeacherWithBadge;
    return Expanded(
        child: ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 12),
      itemBuilder: (c, index) {
        var item = groupTeacher.entries.elementAt(index);
        return _ItemGroupBySubjectView(
          isHome: isHome,
          subjectName: item.key,
          itemChilds: item.value,
        );
      },
      itemCount: groupTeacher.entries.length,
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          thickness: 1.5,
          indent: 12,
          endIndent: 12,
          color: AppColor.lineColor,
        );
      },
    ));
  }
}

class _ItemGroupBySubjectView extends StatelessWidget {
  final String subjectName;
  final bool isHome;
  final List<GroupChatModel> itemChilds;

  const _ItemGroupBySubjectView(
      {Key key,
      @required this.subjectName,
      @required this.itemChilds,
      this.isHome = false})
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
            style: fontInter(16,
                color: AppColor.labelColor, fontWeight: FontWeight.w600),
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
              isHome: isHome,
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
      ],
    );
  }
}

class ItemChatBySubject {}
