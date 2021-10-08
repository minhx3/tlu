import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';
import 'package:thanglong_university/app/model/schedule_teacher_model.dart';

class EducationTeacherItemView extends GetView {
  final ScheduleTeacherModel item;
  final double space;
  final bool isCurrent;

  EducationTeacherItemView({this.item, this.space = 5, this.isCurrent = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        // if (isCurrent) {
        //   pushTo(Routes.DETAI_CLASS, arguments: {
        //     "id": item.id,
        //     "data": item,
        //     'type': ClassDetailType.studying
        //   });
        // } else {
        //   ScoreDetailEntity res =
        //       await Appclient.shared.getTrascriptById(item.subjectClassId);
        //   if (res != null) {
        //     Get.dialog(DetailTranscriptSubjectView(res));
        //   }
        // }
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
    return Container(
      width: 85,
      padding: EdgeInsets.only(top: 16),
      child: Row(
        children: [
          Expanded(
            child: Column(
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
          ),
          isLast == true
              ? SizedBox()
              : Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  width: 1,
                  height: 35,
                  color: AppColor.lineColor,
                ),
        ],
      ),
    );
  }
}
