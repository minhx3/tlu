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
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Container(
            child: Container(
              height: 1,
              width: double.infinity,
              color: Color(0xff33355A),
            ),
          ),
          Container(
            height: 63,
            width: Constant.designWidth,
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
                          "Hôm nay",
                          style: fontInter(12,
                              color: AppColor.whiteColor.withOpacity(0.5),
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "${controller.getToday()}",
                          style: fontInter(16,
                              color: AppColor.cfc7171, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: Obx(() => Row(
                        children: [
                          tabItem("Tuần", 1, (tag) {
                            controller.setTag(tag);
                          }, isSelected: controller.tagIndex() == 1),
                          Container(
                            width: 4,
                            height: 20,
                          ),
                          tabItem("Tháng", 2, (tag) {
                            controller.setTag(tag);
                          }, isSelected: controller.tagIndex() == 2),
                        ],
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  InkWell tabItem(String title, int tag, onTap(int tag),
      {bool isSelected = false}) {
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
            color: isSelected == false
                ? Colors.white.withOpacity(0.15)
                : AppColor.whiteColor,
            borderRadius: BorderRadius.circular(15)),
        child: Text(title ?? "",
            style: fontInter(13,
                fontWeight: FontWeight.w600,
                color: isSelected == true
                    ? AppColor.c000333
                    : AppColor.whiteColor)),
      ),
    );
  }
}
