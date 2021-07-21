import 'package:flutter/material.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/model/chat/chat.dart';
import 'package:thanglong_university/app/model/chat/subject_class_entity.dart';
import 'package:thanglong_university/app/model/chat_group_entity.dart';
import 'package:thanglong_university/app/views/views/pressable_view.dart';
import 'package:thanglong_university/app/views/views/value_box_view.dart';

class ItemGroupChatBySubjectView extends StatelessWidget {
  final VoidCallback onPressed;
  final SubjectClassEntity item;

  const ItemGroupChatBySubjectView({Key key, this.onPressed, this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PressableView(
      backgroundColor: Colors.transparent,
      onPressed: onPressed,
      child: Container(
        height: 68,
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: AppColor.subjectBackgroundColor,
              child: Text(
                item?.id?.toUpperCase() ?? '',
                style: fontInter(14, color: AppColor.whiteColor),
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _RowTop(
                    title: item?.id ?? '',
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  _RowBottom(
                    lastMessage: item?.id ?? '',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RowBottom extends StatelessWidget {
  final String lastMessage;

  const _RowBottom({
    Key key,
    this.lastMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          lastMessage,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: fontInter(12,
              color: AppColor.descriptionTextColor,
              fontWeight: FontWeight.w600),
        ),
        Spacer(),
        ValueBoxView(
          text: '99+',
        ),
      ],
    );
  }
}

class _RowTop extends StatelessWidget {
  final String title;

  const _RowTop({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueBoxView(
          text: 'T2, 1-3',
        ),
        SizedBox(
          width: 6,
        ),
        Expanded(
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: fontInter(14, fontWeight: FontWeight.w600),
          ),
        ),
        Text(
          "11:20",
          style: fontInter(10,
              fontWeight: FontWeight.w600,
              color: AppColor.descriptionTextColor),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}
