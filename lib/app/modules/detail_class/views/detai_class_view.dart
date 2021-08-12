import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';
import 'package:thanglong_university/app/configuration/constant/view_state.dart';
import 'package:thanglong_university/app/enums/subject_class_status.dart';
import 'package:thanglong_university/app/modules/subject_list_cart/controllers/subject_list_cart_controller.dart';
import 'package:thanglong_university/app/modules/subject_list_term/controllers/subject_list_term_controller.dart';
import 'package:thanglong_university/app/modules/task/views/teacher_item_view.dart';
import 'package:thanglong_university/app/views/views/app_bar_view.dart';
import 'package:thanglong_university/app/views/views/app_widget.dart';
import 'package:thanglong_university/app/configuration/extension/int.dart';
import 'package:thanglong_university/app/views/views/button_view.dart';

import '../controllers/detai_class_controller.dart';

// ignore: must_be_immutable
class DetaiClassView extends GetView<DetaiClassController> {
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
              iconSize: 50,
              iconLeading: Images.plus,
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
                                fontWeight: FontWeight.w700,
                                color: AppColor.c000333),
                          ).marginOnly(bottom: 20),
                          boardTimeLine(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              item("Mã môn:", controller.subjectClassData?.id),
                              item("Số tín chỉ:",
                                  "${(controller.subjectClassData?.subject?.credits ?? "").toString()} tín"),
                              item("Hệ số:",
                                  "${(controller.subjectClassData?.subject?.factor ?? "").toString()}"),
                              item(
                                  "Học phí",
                                  controller.subjectClassData?.schoolFee
                                      ?.currency(),
                                  isLast: true),
                            ],
                          ).paddingSymmetric(horizontal: 5),
                          lineWidget(),
                          item("Mã lớp:", controller.subjectClassData?.id ?? "",
                              isLast: true),
                          lineWidget(),
                          ...controller.subjectClassData.listTimelineClass
                              .map((e) {
                            return TeacherItemView(e.teacher);
                          }).toList(),
                          Column(children: [
                            SizeTransition(
                              axis: Axis.vertical,
                              axisAlignment: 0,
                              sizeFactor: controller.collapseAnimation,
                              child: Column(children: [
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
                                    controller.subjectClassData
                                            ?.prerequisiteSubject?.name ??
                                        "Không yêu cầu",
                                    isLast: true),
                                lineWidget(),
                                item(
                                    "Điều kiện thi:",
                                    controller
                                            .subjectClassData?.examConditions ??
                                        "",
                                    isLast: true),
                                lineWidget(),
                                item(
                                    "Cách tính điểm:",
                                    controller
                                            .subjectClassData?.scoringMethod ??
                                        "",
                                    isLast: true),
                                lineWidget(),
                              ]),
                            ),
                            IconButton(
                                icon: Icon(
                                    !controller.collapsed()
                                        ? Icons.keyboard_arrow_down
                                        : Icons.keyboard_arrow_up,
                                    size: 30),
                                onPressed: () {
                                  controller.collapseAnimate();
                                  if (controller.collapseController.value ==
                                      0) {
                                    controller.collapseController.forward();
                                  } else {
                                    controller.collapseController.reverse();
                                  }
                                })
                          ]),
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
                              registerSubjectClass();
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: controller.columnList
                .asMap()
                .map((index, e) {
                  Widget _content = IntrinsicWidth(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: AppColor.cf2f2f2, width: 1))),
                          alignment: Alignment.centerLeft,
                          height: 30,
                          child: Text(
                            e['title'],
                            style: fontInter(11,
                                color: AppColor.c808080,
                                fontWeight: FontWeight.w500),
                          ).paddingSymmetric(horizontal: 15),
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
                        ).paddingSymmetric(horizontal: 15)
                      ],
                    ),
                  );
                  return MapEntry(
                      index,
                      index + 1 == controller.columnList.length
                          ? Expanded(child: _content)
                          : _content);
                })
                .values
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
                softWrap: true,
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
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  width: 1,
                  height: 35,
                  color: AppColor.cd9d9d9,
                ),
        ],
      ),
    );
  }
}
