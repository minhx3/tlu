import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';
import 'package:thanglong_university/app/modules/education/views/education_subject_item_view.dart';
import 'package:thanglong_university/app/routes/app_pages.dart';
import 'package:thanglong_university/app/views/views/app_bar_view.dart';
import 'package:thanglong_university/app/views/views/app_widget.dart';
import 'package:thanglong_university/app/views/views/button_view.dart';

import '../controllers/education_controller.dart';

class EducationView extends GetView<EducationController> {
  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: Scaffold(
        backgroundColor: AppColor.cf2f2f2,
        body: Column(
          children: [
            AppBarView(
              automaticallyImplyLeading: false,
              type: AppBarType.tab,
              title: "Đào tạo",
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(bottom: 30),
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Obx(() {
                          final data = controller.rxProcess();
                          return counterView(
                              title:
                                  "${data?.completeCredits ?? 0}/${data?.sumCredits ?? 0}",
                              subTitle: "${data?.gpa ?? 0}",
                              hasProgress: true,
                              value: (data?.completeCredits ?? 0) /
                                  (data?.sumCredits ?? 0),
                              onTap: () {
                                pushTo(Routes.TRANSCRIPT,
                                    arguments: controller.rxProcess());
                              });
                        }),
                        Obx(() {
                          final data = controller.rxProcess();
                          final count = controller.rxScheduleList().length;
                          return counterView(
                              title:
                                  "${data?.sumCreditsInSemster ?? 0} tín chỉ",
                              subTitle: "${count ?? 0} môn",
                              space: 10,
                              type: 2,
                              value: (data?.completeCredits ?? 0) /
                                  (data?.sumCredits ?? 0),
                              onTap: () {
                                pushTo(Routes.TEST_SCHEDULE, arguments: controller.rxScheduleList);
                              });
                        }),
                      ],
                    ),
                  ),
                  Container(
                    height: 1,
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    color: AppColor.ce6e6e6,
                  ),
                  Obx(() => Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 25, 20, 10),
                            child: Text(
                              "${controller.rxMapSubjectList()?.keys?.first ?? ""}",
                              style: fontInter(14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.c4d4d4d),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          ListView(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            physics: NeverScrollableScrollPhysics(),
                            children:
                                (controller.rxMapSubjectList()?.values?.first ??
                                        [])
                                    .map((item) => EducationSubjectItemView(
                                        item: item,
                                        isCurrent: true,
                                        space: (controller
                                                            .rxMapSubjectList()
                                                            ?.values
                                                            ?.first ??
                                                        [])
                                                    .indexOf(item) ==
                                                0
                                            ? 0
                                            : 5))
                                    .toList(),
                          ),
                        ],
                      )),
                  Obx(() => ButtonView(
                        title: controller.isShowOther.isTrue
                            ? 'Ẩn các kỳ trước'
                            : "Xem thêm các kì trước",
                        type: ButtonType.outline,
                        horizontalSpacing: 16,
                        verticalSpacing: 16,
                        onTap: () {
                          controller.isShowOther.toggle();
                        },
                      )),
                  Obx(() => controller.isShowOther.isTrue
                      ? ListView(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: NeverScrollableScrollPhysics(),
                          children: (controller
                                      .rxMapOtherSubjectList()
                                      ?.values
                                      ?.first ??
                                  [])
                              .map((item) => EducationSubjectItemView(
                                  item: item,
                                  space: (controller
                                                      .rxMapSubjectList()
                                                      ?.values
                                                      ?.first ??
                                                  [])
                                              .indexOf(item) ==
                                          0
                                      ? 0
                                      : 5))
                              .toList(),
                        )
                      : SizedBox.shrink()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget counterView(
      {int type = 1,
      String title,
      String subTitle,
      bool hasProgress = false,
      double value,
      double space = 0,
      Function onTap}) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: EdgeInsets.only(top: space),
        decoration: boxShadow.copyWith(
            color: type == 1 ? AppColor.c000333 : AppColor.whiteColor,
            borderRadius: BorderRadius.circular(5)),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        type == 1
                            ? "Tín chỉ đã hoàn thành:"
                            : "Tín chỉ trong học kỳ:",
                        style: fontInter(type == 1 ? 14 : 12,
                            fontWeight: FontWeight.w600,
                            color: type == 1
                                ? AppColor.c9d9daa
                                : AppColor.c8c8c8c),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        title ?? "",
                        style: fontInter(type == 1 ? 28 : 16,
                            fontWeight: FontWeight.w600,
                            color: type == 1
                                ? AppColor.whiteColor
                                : AppColor.c000333),
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
                  color: Color(type == 1 ? 0xff33355A : 0xffE6E6E6),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        type == 1 ? "ĐTBTL" : "Lịch thi",
                        style: fontInter(type == 1 ? 14 : 12,
                            fontWeight: FontWeight.w600,
                            color: type == 1
                                ? AppColor.c9d9daa
                                : AppColor.c8c8c8c),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        subTitle ?? "",
                        style: fontInter(type == 1 ? 28 : 16,
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
                    height: 18,
                    color: type == 1 ? AppColor.whiteColor : Color(0xff595C82))
              ],
            ),
            hasProgress == false
                ? SizedBox()
                : Container(
                    alignment: Alignment.center,
                    height: 50,
                    child: Container(
                        height: 7,
                        margin: EdgeInsets.only(top: 20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: LinearProgressIndicator(
                            backgroundColor:
                                AppColor.whiteColor.withOpacity(0.15),
                            valueColor:
                                AlwaysStoppedAnimation<Color>(AppColor.cfc2626),
                            value: (value.isNaN) ? 0 : value,
                          ),
                        )),
                  )
          ],
        ),
      ),
    );
  }
}
