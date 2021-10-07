import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';
import 'package:thanglong_university/app/model/chat/group_chat_model.dart';
import 'package:thanglong_university/app/model/schedule_teacher_model.dart';
import 'package:thanglong_university/app/modules/chat/views/item_group_chat_by_subject_view.dart';
import 'package:thanglong_university/app/modules/education/views/education_subject_item_view.dart';
import 'package:thanglong_university/app/routes/app_pages.dart';
import 'package:thanglong_university/app/views/views/app_bar_view.dart';
import 'package:thanglong_university/app/views/views/app_widget.dart';
import 'package:thanglong_university/app/views/views/button_view.dart';

import '../controllers/education_controller.dart';
import 'education_teacher_item_view.dart';

class EducationTeacherView extends GetView<EducationController> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Obx(() {
            Map<String, List<ScheduleTeacherModel>> scheduleTeacher =
                controller.rxScheduleTeacherList();
            if (scheduleTeacher == null) {
              return SizedBox.shrink();
            }
            return Column(
              children: scheduleTeacher.entries
                  .map((e) => _ItemGroupByTeacherSubjectView(
                      isLastItem: e.key.contains(scheduleTeacher.keys.last),
                      subjectName: e.key,
                      itemChilds: e.value))
                  .toList(),
            );
          }),
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
              ? SizedBox.shrink()
              : SizedBox.shrink()),
        ],
      ),
    );
  }
}

class _ItemGroupByTeacherSubjectView extends StatelessWidget {
  final String subjectName;
  final bool isLastItem;
  final List<ScheduleTeacherModel> itemChilds;

  const _ItemGroupByTeacherSubjectView(
      {Key key,
      @required this.subjectName,
      @required this.itemChilds,
      this.isLastItem = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 10),
          child: Text(
            subjectName,
            style: fontInter(16,
                color: AppColor.c4d4d4d, fontWeight: FontWeight.w600),
          ),
        ),
        ListView(
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: itemChilds
              .map((e) => EducationTeacherItemView(
                    item: e,
                  ))
              .toList(),
        ),
        SizedBox(
          height: 20,
        ),
        !isLastItem
            ? Divider(
                thickness: 2,
                indent: 15,
                endIndent: 15,
                color: AppColor.ce6e6e6,
              )
            : SizedBox.shrink(),
      ],
    );
  }
}
