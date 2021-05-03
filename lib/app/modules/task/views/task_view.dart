import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/modules/task/views/teacher_item_view.dart';
import 'package:thanglong_university/app/views/views/app_bar_view.dart';
import 'package:thanglong_university/app/views/views/app_widget.dart';

import '../controllers/task_controller.dart';

class TaskView extends GetView<TaskController> {
  @override
  Widget build(BuildContext context) {
    return AppContainer(
      systemUiOverlayStyle: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Column(
          children: [
            AppBarView(
              type: AppBarType.button,
              title: "Chi tiết task",
              buttonTitle: "Thêm note",
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(16),
                children: [
                  headerView(),
                  TeacherItemView(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Column headerView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: AppColor.appBarDarkBackground,
                  borderRadius: BorderRadius.circular(5)),
              height: 24,
              width: 65,
              alignment: Alignment.center,
              child: Text(
                "Lớp học",
                style: fontInter(12,
                    fontWeight: FontWeight.w600, color: AppColor.whiteColor),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              child: SizedBox(),
            )
          ],
        ),
        Text(
          "Tài chính quốc tế \nTỉ giá hối đoái (P.1) ",
          textAlign: TextAlign.left,
          style: fontInter(24,
              fontWeight: FontWeight.w600,
              color: AppColor.appBarDarkBackground),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              Images.timeClock,
              height: 20,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "10h00 - 16/01/2021",
              style: fontInter(14,
                  fontWeight: FontWeight.w600, color: AppColor.errorColor),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(Images.location,
                height: 20, fit: BoxFit.contain, color: AppColor.textColor),
            SizedBox(
              width: 10,
            ),
            Text(
              "Phòng 605",
              style: fontInter(14,
                  fontWeight: FontWeight.w600, color: AppColor.textColor),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ],
    );
  }
}
