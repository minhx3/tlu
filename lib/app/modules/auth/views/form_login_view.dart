import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/modules/auth/controllers/auth_controller.dart';
import 'package:thanglong_university/app/views/views/button_view.dart';
import 'package:thanglong_university/app/views/views/textfield_view.dart';
import 'package:thanglong_university/generated/locales.g.dart';

class FormLoginView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return SlideInLeft(
      child: Obx(() => Column(
            children: [
              Container(
                  height: 34,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppColor.ce6e6e6),
                      borderRadius: BorderRadius.circular(16),
                      color: AppColor.cf2f2f2),
                  child: Row(
                    children: [
                      tabItem(0, LocaleKeys.auth_student_tab.tr),
                      tabItem(1, LocaleKeys.auth_teacher_tab.tr),
                    ],
                  )),
              TextFieldView(
                label: controller.tabIndex() == 0
                    ? LocaleKeys.auth_student_label.tr
                    : LocaleKeys.auth_teacher_label.tr,
                controller: controller.usernameTextEdit,
                hintText: controller.tabIndex() == 0
                    ? LocaleKeys.auth_student_hint.tr
                    : LocaleKeys.auth_teacher_hint.tr,
                verticalSpacing: 20,
              ),
              TextFieldView(
                label: LocaleKeys.auth_password_label.tr,
                hintText: LocaleKeys.auth_password_hint.tr,
                controller: controller.passwordTextEdit,
                obscureText: true,
                verticalSpacing: 12,
              ),
              Obx(() => controller.rxErrUserNamePassword().isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(top: 17),
                      child: Text(
                        controller.rxErrUserNamePassword(),
                        textAlign: TextAlign.center,
                        style: fontInter(12,
                            fontWeight: FontWeight.w500,
                            color: AppColor.cfc7171),
                      ),
                    )
                  : SizedBox()),
              ButtonView(
                verticalSpacing: 17,
                title: LocaleKeys.auth_login_button.tr,
                onTap: () {
                  // pushReplaceAllTo(Routes.INDEX);
                  controller.loginUser();
                },
              ),
            ],
          )),
    );
  }

  Widget tabItem(int index, String title) {
    return Expanded(
      child: InkWell(
        onTap: () {
          controller.setTab(index);
        },
        child: Container(
          alignment: Alignment.center,
          height: 28,
          margin: EdgeInsets.all(2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: controller.tabIndex() == index
                  ? AppColor.c33355a
                  : Colors.transparent),
          child: Text(
            title,
            style: fontInter(12,
                color: controller.tabIndex() == index
                    ? Colors.white
                    : AppColor.c4d4d4d,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
