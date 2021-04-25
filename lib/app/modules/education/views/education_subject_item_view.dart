import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';

class EducationSubjectItemView extends GetView {
  final double space;

  EducationSubjectItemView({this.space = 16});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      margin: EdgeInsets.only(left: 16, right: 16, top: space),
      decoration: boxShadow
          .copyWith(borderRadius: BorderRadius.circular(5), boxShadow: []),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: AppColor.errorColor,
                borderRadius: BorderRadius.circular(5)),
            height: 24,
            width: 65,
            alignment: Alignment.center,
            child: Text(
              "PG122",
              style: fontInter(12,
                  fontWeight: FontWeight.w600, color: AppColor.whiteColor),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            "Thương mại quốc tế",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: fontInter(16,
                fontWeight: FontWeight.w600, color: AppColor.textColor),
          ),
          Row(
            children: [
              item("Thời gian:", "T2, 1-3"),
              item("Địa điểm:", "B301"),
              item("Số tín chỉ:", "3 Tín"),
              Expanded(
                child: SizedBox(),
              ),
              Image.asset(
                Images.iconPage,
                width: 20,
                height: 20,
              )
            ],
          )
        ],
      ),
    );
  }

  Padding item(String title, String subTitle) {
    return Padding(
      padding: EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: fontInter(11,
                    fontWeight: FontWeight.w500, color: AppColor.labelColor),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                subTitle,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: fontInter(12,
                    fontWeight: FontWeight.w600, color: AppColor.textColor),
              ),
            ],
          ),
          Container(
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
