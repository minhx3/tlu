import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';
import 'package:thanglong_university/app/model/chat/chat.dart';
import 'package:thanglong_university/app/model/chat/group_chat_model.dart';
import 'package:thanglong_university/app/model/schedule_teacher_model.dart';
import 'package:thanglong_university/app/routes/app_pages.dart';

class EducationTeacherItemView extends GetView {
  final ScheduleTeacherModel item;
  final double space;
  final bool isCurrent;

  EducationTeacherItemView({this.item, this.space = 5, this.isCurrent = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        ChatCrud.instance.userViewMessage(item.subjectClassId);
        pushTo(Routes.CHAT_DETAIL,
            arguments: GroupChatModel(
                subjectId: item.subjectId,
                subjectClassId: item.subjectClassId,
                subjectClassName: item.subjectClassName));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        margin: EdgeInsets.only(left: 15, right: 15, top: 5),
        decoration: boxShadow
            .copyWith(borderRadius: BorderRadius.circular(5), boxShadow: []),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    "${item?.subjectClassId ?? ""}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: fontInter(16,
                        fontWeight: FontWeight.w600, color: AppColor.c000333),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                itemView("Thời gian:", "T2, 1-3\nT2, 1-3"),
                itemView("Địa điểm:", "B301", isLast: true),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget itemView(String title, String subTitle, {bool isLast = false}) {
    return IntrinsicHeight(
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: fontInter(11,
                    fontWeight: FontWeight.w500, color: AppColor.c808080),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                subTitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: fontInter(12,
                    fontWeight: FontWeight.w600, color: AppColor.c000333),
              ),
            ],
          ),
          isLast == true
              ? SizedBox()
              : VerticalDivider(
                  thickness: 1,
                  color: AppColor.lineColor,
                  width: 30,
                ),
        ],
      ),
    ).marginOnly(top: 10);
  }
}
