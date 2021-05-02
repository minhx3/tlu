import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/modules/user_info/views/partial/info_student_view.dart';
import 'package:thanglong_university/app/modules/user_info/views/partial/info_teacher_view.dart';
import 'package:thanglong_university/app/modules/user_info/views/partial/time_table_user_view.dart';
import 'package:thanglong_university/app/views/views/app_bar_view.dart';

import '../controllers/user_info_controller.dart';

class UserInfoView extends GetView<UserInfoController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBarView(),
      backgroundColor: AppColor.userInfoBackground,
      body: _ListContentView(),
    );
  }
}

class _AppBarView extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBarView(
      title: 'Thông tin sinh viên',
      buttonTitle: 'Chat',
      backgroundColor: Colors.white,
      iconTintColor: AppColor.textColor,
      titleColor: AppColor.textColor,
      type: AppBarType.button,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}

class _ListContentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: InfoStudentView(),
    );
  }
}
