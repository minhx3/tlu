import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';

import '../../../configuration/constant/color.dart';
import '../../../configuration/constant/global.dart';

class HomeScheduleItemView extends GetView {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
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
            decoration: boxShadow.copyWith(
                borderRadius: BorderRadius.circular(5),
                color: AppColor.whiteColor,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 6,
                      spreadRadius: 2,
                      color: AppColor.hintTextColor.withOpacity(0.1)),
                ]),
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              children: [
                contentView(),
                Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        blurRadius: 3,
                        spreadRadius: 0,
                        offset: Offset(0, 5),
                        color: AppColor.hintTextColor.withOpacity(0.1)),
                  ], color: AppColor.whiteColor),
                  child: Row(
                    children: [
                      blockView(
                        "Mã lớp:",
                        "TMQUOCTE1.1",
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      blockView("Địa điểm:", "Phòng 302 Tòa A3"),
                      Expanded(
                        child: SizedBox(),
                      ),
                      GestureDetector(
                          child: Image.asset(
                            Images.iconStar,
                            width: 18,
                          ),
                          onTap: () {})
                    ],
                  ),
                ),
                noteView()
              ],
            ),
          )
        ],
      ),
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
              Expanded(
                child: Text(
                  "Thương mại quốc tế",
                  style: fontInter(16,
                      fontWeight: FontWeight.w600,
                      color: AppColor.appBarDarkBackground),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: AppColor.cfc7171,
                    borderRadius: BorderRadius.circular(5)),
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                alignment: Alignment.center,
                child: Text(
                  "PG122",
                  style: fontInter(10,
                      fontWeight: FontWeight.w600, color: AppColor.whiteColor),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 4,
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

  Widget blockView(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: fontInter(11,
              fontWeight: FontWeight.w500, color: AppColor.subTextColor),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          content,
          style: fontInter(12,
              fontWeight: FontWeight.w600, color: AppColor.sectionTermColor),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
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
