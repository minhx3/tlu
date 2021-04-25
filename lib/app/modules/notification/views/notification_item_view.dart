import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';

class NotificationItemView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                Images.noteIcon,
                height: 40,
                width: 40,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Lớp Thương mại quốc tế - T2,3-4 - B307 đã được chuyển sang T2,5-6 - B402",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: fontInter(14,
                            fontWeight: FontWeight.w500,
                            color: AppColor.textColor),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Text(
                          "Khoảng 1 tiếng trước",
                          style: fontInter(12,
                              fontWeight: FontWeight.w500,
                              color: AppColor.errorColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10, left: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.errorColor),
                height: 10,
                width: 10,
              )
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: AppColor.lineColor))),
        )
      ],
    );
  }
}
