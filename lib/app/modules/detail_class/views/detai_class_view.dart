import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';
import 'package:thanglong_university/app/configuration/constant/view_state.dart';
import 'package:thanglong_university/app/modules/task/views/teacher_item_view.dart';
import 'package:thanglong_university/app/views/views/app_bar_view.dart';
import 'package:thanglong_university/app/views/views/app_widget.dart';
import 'package:thanglong_university/app/configuration/extension/int.dart';
import 'package:thanglong_university/app/views/views/button_view.dart';

import '../controllers/detai_class_controller.dart';

// ignore: must_be_immutable
class DetaiClassView extends GetView<DetaiClassController> {
  Animation<double> _animation;
  @override
  Widget build(BuildContext context) {
    return AppContainer(
      systemUiOverlayStyle: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        body: Column(
          children: [
            AppBarView(
              title: "Chi tiết lớp",
              type: AppBarType.white,
              iconLeading: Images.plus,
              iconTintColor: AppColor.primaryColor,
              onAction: () {},
            ),
            Obx(() {
              if (controller.rxViewState() == ViewState.loading) {
                return Expanded(
                    child: Center(child: CircularProgressIndicator()));
              }
              return Expanded(
                child: controller.subjectClassData == null
                    ? Text("Lớp học không tồn tại").paddingAll(10)
                    : ListView(
                        padding: EdgeInsets.all(16),
                        children: [
                          Text(
                            controller.subjectClassData?.subject?.name ?? "",
                            style: fontInter(24,
                                fontWeight: FontWeight.w700,
                                color: AppColor.c000333),
                          ).marginOnly(bottom: 20),
                          boardTimeLine(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              item("Mã môn:", controller.subjectClassData?.id),
                              item(
                                  "Số tín chỉ:",
                                  (controller.subjectClassData?.subject
                                                  ?.credits ??
                                              "?")
                                          .toString() +
                                      " tín"),
                              item(
                                  "Hệ số:",
                                  (controller.subjectClassData?.subject
                                              ?.factor ??
                                          "?")
                                      .toString()),
                              item(
                                  "Học phí",
                                  controller.subjectClassData?.schoolFee
                                      ?.currency(),
                                  isLast: true),
                            ],
                          ),
                          lineWidget(),
                          item("Mã lớp:", controller.subjectClassData?.id ?? "",
                              isLast: true),
                          lineWidget(),
                          ...controller.subjectClassData.listTimelineClass
                              .map((e) {
                            return TeacherItemView(e.teacher);
                          }).toList(),
                          Obx(() {
                            _animation = Tween<double>(
                                    begin: !controller.collapsed() ? 0 : 0.5,
                                    end: !controller.collapsed() ? 0.5 : 0)
                                .animate(
                                    controller.collapseIconAnimationController);
                            return Column(children: [
                              AnimatedSize(
                                // height:
                                //     !controller.collapsed() ? 0 : double.infinity,
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.fastOutSlowIn,
                                vsync: controller,
                                child: !controller.collapsed()
                                    ? SizedBox()
                                    : Column(children: [
                                        item(
                                            "Số tiết học:",
                                            (controller.subjectClassData
                                                        ?.numberOfLessons ??
                                                    [])
                                                .map((e) =>
                                                    "${e.quanlity} tiết ${e.type}")
                                                .join(" + "),
                                            isLast: true),
                                        lineWidget(),
                                        item(
                                            "Môn tiên quyết:",
                                            controller
                                                    .subjectClassData
                                                    ?.prerequisiteSubject
                                                    ?.name ??
                                                "Không yêu cầu",
                                            isLast: true),
                                        lineWidget(),
                                        item(
                                            "Điều kiện thi:",
                                            controller.subjectClassData
                                                    ?.examConditions ??
                                                "",
                                            isLast: true),
                                        lineWidget(),
                                        item(
                                            "Cách tính điểm:",
                                            controller.subjectClassData
                                                    ?.scoringMethod ??
                                                "",
                                            isLast: true),
                                        lineWidget(),
                                      ]),
                              ),
                              RotationTransition(
                                turns: _animation,
                                child: IconButton(
                                    icon: Icon(Icons.keyboard_arrow_down,
                                        size: 30),
                                    onPressed: () {
                                      controller.collapseAnimate();
                                      controller.collapseAnimationController
                                          .forward(
                                              from: controller.collapsed()
                                                  ? 0.5
                                                  : 0);
                                    }),
                              )
                            ]);
                          }),
                          documentWidget(
                              "Tài liệu cần thiết",
                              controller.subjectClassData.requiredListBook
                                  .map((e) =>
                                      {"title": e.name, "author": e.author})
                                  .toList()),
                          documentWidget(
                              "Tài liệu liên quan",
                              controller.subjectClassData.optionListBook
                                  .map((e) =>
                                      {"title": e.name, "author": e.author})
                                  .toList()),
                          lineWidget(),
                          Text(
                            "Mô tả môn",
                            style: fontInter(14,
                                fontWeight: FontWeight.w600,
                                color: AppColor.c4d4d4d),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )
                              .marginOnly(bottom: 2)
                              .paddingOnly(top: 15, bottom: 10),
                          Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: AppColor.cfafafa,
                                borderRadius: BorderRadius.circular(3)),
                            child: Text(
                                controller.subjectClassData?.subject
                                        ?.description ??
                                    "",
                                style: fontInter(12,
                                    fontWeight: FontWeight.normal,
                                    color: AppColor.black)),
                          ),
                          ButtonView(
                            title: "Đăng ký học",
                            onTap: () {
                              showConfirmDialog(
                                  actions: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 150,
                                        child: ButtonView(
                                          backgroundColor: AppColor.c000333,
                                          horizontalSpacing: 5,
                                          title: "Hủy",
                                          onTap: () {
                                            Navigator.of(Get.context).pop();
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        width: 150,
                                        child: ButtonView(
                                          horizontalSpacing: 5,
                                          title: "Xác nhận",
                                        ),
                                      ),
                                    ],
                                  ),
                                  messageWidget: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        "Bạn có chắc chắn muốn đăng kí lớp",
                                        style: TextStyle(
                                            color: AppColor.c4d4d4d,
                                            fontSize: 12),
                                      ),
                                      Text(
                                        "${controller.subjectClassData.subject.name} - ${controller.subjectClassData.listTimelineClass[0].getAllTime} ?",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: AppColor.c4d4d4d,
                                            fontSize: 12),
                                      )
                                    ],
                                  ),
                                  titleWidget: RichText(
                                    text: TextSpan(
                                      text: 'Xác nhận ',
                                      style: TextStyle(
                                          color: AppColor.c000333,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                      children: const <TextSpan>[
                                        TextSpan(
                                            text: 'Đăng ký lớp',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                                color: AppColor.c31B27C)),
                                      ],
                                    ),
                                  ));
                            },
                          ).marginOnly(top: 16),
                        ],
                      ),
              );
            }),
          ],
        ),
      ),
    );
  }

  Column documentWidget(String label, List<Map<String, String>> books) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: fontInter(14,
              fontWeight: FontWeight.w600, color: AppColor.c4d4d4d),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ).marginOnly(bottom: 2).paddingOnly(top: 15, bottom: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...books
                .map((e) => Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: AppColor.cfafafa,
                          borderRadius: BorderRadius.circular(3)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            e["title"],
                            style: fontInter(14,
                                fontWeight: FontWeight.w600,
                                color: AppColor.black),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ).marginOnly(bottom: 2),
                          (e["author"].isEmpty
                              ? SizedBox()
                              : Text(
                                  e["author"],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: fontInter(11,
                                      fontWeight: FontWeight.w500,
                                      color: AppColor.c808080),
                                )),
                        ],
                      ),
                    ).marginOnly(bottom: 5))
                .toList()
          ],
        ),
      ],
    );
  }

  Column boardTimeLine() {
    return Column(
      children: [
        Container(
          color: AppColor.cfafafa,
          alignment: Alignment.center,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: controller.columnList
                .map(
                  (e) => Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 30,
                          child: Text(
                            e['title'],
                            style: fontInter(11,
                                color: AppColor.c808080,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: (e['data'] as List)
                              .map(
                                (i) => Container(
                                    alignment: Alignment.centerLeft,
                                    height: 30,
                                    child: Text(
                                      i,
                                      style: fontInter(12,
                                          color: controller.columnList.length ==
                                                      4 &&
                                                  controller.columnList
                                                          .indexOf(e) ==
                                                      0
                                              ? AppColor.c000333
                                                  .withOpacity(0.3)
                                              : AppColor.c4d4d4d,
                                          fontWeight: FontWeight.w600),
                                    )),
                              )
                              .toList(),
                        )
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        lineWidget(),
      ],
    );
  }

  Container lineWidget() {
    return Container(
      margin: EdgeInsets.only(top: 12),
      height: 1,
      color: AppColor.cd9d9d9,
    );
  }

  Widget item(String title, String subTitle, {bool isLast = false}) {
    return Container(
      padding: EdgeInsets.only(top: 16),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: fontInter(11,
                    fontWeight: FontWeight.w500, color: AppColor.c808080),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                subTitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: fontInter(14,
                    fontWeight: FontWeight.w600, color: AppColor.c4d4d4d),
              ),
            ],
          ),
          isLast == true
              ? SizedBox()
              : Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  width: 1,
                  height: 35,
                  color: AppColor.cd9d9d9,
                ),
        ],
      ),
    );
  }
}
