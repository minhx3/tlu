import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/modules/education/views/education_student_view.dart';
import 'package:thanglong_university/app/modules/index/controllers/index_controller.dart';
import 'package:thanglong_university/app/service/storage/storage.dart';
import 'package:thanglong_university/app/views/views/app_bar_view.dart';
import 'package:thanglong_university/app/views/views/app_widget.dart';

import '../controllers/education_controller.dart';
import 'education_teacher_view.dart';

class EducationView extends GetView<EducationController> {
  final IndexController indexController = Get.find();
  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: Scaffold(
        backgroundColor: AppColor.cf2f2f2,
        body: Column(
          children: [
            AppBarView(
              type: AppBarType.white,
              title: "Đào tạo",
              onBack: () {
                indexController.setTab(0);
              },
            ),
            isTeacher ? EducationTeacherView() : EducationStudentView()
          ],
        ),
      ),
    );
  }
}
