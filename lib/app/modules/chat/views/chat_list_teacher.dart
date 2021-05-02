import 'package:flutter/material.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/modules/chat/views/child_item_group_chat_by_subject_view.dart';

class ChatListTeacherView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 12),
      itemBuilder: (context, index) {
        return _ItemGroupBySubjectView(
          subjectName: 'Thương mại quốc tế',
          itemChilds: [
            ItemChatBySubject(),
            ItemChatBySubject(),
            ItemChatBySubject(),
            ItemChatBySubject()
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          thickness: 1,
          indent: 12,
          endIndent: 12,
          color: AppColor.lineSectionColor,
        );
      },
      itemCount: 3,
    );
  }
}

class _ItemGroupBySubjectView extends StatelessWidget {
  final String subjectName;

  final List<ItemChatBySubject> itemChilds;

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
            return ChildItemGroupChatBySubjectView(
              onPressed: () {},
            );
          },
          itemCount: itemChilds.length ?? 0,
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              thickness: 1,
              indent: 12,
              endIndent: 12,
              color: AppColor.lineColor,
            );
          },
        )
      ],
    );
  }
}

class ItemChatBySubject {}
