import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/modules/auth/controllers/auth_controller.dart';
import 'package:thanglong_university/app/views/views/button_view.dart';
import 'package:thanglong_university/app/views/views/link_view.dart';
import 'package:thanglong_university/app/views/views/textfield_view.dart';
import 'package:thanglong_university/generated/locales.g.dart';

class FormForgotView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => IndexedStack(
        index: controller.forgotStatus(),
        children: [
          Column(
            children: [
              TextFieldView(
                label: controller.tabIndex() == 0
                    ? LocaleKeys.auth_student_label.tr
                    : LocaleKeys.auth_teacher_label.tr,
                hintText: controller.tabIndex() == 0
                    ? LocaleKeys.auth_student_hint.tr
                    : LocaleKeys.auth_teacher_hint.tr,
                verticalSpacing: 12,
                controller: controller.usernameForgetCtrl,
              ),
              ButtonView(
                verticalSpacing: 12,
                title: LocaleKeys.auth_send_code_button.tr,
                onTap: () {
                  controller.createForgotPass();
                  // controller.setForgotStatus(ForgotStatus.verifyOTP);
                },
              ),
            ],
          ),
          Column(
            children: [
              TextFieldView(
                label: LocaleKeys.auth_otp_label.tr,
                hintText: LocaleKeys.auth_otp_label.tr,
                verticalSpacing: 12,
                controller: controller.otpCtrl,
              ),
              ButtonView(
                verticalSpacing: 12,
                title: LocaleKeys.auth_send_code_button.tr,
                onTap: () {
                  controller.sendVerifyOtp();
                  // controller.setForgotStatus(ForgotStatus.createNewPassword);
                },
              ),
              Container(
                alignment: Alignment.center,
                height: 50,
                child: LinkView(
                  LocaleKeys.auth_resend_otp.tr,
                  textColor: AppColor.c808080,
                  onTap: () {},
                ),
              ),
            ],
          ),
          Column(
            children: [
              TextFieldView(
                label: LocaleKeys.auth_new_password_label.tr,
                hintText: LocaleKeys.auth_new_password_hint.tr,
                verticalSpacing: 12,
                controller: controller.newPassCtrl,
              ),
              TextFieldView(
                label: LocaleKeys.auth_re_new_password_label.tr,
                hintText: LocaleKeys.auth_re_new_password_hint.tr,
                verticalSpacing: 12,
                controller: controller.reNewPassCtrl,
              ),
              ButtonView(
                onTap: () {
                  controller.confirmNewPass();
                },
                verticalSpacing: 12,
                title: LocaleKeys.auth_change_password_button.tr,
              ),
              Container(
                alignment: Alignment.center,
                height: 50,
                child: LinkView(
                  LocaleKeys.auth_cancel_forgot.tr,
                  textColor: AppColor.c808080,
                  onTap: () {
                    controller.rxForgotPassword(!controller.rxForgotPassword());
                    controller.setForgotStatus(ForgotStatus.requestOTP);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
