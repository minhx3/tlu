import 'package:flutter/material.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/modules/user_info/views/partial/header_info_student_view.dart';
import 'package:thanglong_university/app/utils/screen/screen.dart';

class InfoStudentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.userInfoBackground,
      child: ListView(
        padding: EdgeInsets.only(bottom: Screen.bottomSafeHeight),
        children: [
          HeaderInfoStudentView(),
          // TimeTableUserView()
        ],
      ),
    );
  }
}
