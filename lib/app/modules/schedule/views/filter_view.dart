import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/constant.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/modules/schedule/controllers/schedule_controller.dart';

class FilterView extends GetView<ScheduleController> {
  final String title;
  final String subTitle;
  final bool showFillter;

  FilterView({this.title, this.subTitle, this.showFillter = true});
  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          margin: EdgeInsets.only(top: 5),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        controller.setTag(0);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Thứ 2,",
                            style: fontInter(14,
                                color: AppColor.subTextColor,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "01/02/2021",
                            style: fontInter(16,
                                color: AppColor.appBarDarkBackground,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                  showFillter == true
                      ? Container(
                          decoration: BoxDecoration(
                              color: AppColor.whiteColor.withOpacity(0.2),
                              border: Border.all(
                                  color: AppColor.whiteColor.withOpacity(0.2)),
                              borderRadius: BorderRadius.circular(3)),
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Image.asset(
                                  Images.iconStar,
                                  width: 20,
                                  height: 20,
                                ),
                              ),
                              Container(
                                width: 1,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 10),
                                height: 30,
                                color: AppColor.subTextColor.withOpacity(0.1),
                              ),
                              InkWell(
                                onTap: () {
                                  controller.switchFilter();
                                },
                                child: Image.asset(
                                  Images.iconFilter,
                                  width: 20,
                                  height: 20,
                                ),
                              )
                            ],
                          ),
                        )
                      : SizedBox()
                ],
              ),
              controller.isFilter() ? blockSubject() : SizedBox()
            ],
          ),
        ));
  }

  Container blockSubject() {
    return Container(
        width: 375,
        decoration: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(color: AppColor.educationBackground, width: 1)),
        ),
        padding: EdgeInsets.symmetric(vertical: 10),
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
                          color: AppColor.educationBackground, width: 1)),
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
                      color: AppColor.educationBackground, width: 1)))
          : null,
      width: (Constant.designWidth - 72) / 2,
      child: Row(
        children: [
          Expanded(
            child: Text(
              "Khối học phần",
              style: fontInter(12,
                  color: AppColor.sectionTermColor,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Image.asset(
            Images.tick,
            height: 18,
            width: 18,
            color: AppColor.sectionTermColor,
          )
        ],
      ),
    );
  }
}
