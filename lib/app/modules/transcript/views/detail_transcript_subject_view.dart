import 'package:flutter/material.dart';

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
    return AppContainer(
      child: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 16),
          padding: EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
              color: AppColor.whiteColor,
              borderRadius: BorderRadius.circular(5)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              header(),
              section(),
              section(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
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
      double fontSize = 16,
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
                  color: isSubItem
                      ? AppColor.subTextColor
                      : AppColor.sectionTermColor),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )),
            Text(
              "3",
              style: fontInter(
                fontSize,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ));
  }

  Container header() {
    return Container(
        height: 74,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: AppColor.errorColor,
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
                Expanded(
                  child: SizedBox(),
                ),
                GestureDetector(
                  onTap: () {
                    pop();
                  },
                  child: Image.asset(
                    Images.dismssIcon,
                    width: 14,
                    height: 14,
                  ),
                )
              ],
            ),
            Text(
              "Thương mại quốc tế",
              style: fontInter(18,
                  fontWeight: FontWeight.w600, color: AppColor.whiteColor),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
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
