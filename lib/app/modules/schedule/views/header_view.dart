import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/constant.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/modules/schedule/controllers/schedule_controller.dart';

class HeaderView extends GetView<ScheduleController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.appBarDarkBackground,
      child: Container(
        height: 63,
        width: Constant.designWidth,
        margin: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  controller.setTag(0);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ngày hôm nay",
                      style: fontInter(12,
                          color: AppColor.whiteColor.withOpacity(0.5),
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "01/02/2021",
                      style: fontInter(16,
                          color: Colors.red, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: AppColor.whiteColor.withOpacity(0.2),
                  border:
                      Border.all(color: AppColor.whiteColor.withOpacity(0.2)),
                  borderRadius: BorderRadius.circular(3)),
              child: Row(
                children: [
                  tabItem("Tuần", 1, (tag) {
                    controller.setTag(tag);
                  }),
                  Container(
                    width: 1,
                    height: 20,
                    color: AppColor.whiteColor.withOpacity(0.2),
                  ),
                  tabItem("Tháng", 2, (tag) {
                    controller.setTag(tag);
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  InkWell tabItem(String title, int tag, onTap(int tag),
      {bool isSelected = true}) {
    return InkWell(
      onTap: () {
        onTap(tag);
      },
      child: Container(
        height: 30,
        width: 71,
        padding: EdgeInsets.symmetric(horizontal: 8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: isSelected ? Colors.transparent : AppColor.whiteColor,
            borderRadius: BorderRadius.circular(3)),
        child: Text(title ?? "",
            style: fontInter(13,
                fontWeight: FontWeight.w600,
                color: isSelected
                    ? AppColor.whiteColor.withOpacity(0.5)
                    : AppColor.appBarDarkBackground)),
      ),
    );
  }
}
