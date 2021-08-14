import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';
import 'package:thanglong_university/app/model/register_subject_entity.dart';
import 'package:thanglong_university/app/modules/subject_list_cart/controllers/subject_list_cart_controller.dart';
import 'package:thanglong_university/app/modules/subject_list_term/controllers/subject_list_term_controller.dart';
import 'package:thanglong_university/app/views/views/app_bar_view.dart';
import 'package:thanglong_university/app/views/views/app_widget.dart';
import 'package:thanglong_university/app/views/views/button_view.dart';
import 'package:thanglong_university/app/configuration/extension/int.dart';

class SubjectListCartView extends GetView<SubjectListCartController> {
  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: Scaffold(
        backgroundColor: AppColor.cf2f2f2,
        body: Column(
          children: [
            AppBarView(
              title: "Danh sách đã chọn",
              type: AppBarType.white,
            ),
            blockView(context),
            Expanded(
              child: Obx(() {
                return ListView(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Danh sách môn đăng kí",
                          style: fontInter(14,
                              color: AppColor.cbfbfbf,
                              fontWeight: FontWeight.w600),
                        ),
                        GestureDetector(
                          onTap: () => controller.changeEditMode(),
                          child: Row(
                            children: [
                              Text(
                                  controller.rxEditMode()
                                      ? 'Hủy chỉnh sửa '
                                      : 'Chỉnh sửa ',
                                  style: fontInter(11,
                                      color: controller.rxEditMode()
                                          ? AppColor.cfc2626
                                          : AppColor.c000333,
                                      fontWeight: FontWeight.w600)),
                              Icon(Icons.edit,
                                  size: 14,
                                  color: controller.rxEditMode()
                                      ? AppColor.cfc2626
                                      : AppColor.c000333),
                            ],
                          ),
                        ),
                      ],
                    ).paddingOnly(top: 20, bottom: 10),
                    ListView(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: NeverScrollableScrollPhysics(),
                        children: controller
                            .rxSubjectCart()
                            .subjectClasses
                            .asMap()
                            .map((index, e) {
                              return MapEntry(
                                  index,
                                  subjectItem(
                                      index + 1, e, controller.rxEditMode()));
                            })
                            .values
                            .toList()
                        // List.generate(6, (e) => subjectItem()).toList(),
                        )
                  ],
                );
              }),
            ),
          ],
        ),
        bottomNavigationBar: getBottomBar(),
      ),
    );
  }

  Container subjectItem(
      [int index = 1, RegisterSubjectEntity subject, bool editMode = false]) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: AppColor.whiteColor, borderRadius: BorderRadius.circular(3)),
      padding: EdgeInsets.symmetric(horizontal: 16),
      height: 65,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "$index.",
            style: fontInter(14,
                color: AppColor.c808080, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Text(
              subject.name ?? subject.id,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: fontInter(14,
                  color: AppColor.c000333, fontWeight: FontWeight.w600),
            ),
          ),
          item("Thời gian", subject.getAllTime),
          InkWell(
            onTap: () {
              if (editMode) {
                controller.confirmRemoveCart(subject);
              } else {
                SubjectListTermController _controller = Get.find();
                _controller.confirmRegisterSubject(subject);
              }
            },
            child: Container(
              width: 18,
              height: 18,
              child: Stack(
                children: [
                  Positioned(
                    top: -3,
                    left: editMode ? 5 : 3,
                    child: Text(
                      editMode ? "-" : "+",
                      style: fontInter(18,
                          color: AppColor.whiteColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: editMode ? AppColor.cfc2626 : AppColor.c000333,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget item(String title, String subTitle, {bool isLast = false}) {
    return Container(
      width: 120,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            width: 1,
            height: 35,
            color: AppColor.lineColor,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.end,
                  style: fontInter(11,
                      fontWeight: FontWeight.w500, color: AppColor.c808080),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Container(
                  width: 50,
                  child: Text(
                    subTitle,
                    textAlign: TextAlign.end,
                    maxLines: 2,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: fontInter(12,
                        fontWeight: FontWeight.w600, color: AppColor.c000333),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            width: 1,
            height: 35,
            color: AppColor.lineColor,
          ),
        ],
      ),
    );
  }

  void registerSubjectClass(RegisterSubjectEntity subject) {
    SubjectListTermController _controller = Get.find();
    _controller.confirmRegisterSubject(subject);
  }

  Container blockView(BuildContext context) {
    return Container(
      height: 70,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            blockItem("Số tín chỉ:",
                "${controller.rxSubjectCart()?.sumCredits ?? 0} tín"),
            SizedBox(
              width: 25,
            ),
            blockItem(
                "Học phí dự tính:",
                (controller.rxSubjectCart()?.sumSchoolFee ?? 0)
                    .currency("VNĐ")),
            Expanded(
              child: SizedBox(),
            ),
            SizedBox(
              width: 108,
              child: ButtonView(
                verticalSpacing: 0,
                title: "List môn",
                horizontalSpacing: 10,
              ),
            )
          ],
        ),
      ),
      color: AppColor.c000333,
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
