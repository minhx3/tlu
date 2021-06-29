import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/modules/schedule/controllers/schedule_controller.dart';

enum TimeViewType { week, month }

class WeekTimeView extends GetView<ScheduleController> {
  final TimeViewType timeViewType;

  WeekTimeView({this.timeViewType = TimeViewType.week});
  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
        height: 55,
        child: Row(
          children: [
            InkWell(
              onTap: () {
                if (timeViewType == TimeViewType.week) {
                  controller.previousWeek();
                } else {
                  controller.previousMonth();
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Image.asset(
                  Images.arrrowTimeLeft,
                  width: 7,
                  color: AppColor.c8c8c8c,
                ),
              ),
            ),
            Expanded(
              child: Text(
                timeViewType == TimeViewType.week
                    ? "${controller.rxWeekDay()}"
                    : "${controller.rxWeekDay()}",
                textAlign: TextAlign.center,
                style: fontInter(16,
                    color: AppColor.appBarDarkBackground,
                    fontWeight: FontWeight.w600),
              ),
            ),
            InkWell(
              onTap: () {
                if (timeViewType == TimeViewType.week) {
                  controller.nextWeek();
                } else {
                  controller.nextMonth();
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Image.asset(
                  Images.arrowTimeRight,
                  width: 7,
                  color: AppColor.c8c8c8c,
                ),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border(
                bottom: BorderSide(
                    color: AppColor.educationBackground, width: 1)))));
  }
}
