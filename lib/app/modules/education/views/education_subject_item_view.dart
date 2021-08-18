import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';
import 'package:thanglong_university/app/model/register_subject_entity.dart';
import 'package:thanglong_university/app/routes/app_pages.dart';

class EducationSubjectItemView extends GetView {
  final RegisterSubjectEntity item;
  final double space;

  EducationSubjectItemView({this.item, this.space = 5});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pushTo(Routes.DETAI_CLASS, arguments: {"id": item.id, "data": item});
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        margin: EdgeInsets.only(left: 16, right: 16, top: 5),
        decoration: boxShadow
            .copyWith(borderRadius: BorderRadius.circular(5), boxShadow: []),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    "${item?.subject?.name ?? ""}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: fontInter(16,
                        fontWeight: FontWeight.w600, color: AppColor.c000333),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: AppColor.cfc7171,
                      borderRadius: BorderRadius.circular(5)),
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                  alignment: Alignment.center,
                  child: Text(
                    "${item.subject?.id ?? ""}",
                    style: fontInter(10,
                        fontWeight: FontWeight.w600,
                        color: AppColor.whiteColor),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                itemView("Thời gian:", "T2, 1-3\nT2, 1-3"),
                itemView("Địa điểm:", "B301"),
                itemView("Số tín chỉ:",
                    "${item?.prerequisiteSubject?.credits ?? 0} Tín",
                    isLast: true),
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
                SizedBox(height: 4,),
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
