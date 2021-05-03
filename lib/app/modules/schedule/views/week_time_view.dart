import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';

enum TimeViewType { week, month }

class WeekTimeView extends GetView {
  final TimeViewType timeViewType;

  WeekTimeView({this.timeViewType = TimeViewType.week});
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 55,
        child: Row(
          children: [
            InkWell(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Image.asset(
                  Images.arrrowTimeLeft,
                  width: 7,
                  color: timeViewType == TimeViewType.week
                      ? AppColor.appBarDarkBackground
                      : AppColor.hintTextColor,
                ),
              ),
            ),
            Expanded(
              child: Text(
                timeViewType == TimeViewType.week ? "01-07/02/2021" : "Tháng 2",
                textAlign: TextAlign.center,
                style: fontInter(16,
                    color: AppColor.appBarDarkBackground,
                    fontWeight: FontWeight.w600),
              ),
            ),
            InkWell(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Image.asset(
                  Images.arrowTimeRight,
                  width: 7,
                  color: timeViewType == TimeViewType.week
                      ? AppColor.appBarDarkBackground
                      : AppColor.hintTextColor,
                ),
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
            color: timeViewType == TimeViewType.week
                ? Colors.transparent
                : Colors.white,
            borderRadius: timeViewType == TimeViewType.month
                ? BorderRadius.circular(3)
                : null,
            border: Border(
                bottom: timeViewType == TimeViewType.week
                    ? BorderSide(color: AppColor.educationBackground, width: 1)
                    : BorderSide.none)));
  }
}
