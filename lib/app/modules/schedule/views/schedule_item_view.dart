import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';

class ScheduleItemView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
          child: Row(
            children: [
              Padding(
                child: Image.asset(
                  Images.dotRipple,
                  width: 18,
                ),
                padding: EdgeInsets.all(8),
              ),
              Text(
                "10:00 - 11:50",
                style: fontInter(14,
                    color: Colors.red, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: AppColor.whiteColor,
              borderRadius: BorderRadius.circular(5)),
          child: Column(
            children: [contentView(), placeView(), noteView()],
          ),
        )
      ],
    );
  }

  Padding contentView() {
    return Padding(
      padding: EdgeInsets.only(left: 16, top: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: AppColor.appBarDarkBackground,
                    borderRadius: BorderRadius.circular(5)),
                height: 18,
                padding: EdgeInsets.symmetric(horizontal: 4),
                alignment: Alignment.center,
                child: Text(
                  "Lớp học",
                  style: fontInter(10,
                      fontWeight: FontWeight.w600, color: AppColor.whiteColor),
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
                  Images.cardNotify,
                  width: 18,
                  height: 18,
                ),
              )
            ],
          ),
          Text(
            "Thương mại quốc tế",
            style: fontInter(16,
                fontWeight: FontWeight.w600,
                color: AppColor.appBarDarkBackground),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "Các hiệp định thương mại tự do FTA(Có tệp đính kèm tham khảo)",
            style: fontInter(12,
                fontWeight: FontWeight.w400, color: AppColor.subTextColor),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Container(
            height: 1,
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            color: AppColor.subTextColor.withOpacity(0.1),
          ),
        ],
      ),
    );
  }

  Container placeView() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            blurRadius: 3,
            spreadRadius: 0,
            offset: Offset(0, 5),
            color: AppColor.hintTextColor.withOpacity(0.1)),
      ], color: AppColor.whiteColor),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Địa điểm:",
                  style: fontInter(11,
                      fontWeight: FontWeight.w500,
                      color: AppColor.subTextColor),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  "Phòng 302 Tòa A3",
                  style: fontInter(12,
                      fontWeight: FontWeight.w600,
                      color: AppColor.sectionTermColor),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              pop();
            },
            child: Image.asset(
              Images.iconStar,
              width: 18,
              color: Colors.orangeAccent,
              height: 18,
            ),
          )
        ],
      ),
    );
  }

  Padding noteView() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Note:",
            style: fontInter(14,
                fontWeight: FontWeight.w500, color: AppColor.labelColor),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "• Chuẩn bị slide thuyết trình\n• Câu hỏi phản biện các nhóm khác",
            style: fontInter(12,
                fontWeight: FontWeight.w500, color: AppColor.subTextColor),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
