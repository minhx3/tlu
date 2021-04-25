import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/constant.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/modules/transcript/controllers/transcript_controller.dart';
import 'package:thanglong_university/app/views/views/button_view.dart';
import 'package:thanglong_university/app/views/views/link_view.dart';

class TranscriptFilterView extends GetView<TranscriptController> {
  @override
  Widget build(BuildContext context) {
    return blockFilter();
  }

  Widget blockFilter() {
    return Container(
      color: AppColor.appBarDarkBackground,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          dropdown("Khối học phần", isExpanded: true),
          SizedBox(
            height: 40,
            child: Row(
              children: [
                Expanded(
                    child: dropdown(
                  "Số tín chỉ",
                )),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: dropdown(
                  "Điểm",
                )),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(),
              ),
              Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 40,
                  child: LinkView(
                    "Huỷ lọc",
                    textColor: AppColor.whiteColor,
                    textDecoration: TextDecoration.none,
                  )),
              SizedBox(
                width: 100,
                height: 40,
                child: ButtonView(
                  title: "Lọc",
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Container dropdown(String title, {double top = 10, bool isExpanded = false}) {
    return Container(
      padding: EdgeInsets.only(top: top),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: fontInter(14,
                      color: AppColor.whiteColor, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Image.asset(
                  Images.dropdown,
                  height: 8,
                ),
              )
            ],
          ),
          isExpanded == true ? blockSubject() : SizedBox(height: 10),
        ],
      ),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: AppColor.whiteColor.withOpacity(0.3), width: 1.5))),
    );
  }

  Container blockSubject() {
    return Container(
        width: Get.width,
        child: Stack(
          children: [
            Wrap(
              children: List.generate(4, (index) {
                return itemSelectBox(index);
              }),
            ),
            Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 40, left: 10, right: 10),
                height: 1,
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: AppColor.whiteColor.withOpacity(0.3),
                          width: 1)),
                )),
          ],
        ));
  }

  Container itemSelectBox(
    int index,
  ) {
    return Container(
      height: 30,
      padding: EdgeInsets.only(
        left: index % 2 == 0 ? 0 : 16,
      ),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: index % 2 != 0
          ? BoxDecoration(
              border: Border(
                  left: BorderSide(
                      color: AppColor.whiteColor.withOpacity(0.3), width: 1)))
          : null,
      width: (Constant.designWidth - 72) / 2,
      child: Row(
        children: [
          Expanded(
            child: Text(
              "Khối học phần",
              style: fontInter(12,
                  color: AppColor.whiteColor.withOpacity(.5),
                  fontWeight: FontWeight.w500),
            ),
          ),
          Image.asset(
            Images.tick,
            height: 18,
            width: 18,
          )
        ],
      ),
    );
  }
}
