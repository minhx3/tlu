import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';
import 'package:thanglong_university/app/views/views/app_widget.dart';
import 'package:thanglong_university/app/views/views/button_view.dart';

class DetailTranscriptSubjectView extends GetView {
  @override
  Widget build(BuildContext context) {
    return SlideInUp(
      child: AppContainer(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                padding: EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    header(),
                    section(),
                    section(),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                      child: rowItem(title: "Tổng kết", value: "3"),
                    ),
                    ButtonView(
                      title: "Chi tiết môn",
                      type: ButtonType.outline,
                      horizontalSpacing: 16,
                      onTap: () {},
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: GestureDetector(
                  onTap: () {
                    pop();
                  },
                  child: Image.asset(
                    Images.dismissIcon,
                    width: 36,
                    height: 36,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container section() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          rowItem(title: "Số tín chỉ", value: "3", showLine: true),
          rowItem(title: "Điểm QT trung bình:", value: "6.9"),
          rowItem(
              title: "Nghe",
              value: "3",
              padding: 8,
              fontSize: 13,
              isSubItem: true),
          rowItem(
              title: "Nói",
              value: "3",
              padding: 8,
              fontSize: 13,
              isSubItem: true),
          rowItem(
              title: "Đọc",
              value: "3",
              padding: 8,
              fontSize: 13,
              isSubItem: true),
          rowItem(
              title: "Viết",
              value: "3",
              padding: 8,
              fontSize: 13,
              showLine: true,
              isSubItem: true)
        ],
      ),
    );
  }

  Container rowItem(
      {String title,
      String value,
      bool showLine = false,
      double fontSize = 14,
      double padding = 0,
      bool isSubItem = false,
      Color color}) {
    return Container(
        height: showLine ? 40 : 30,
        padding: EdgeInsets.only(left: padding),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: showLine == true
                        ? AppColor.lineColor
                        : Colors.transparent,
                    width: 1))),
        child: Row(
          children: [
            Expanded(
                child: Text(
              title,
              style: fontInter(fontSize,
                  fontWeight: FontWeight.w500,
                  color: isSubItem ? AppColor.c808080 : AppColor.c333333),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )),
            Text(
              "3",
              style: fontInter(fontSize,
                  fontWeight: FontWeight.w500, color: AppColor.c000333),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ));
  }

  Container header() {
    return Container(
        height: 56,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Thương mại quốc tế",
                    style: fontInter(16,
                        fontWeight: FontWeight.w600,
                        color: AppColor.whiteColor),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: AppColor.cfc7171,
                      borderRadius: BorderRadius.circular(5)),
                  height: 18,
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  alignment: Alignment.center,
                  child: Text(
                    "PG122",
                    style: fontInter(10,
                        fontWeight: FontWeight.w600,
                        color: AppColor.whiteColor),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: AppColor.appBarDarkBackground,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5), topRight: Radius.circular(5)),
        ));
  }
}
