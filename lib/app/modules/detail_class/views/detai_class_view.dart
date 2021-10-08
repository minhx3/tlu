import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/configuration/constant/view_state.dart';
import 'package:thanglong_university/app/configuration/extension/int.dart';
import 'package:thanglong_university/app/enums/subject_class_status.dart';
import 'package:thanglong_university/app/modules/subject_list_cart/controllers/subject_list_cart_controller.dart';
import 'package:thanglong_university/app/modules/subject_list_term/controllers/subject_list_term_controller.dart';
import 'package:thanglong_university/app/modules/task/views/teacher_item_view.dart';
import 'package:thanglong_university/app/modules/transcript/views/detail_transcript_subject_view.dart';
import 'package:thanglong_university/app/views/views/app_bar_view.dart';
import 'package:thanglong_university/app/views/views/app_widget.dart';
import 'package:thanglong_university/app/views/views/button_view.dart';

import '../controllers/detai_class_controller.dart';

// ignore: must_be_immutable
class DetaiClassView extends GetView<DetaiClassController> {
  @override
  Widget build(BuildContext context) {
    bool isStudying = Get.arguments['type'] == ClassDetailType.studying;
    bool isStudied = Get.arguments['type'] == ClassDetailType.studied;
    bool isEdu = isStudying || isStudied;
    return AppContainer(
      systemUiOverlayStyle: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        body: Column(
          children: [
            AppBarView(
              title: "Chi tiết lớp",
              type: AppBarType.icon,
              iconSize: 36,
              iconLeading: isEdu ? null : Images.plus,
              iconTintColor: AppColor.cfc2626,
              onAction: () {
                registerSubjectClass();
              },
            ),
            Obx(() {
              if (controller.rxViewState() == ViewState.loading) {
                return Expanded(
                    child: Center(child: CircularProgressIndicator()));
              }
              return Expanded(
                child: controller?.subjectClassData == null
                    ? Text("Lớp học không tồn tại").paddingAll(10)
                    : ListView(
                        padding: EdgeInsets.all(16),
                        children: [
                          Text(
                            controller.subjectClassData?.subject?.name ?? "",
                            style: fontInter(24,
                                fontWeight: FontWeight.bold,
                                color: AppColor.c000333),
                          ).marginOnly(bottom: 20),
                          boardTimeLine(),
                          lineWidget(),
                          IntrinsicHeight(
                            child: Row(
                              children: <Widget>[
                                item("Mã môn:",
                                    controller.subjectClassData?.subject?.id),
                                VerticalDivider(
                                  thickness: 1,
                                  width: 30,
                                  color: AppColor.lineColor,
                                ),
                                item("Số tín chỉ:",
                                    "${(controller.subjectClassData?.subject?.credits ?? "").toString()} tín"),
                                VerticalDivider(
                                  thickness: 1,
                                  width: 30,
                                  color: AppColor.lineColor,
                                ),
                                item("Hệ số:",
                                    "${(controller.subjectClassData?.subject?.factor ?? "").toString()}"),
                                VerticalDivider(
                                  thickness: 1,
                                  width: 30,
                                  color: AppColor.lineColor,
                                ),
                                item(
                                    "Học phí",
                                    controller.subjectClassData?.schoolFee
                                        ?.currency(),
                                    isLast: true),
                              ],
                            ).paddingSymmetric(horizontal: 5),
                          ),
                          lineWidget(),
                          ...controller.subjectClassData.listTimelineClass
                              .map((e) => Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      item(
                                              controller
                                                          .subjectClassData
                                                          .listTimelineClass
                                                          .length ==
                                                      1
                                                  ? "Mã lớp:"
                                                  : "Mã lớp ${e.isExerciseClass == false ? "lý thuyết" : "thực hành"}:",
                                              e?.id ?? "",
                                              isLast: true)
                                          .paddingSymmetric(horizontal: 5),
                                      lineWidget(),
                                    ],
                                  ))
                              .toList(),
                          ...controller.subjectClassData.listTimelineClass
                              .map((e) {
                            return Column(children: [
                              TeacherItemView(e.teacher)
                                  .paddingSymmetric(horizontal: 5)
                                  .marginOnly(bottom: 10),
                              Divider(
                                thickness: 1,
                                height: 1,
                                color: AppColor.lineColor,
                              ).marginOnly(bottom: 10),
                            ]);
                          }).toList(),
                          expansionDescription().marginOnly(bottom: 22),
                          documentWidget(
                                  "Tài liệu cần thiết",
                                  controller.subjectClassData.requiredListBook
                                      .map((e) =>
                                          {"title": e.name, "author": e.author})
                                      .toList())
                              .paddingSymmetric(horizontal: 5)
                              .marginOnly(bottom: 20),
                          documentWidget(
                                  "Tài liệu liên quan",
                                  controller.subjectClassData.optionListBook
                                      .map((e) =>
                                          {"title": e.name, "author": e.author})
                                      .toList())
                              .paddingSymmetric(horizontal: 5),
                          lineWidget().marginSymmetric(vertical: 3),
                          Text(
                            "Mô tả môn",
                            style: fontInter(14,
                                fontWeight: FontWeight.w600,
                                color: AppColor.c4d4d4d),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )
                              .marginOnly(bottom: 2)
                              .paddingOnly(bottom: 10)
                              .paddingSymmetric(horizontal: 5),
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
                                        color: AppColor.black))
                                .marginOnly(bottom: 14),
                          )
                              .paddingSymmetric(horizontal: 5)
                              .marginOnly(bottom: 16),
                          isEdu
                              ? SizedBox.shrink()
                              : ButtonView(
                                  title: "Đăng ký học",
                                  onTap: () {
                                    registerSubjectClass();
                                  },
                                ),
                        ],
                      ),
              );
            }),
          ],
        ),
        // bottomNavigationBar: getBottomBar(),
      ),
    );
  }

  Widget expansionDescription() {
    return Column(children: [
      SizeTransition(
        axis: Axis.vertical,
        axisAlignment: 0,
        sizeFactor: controller.collapseAnimation,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          item(
                  "Số tiết học:",
                  (controller.subjectClassData?.numberOfLessons ?? [])
                      .map((e) => "${e.quanlity} tiết ${e.type}")
                      .join(" + "),
                  isLast: true)
              .paddingSymmetric(horizontal: 5),
          lineWidget(),
          item(
                  "Môn tiên quyết:",
                  controller.subjectClassData?.prerequisiteSubject?.name ??
                      "Không yêu cầu",
                  isLast: true)
              .paddingSymmetric(horizontal: 5),
          lineWidget(),
          item("Điều kiện thi:",
                  controller.subjectClassData?.examConditions ?? "",
                  isLast: true)
              .paddingSymmetric(horizontal: 5),
          lineWidget(),
          item("Cách tính điểm:",
                  controller.subjectClassData?.scoringMethod ?? "",
                  isLast: true)
              .paddingSymmetric(horizontal: 5),
          lineWidget(),
        ]),
      ),
      IconButton(
          constraints: BoxConstraints(maxHeight: 23),
          icon: Image.asset(
              controller.collapsed() ? Images.dropup : Images.dropdown,
              width: 14,
              height: 7,
              color: AppColor.c000333),
          // (
          //     !controller.collapsed()
          //         ? Icons.keyboard_arrow_down
          //         : Icons.keyboard_arrow_up,
          //     color: AppColor.c000333,
          //     size: 28),
          onPressed: () {
            controller.collapseAnimate();
            if (controller.collapseController.value == 0) {
              controller.collapseController.forward();
            } else {
              controller.collapseController.reverse();
            }
          })
    ]);
  }

  void registerSubjectClass() {
    if (controller.subjectClassData.status == SubjectClassStatusEnum.REGI) {
      SubjectListTermController _controller = Get.find();
      _controller.confirmRegisterSubject(controller.subjectClassData);
    } else {
      SubjectListCartController _controller = Get.find();
      _controller.confirmAddToCart(controller.subjectClassData);
    }
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
        ).marginOnly(bottom: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...books
                .map(
                  (e) => Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
                        ).marginOnly(bottom: 4),
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
                  ),
                )
                .toList()
          ],
        ),
      ],
    );
  }

  Widget boardTimeLine() {
    return Container(
      padding: EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: AppColor.cfafafa,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: controller.columnList
            .asMap()
            .map((index, e) {
              bool isLast = index + 1 == controller.columnList.length;
              Widget _content = IntrinsicWidth(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: AppColor.cf2f2f2, width: 1))),
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(bottom: 7, top: 5),
                      child: Text(
                        e['title'],
                        style: fontInter(11,
                            color: AppColor.c808080,
                            fontWeight: FontWeight.w500),
                      ).marginOnly(left: 5, right: isLast ? 5 : 30),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: (e['data'] as List)
                          .map(
                            (i) => Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 6),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  i,
                                  style: fontInter(12,
                                      color:
                                          controller.columnList.length == 4 &&
                                                  index == 0
                                              ? AppColor.cb3b4c2
                                              : AppColor.c4d4d4d,
                                      fontWeight: FontWeight.w600),
                                )),
                          )
                          .toList(),
                    ).paddingOnly(left: 5, right: isLast ? 5 : 30),
                  ],
                ),
              );
              return MapEntry(
                  index, isLast ? Expanded(child: _content) : _content);
            })
            .values
            .toList(),
      ),
    );
  }

  Widget lineWidget() {
    return Divider(
      thickness: 1,
      height: 24,
      color: AppColor.lineColor,
    );
  }

  Widget item(String title, String subTitle, {bool isLast = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: fontInter(11,
              fontWeight: FontWeight.w500, color: AppColor.c808080),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ).marginOnly(bottom: 2),
        Text(
          subTitle,
          softWrap: true,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: fontInter(14,
              fontWeight: FontWeight.w600, color: AppColor.c4d4d4d),
        ),
      ],
    );
  }
}
