import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';
import 'package:thanglong_university/app/modules/auth/controllers/auth_controller.dart';
import 'package:thanglong_university/app/routes/app_pages.dart';
import 'package:thanglong_university/app/views/views/button_view.dart';
import 'package:thanglong_university/app/views/views/link_view.dart';
import 'package:thanglong_university/app/views/views/textfield_view.dart';
import 'package:thanglong_university/generated/locales.g.dart';

class FormLoginView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return SlideInLeft(
      child: Obx(() => Column(
            children: [
              Container(
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: AppColor.inputBackground),
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
                hintText: controller.tabIndex() == 0
                    ? LocaleKeys.auth_student_hint.tr
                    : LocaleKeys.auth_teacher_hint.tr,
                verticalSpacing: 20,
                hasError: true,
              ),
              TextFieldView(
                label: LocaleKeys.auth_password_label.tr,
                hintText: LocaleKeys.auth_password_hint.tr,
                obscureText: true,
                verticalSpacing: 20,
              ),
              ButtonView(
                verticalSpacing: 25,
                title: LocaleKeys.auth_login_button.tr,
                onTap: () {
                  pushReplaceAllTo(Routes.INDEX);
                },
              ),
              Container(
                alignment: Alignment.center,
                child: LinkView(
                  LocaleKeys.auth_forgot_button.tr,
                  onTap: () {
                    controller.rxForgotPassword(true);
                  },
                ),
                height: 50,
              )
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
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color: controller.tabIndex() == index
                  ? AppColor.textColor
                  : Colors.transparent),
          child: Text(
            title,
            style: fontInter(12,
                color: controller.tabIndex() == index
                    ? Colors.white
                    : AppColor.textColor,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
