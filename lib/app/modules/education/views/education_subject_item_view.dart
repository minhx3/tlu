import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';
import 'package:thanglong_university/app/routes/app_pages.dart';

class EducationSubjectItemView extends GetView {
  final double space;

  EducationSubjectItemView({this.space = 5});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pushTo(Routes.DETAI_CLASS);
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
                    "Thương mại quốc tế",
                    maxLines: 1,
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
                    "TMQUOCTE1.1",
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
              children: [
                item("Thời gian:", "T2, 1-3\nT2, 1-3"),
                item("Địa điểm:", "B301"),
                item("Số tín chỉ:", "3 Tín", isLast: true),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget item(String title, String subTitle, {bool isLast = false}) {
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
