import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/modules/auth/controllers/auth_controller.dart';
import 'package:thanglong_university/app/views/views/button_view.dart';
import 'package:thanglong_university/app/views/views/link_view.dart';
import 'package:thanglong_university/app/views/views/textfield_view.dart';
import 'package:thanglong_university/generated/locales.g.dart';

class FormForgotView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return SlideInLeft(
      child: Obx(() => Column(
            children: [
              TextFieldView(
                label: controller.tabIndex() == 0
                    ? LocaleKeys.auth_student_label.tr
                    : LocaleKeys.auth_teacher_label.tr,
                hintText: controller.tabIndex() == 0
                    ? LocaleKeys.auth_student_hint.tr
                    : LocaleKeys.auth_teacher_hint.tr,
                verticalSpacing: 0,
                hasError: true,
              ),
              TextFieldView(
                label: LocaleKeys.auth_email_label.tr,
                hintText: LocaleKeys.auth_email_hint.tr,
                obscureText: true,
                verticalSpacing: 20,
              ),
              ButtonView(
                verticalSpacing: 25,
                title: LocaleKeys.auth_send_code_button.tr,
              ),
              Container(
                alignment: Alignment.center,
                child: LinkView(
                  LocaleKeys.auth_login_button.tr,
                  onTap: () {
                    controller.rxForgotPassword(false);
                  },
                ),
                height: 50,
              )
            ],
          )),
    );
  }
}
