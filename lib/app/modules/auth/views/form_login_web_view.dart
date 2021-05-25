import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../configuration/constant/color.dart';
import '../../../configuration/constant/font_style.dart';
import '../../../configuration/constant/global.dart';
import '../../../routes/app_pages.dart';
import '../../../views/views/button_view.dart';
import '../../../views/views/link_view.dart';
import '../../../views/views/textfield_view.dart';
import '../controllers/auth_controller.dart';

class FormLoginWebView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: (Get.width - Get.width * 0.65) * 0.7 * 0.08),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: AppColor.ce6e6e6),
        borderRadius: BorderRadius.circular(5),
        color: AppColor.whiteColor,
      ),
      width: (Get.width - Get.width * 0.65) * 0.7,
      height: Get.height * 570 / 1080,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 96,
            alignment: Alignment.centerLeft,
            child: Text(
              controller.rxForgotPassword() == true
                  ? LocaleKeys.auth_forgot_button.tr
                  : LocaleKeys.auth_login_title.tr,
              style: fontInter(30,
                  fontWeight: FontWeight.w600, color: AppColor.c000333),
            ),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 0.5, color: AppColor.c8c8c8c))),
          ),
          TextFieldView(
            label: controller.tabIndex() == 0
                ? LocaleKeys.auth_student_label.tr
                : LocaleKeys.auth_teacher_label.tr,
            hintText: controller.tabIndex() == 0
                ? LocaleKeys.auth_student_hint.tr
                : LocaleKeys.auth_teacher_hint.tr,
            verticalSpacing: 20,
          ),
          TextFieldView(
            label: LocaleKeys.auth_password_label.tr,
            hintText: LocaleKeys.auth_password_hint.tr,
            obscureText: true,
            verticalSpacing: 20,
          ),
          ButtonView(
            verticalSpacing: 30,
            title: LocaleKeys.auth_login_button.tr,
            onTap: () {
              pushReplaceAllTo(Routes.INDEX);
            },
          ),
          Expanded(child: SizedBox()),
          SizedBox(
            height: 50,
            child: Row(
              children: [
                LinkView(
                  controller.rxForgotPassword() == true
                      ? LocaleKeys.auth_login_button.tr
                      : LocaleKeys.auth_forgot_button.tr,
                  textColor: AppColor.cb3b3b3,
                  onTap: () {
                    controller.rxForgotPassword(!controller.rxForgotPassword());
                  },
                ),
                Expanded(
                  child: SizedBox(),
                ),
                LinkView(
                  LocaleKeys.auth_help_button.tr,
                  textColor: AppColor.cb3b3b3,
                  onTap: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
