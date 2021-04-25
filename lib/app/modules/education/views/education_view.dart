import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';
import 'package:thanglong_university/app/modules/education/views/education_subject_item_view.dart';
import 'package:thanglong_university/app/routes/app_pages.dart';
import 'package:thanglong_university/app/views/views/app_bar_view.dart';

import '../controllers/education_controller.dart';

class EducationView extends GetView<EducationController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.educationBackground,
      child: Column(
        children: [
          AppBarView(
            automaticallyImplyLeading: false,
            type: AppBarType.tab,
            title: "Đào tạo",
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: AppColor.blockEducationBackground,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      counterView(
                          title: "128/140",
                          subTitle: "3.24",
                          onTap: () {
                            pushTo(Routes.TRANSCRIPT);
                          }),
                      counterView(
                          title: "12 tín chỉ",
                          subTitle: "4 môn",
                          type: 2,
                          space: 16,
                          onTap: () {
                            pushTo(Routes.TEST_SCHEDULE);
                          }),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Text(
                    "Kỳ 2 - 2020-2021",
                    style: fontInter(14,
                        fontWeight: FontWeight.w600,
                        color: AppColor.labelColor),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  children: List.generate(
                      20,
                      (index) => EducationSubjectItemView(
                          space: index == 0 ? 0 : 16)).toList(),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget counterView(
      {int type = 1,
      String title,
      String subTitle,
      double space = 0,
      Function onTap}) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: EdgeInsets.only(top: space),
        decoration: boxShadow.copyWith(
            color:
                type == 1 ? AppColor.appBarDarkBackground : AppColor.whiteColor,
            borderRadius: BorderRadius.circular(5)),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        height: 80,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    type == 1 ? "Xếp danh sách ngay:" : "Tín chỉ học trong kì:",
                    style: fontInter(14,
                        fontWeight: FontWeight.w600,
                        color: type == 1
                            ? AppColor.errorColor
                            : AppColor.labelColor),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    title ?? "",
                    style: fontInter(type == 1 ? 24 : 18,
                        fontWeight: FontWeight.w600,
                        color: type == 1
                            ? AppColor.whiteColor
                            : AppColor.appBarDarkBackground),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              width: 1,
              height: 50,
              color: AppColor.whiteColor.withOpacity(0.15),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    type == 1 ? "DTBTL" : "Lịch thi",
                    style: fontInter(14,
                        fontWeight: FontWeight.w600,
                        color: type == 1
                            ? AppColor.errorColor
                            : AppColor.labelColor),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    subTitle ?? "",
                    style: fontInter(type == 1 ? 24 : 18,
                        fontWeight: FontWeight.w600,
                        color: type == 1
                            ? AppColor.whiteColor
                            : AppColor.appBarDarkBackground),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Image.asset(Images.arrowRight,
                height: 14,
                color: type == 1
                    ? AppColor.whiteColor
                    : AppColor.appBarDarkBackground)
          ],
        ),
      ),
    );
  }
}
