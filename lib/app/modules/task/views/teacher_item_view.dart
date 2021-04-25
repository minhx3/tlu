import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/views/views/image_view.dart';

class TeacherItemView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ImageView(
                "https://uifaces.co/our-content/donated/6MWH9Xi_.jpg",
                height: 40,
                width: 40,
                type: Type.network,
                borderRadius: BorderRadius.circular(20),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Giảng viên",
                        style: fontInter(11,
                            fontWeight: FontWeight.w500,
                            color: AppColor.subTextColor),
                      ),
                      Text(
                        "PGS. TS. Nguyễn An Thịnh",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: fontInter(14,
                            fontWeight: FontWeight.w600,
                            color: AppColor.textColor),
                      ),
                    ],
                  ),
                ),
              ),
              Image.asset(TabImages.tabConversation,
                  width: 25, height: 25, color: AppColor.subTextColor)
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
