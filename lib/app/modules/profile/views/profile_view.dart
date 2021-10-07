import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/model/user_info_model.dart';
import 'package:thanglong_university/app/modules/profile/views/partial/settings_student_section_view.dart';
import 'package:thanglong_university/app/modules/user_info/views/partial/header_info_student_view.dart';
import 'package:thanglong_university/app/modules/user_info/views/partial/header_info_teacher_view.dart';
import 'package:thanglong_university/app/service/storage/storage.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: isTeacher ? teacherProfileView() : studentProfileView(),
    );
  }

  studentProfileView() {
    return Obx(() {
      UserInfo userInfo = controller.rxUserInfo();
      return ListView(
        padding: EdgeInsets.only(top: Get.mediaQuery.padding.top, bottom: 20),
        children: [
          HeaderInfoStudentView(
            isAllowEdit: true,
            user: userInfo,
          ),
          SettingsStudentSectionView(userSettings: controller.rxUserSetting())
        ],
      );
    });
  }

  teacherProfileView() {
    return Obx(() {
      UserInfo userInfo = controller.rxUserInfo();
      return ListView(
        padding: EdgeInsets.only(top: Get.mediaQuery.padding.top, bottom: 20),
        children: [
          HeaderInfoTeacherView(
            isAllowEdit: true,
            user: userInfo,
          ),
          SettingsStudentSectionView(userSettings: controller.rxUserSetting())
        ],
      );
    });
  }
}

// class _TeacherProfileView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       padding: EdgeInsets.only(top: Get.mediaQuery.padding.top, bottom: 20),
//       itemBuilder: (context, index) {
//         if (index == 0) {
//           return HeaderInfoTeacherView(isAllowEdit: false);
//         } else if (index == 1) {
//           return HeaderTimeTableView();
//         } else if (index == 5 - 1) {
//           return _ReadMoreTimeTableLastPeriodView();
//         } else {
//           return ItemGroupTimeTableBySubjectView();
//         }
//       },
//       itemCount: 5,
//     );
//   }
// }

@deprecated
// ignore: unused_element
class _ReadMoreTimeTableLastPeriodView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
      child: FlatButton(
        height: 40,
        onPressed: () {},
        color: AppColor.whiteColor,
        shape: OutlineInputBorder(),
        child: Text(
          'Xem thêm các kì trước',
          style: fontInter(14,
              color: Color(0xFF7A7B93), fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
