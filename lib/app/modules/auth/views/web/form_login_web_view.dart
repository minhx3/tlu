import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';
import 'package:thanglong_university/app/modules/auth/controllers/auth_controller.dart';
import 'package:thanglong_university/app/modules/auth/views/form_login_view.dart';
import 'package:thanglong_university/app/routes/app_pages.dart';
import 'package:thanglong_university/app/views/views/link_view.dart';
import 'package:thanglong_university/generated/locales.g.dart';

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
      height: 450,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 96,
            alignment: Alignment.centerLeft,
            child: Text(
              LocaleKeys.auth_login_title.tr,
              style: fontInter(30,
                  fontWeight: FontWeight.w600, color: AppColor.c000333),
            ),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 0.5, color: AppColor.c8c8c8c))),
          ),
          SizedBox(height: 20),
          FormLoginView(),
          Expanded(child: SizedBox()),
          SizedBox(
            height: 50,
            child: Row(
              children: [
                LinkView(
                  LocaleKeys.auth_forgot_button.tr,
                  textColor: AppColor.cb3b3b3,
                  onTap: () {
                    pushTo(Routes.AUTH_FORGOT);
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
