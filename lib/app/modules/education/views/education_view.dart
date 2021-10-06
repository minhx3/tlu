import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/views/views/app_bar_view.dart';
import 'package:thanglong_university/app/views/views/app_widget.dart';

import '../controllers/education_controller.dart';
import 'education_teacher_view.dart';

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
            EducationTeacherView()
          ],
        ),
      ),
    );
  }
}
