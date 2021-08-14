import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graphx/graphx.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';
import 'package:thanglong_university/app/modules/subject_list_cart/controllers/subject_list_cart_controller.dart';
import 'package:thanglong_university/app/modules/subject_list_term/models/subject_filter.dart';
import 'package:thanglong_university/app/modules/subject_list_term/views/subject_item_view.dart';
import 'package:thanglong_university/app/routes/app_pages.dart';
import 'package:thanglong_university/app/views/views/app_bar_view.dart';
import 'package:thanglong_university/app/views/views/app_widget.dart';
import 'package:thanglong_university/app/views/views/button_view.dart';
import 'package:thanglong_university/app/configuration/extension/int.dart';
import '../controllers/subject_list_term_controller.dart';

// ignore: must_be_immutable
class SubjectListTermView extends GetView<SubjectListTermController> {
  Timer _debounce;

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: Scaffold(
        backgroundColor: AppColor.cf2f2f2,
        body: Column(
          children: [
            AppBarView(
              title: controller.queryParams?.semsterInfo?.name ?? '',
              type: AppBarType.white,
              onAction: () {
                pushTo(Routes.TRANSCRIPT);
              },
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Image.asset(
                          Images.icSearch,
                          height: 16,
                          width: 16,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: TextFormField(
                          controller: controller.textEditController,
                          onChanged: (value) {
                            SubjectFilter filter = controller.subjectFilter() ??
                                new SubjectFilter();
                            if (_debounce?.isActive ?? false)
                              _debounce.cancel();
                            _debounce =
                                Timer(const Duration(milliseconds: 500), () {
                              filter.title = value.trim().toLowerCase();
                              // _textController.text = value.trim();
                              controller.filterSubject(filter);
                            });
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Tên/Mã lớp/Mã môn",
                              isDense: true,
                              hintStyle:
                                  fontInter(12, color: AppColor.cb3b3b3)),
                        ))
                      ],
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: AppColor.cd9d9d9)),
                  ),
                ),
                Obx(() => Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: !controller.filterCollapsed()
                              ? AppColor.ce6e6e6
                              : AppColor.c33355a),
                      width: 40,
                      height: 40,
                      margin: EdgeInsets.only(left: 6),
                      child: IconButton(
                        onPressed: () {
                          if (!controller.filterCollapsed()) {
                            controller.expandController.forward();
                          } else {
                            controller.expandController.reverse();
                          }
                          controller.collapseFilterForm();
                        },
                        icon: Icon(
                          Icons.filter_alt,
                          size: 18,
                          color: controller.filterCollapsed()
                              ? Colors.white
                              : AppColor.c84869C,
                        ),
                      ),
                    )),
              ],
            ).paddingAll(16),
            SizeTransition(
              axis: Axis.vertical,
              axisAlignment: 0.8,
              sizeFactor: controller.filterFormAnimation,
              child: Obx(() {
                SubjectFilter filter = controller.subjectFilter();
                return Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Chọn thứ",
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w600),
                        ).marginSymmetric(vertical: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ...["CN", 2, 3, 4, 5, 6, 7]
                                .asMap()
                                .map((index, value) {
                                  int dayIdx = filter.day.indexWhere(
                                      (element) => element == index);
                                  return MapEntry(
                                    index,
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          if (dayIdx >= 0) {
                                            filter.day.removeAt(dayIdx);
                                            dayIdx = -1;
                                          } else {
                                            filter.day.add(index);
                                            dayIdx = 0;
                                          }
                                          controller.updateFilter(filter);
                                          controller.filterSubject();
                                        },
                                        child: Container(
                                          height: 36,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 11, horizontal: 16),
                                          decoration: BoxDecoration(
                                              color: dayIdx >= 0
                                                  ? AppColor.c84869C
                                                  : AppColor.ce6e6e6,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(
                                                      index == 0 ? 3 : 0),
                                                  bottomLeft: Radius.circular(
                                                      index == 0 ? 3 : 0),
                                                  topRight: Radius.circular(
                                                      index == 6 ? 3 : 0),
                                                  bottomRight: Radius.circular(
                                                      index == 6 ? 3 : 0))),
                                          child: Text(value.toString(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: dayIdx >= 0
                                                      ? Colors.white
                                                      : AppColor.c000333,
                                                  fontSize: 11)),
                                        ),
                                      ),
                                    ),
                                  );
                                })
                                .values
                                .toList()
                          ],
                        )
                      ],
                    ).marginOnly(bottom: 5),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Lọc theo ca",
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w600),
                        ).marginSymmetric(vertical: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            ...["Sáng", "Chiều", "Tối"]
                                .asMap()
                                .map((index, value) {
                                  int timeIdx = filter.time.indexWhere(
                                      (element) => element == index);
                                  return MapEntry(
                                    index,
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          if (timeIdx >= 0) {
                                            filter.time.removeAt(timeIdx);
                                            timeIdx = -1;
                                          } else {
                                            filter.time.add(index);
                                            timeIdx = 0;
                                          }
                                          controller.updateFilter(filter);
                                          controller.filterSubject();
                                        },
                                        child: Container(
                                          height: 36,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 11, horizontal: 16),
                                          decoration: BoxDecoration(
                                              color: timeIdx >= 0
                                                  ? AppColor.c84869C
                                                  : AppColor.ce6e6e6,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(
                                                      index == 0 ? 3 : 0),
                                                  bottomLeft: Radius.circular(
                                                      index == 0 ? 3 : 0),
                                                  topRight: Radius.circular(
                                                      index == 6 ? 3 : 0),
                                                  bottomRight: Radius.circular(
                                                      index == 6 ? 3 : 0))),
                                          child: Text(value.toString(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: timeIdx >= 0
                                                      ? Colors.white
                                                      : AppColor.c000333,
                                                  fontSize: 11)),
                                        ),
                                      ),
                                    ),
                                  );
                                })
                                .values
                                .toList()
                          ],
                        )
                      ],
                    ).marginOnly(bottom: 5),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      padding: EdgeInsets.symmetric(vertical: 7),
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  width: 1, color: AppColor.ce6e6e6))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              controller.textEditController.text = "";
                              controller.updateFilter();
                              controller.filterSubject();
                              controller.expandController.reverse();
                              controller.collapseFilterForm();
                            },
                            child: Text(
                              "Huỷ chọn",
                              style: fontInter(10,
                                  color: AppColor.c000333,
                                  fontWeight: FontWeight.w600),
                            ).paddingAll(9),
                          ).marginOnly(right: 5),
                        ],
                      ),
                    ),
                  ],
                );
              }),
            ).paddingSymmetric(horizontal: 25),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 16),
                children: [
                  Text(
                    "Danh sách lớp học",
                    style: fontInter(14,
                        color: AppColor.cbfbfbf, fontWeight: FontWeight.w600),
                  ).marginOnly(top: 15),
                  Obx(() => ListView(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(top: 10),
                      physics: NeverScrollableScrollPhysics(),
                      children: (controller.registerSubjects ?? [])
                          .map((element) => SubjectItemView(
                                subject: element,
                              ))
                          .toList()))
                ],
              ),
            ),
            GetBuilder<SubjectListCartController>(
              init: SubjectListCartController(),
              builder: (subjectCartcontroller) => Container(
                height: 70 + context.mediaQueryPadding.bottom,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(
                    bottom: context.mediaQueryPadding.bottom,
                    left: 16,
                    right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    blockItem("Số tín chỉ:",
                        "${subjectCartcontroller.rxSubjectCart()?.sumCredits ?? 0} tín"),
                    SizedBox(
                      width: 25,
                    ),
                    blockItem("Học phí dự tính:",
                        "${(subjectCartcontroller.rxSubjectCart()?.sumSchoolFee ?? 0).currency('VNĐ')}"),
                    Expanded(
                      child: SizedBox(),
                    ),
                    SizedBox(
                      width: 108,
                      child: ButtonView(
                        verticalSpacing: 0,
                        title: "Danh sách",
                        horizontalSpacing: 10,
                        onTap: () {
                          pushTo(Routes.SUBJECT_LIST_CART);
                        },
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    color: AppColor.c000333,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(3),
                        topRight: Radius.circular(3))),
              ),
            ),
          ],
        ),
        bottomNavigationBar: getBottomBar(),
      ),
    );
  }

  Widget blockItem(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: fontInter(11,
              fontWeight: FontWeight.w500, color: AppColor.c808080),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          content,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: fontInter(14,
              fontWeight: FontWeight.w600, color: AppColor.whiteColor),
        ),
      ],
    );
  }
}
