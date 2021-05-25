import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/modules/auth/views/form_forgot_view.dart';
import 'package:thanglong_university/app/modules/auth/views/form_login_view.dart';
import 'package:thanglong_university/app/modules/auth/views/form_login_web_view.dart';
import 'package:thanglong_university/app/views/views/app_widget.dart';
import 'package:thanglong_university/app/views/views/link_view.dart';
import 'package:thanglong_university/generated/locales.g.dart';
import '../../../configuration/constant/color.dart';
import '../controllers/auth_controller.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'form_login_view.dart';

class AuthView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, info) {
      // Check the sizing information here and return your UI
      if (info.deviceScreenType == DeviceScreenType.desktop) {
        return Scaffold(
          body: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                height: 1080,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      width: Get.width * 0.65,
                      child: Stack(
                        children: [
                          Image.network(
                            Images.schoolBackground,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                          Positioned(
                            left: 35,
                            top: 35,
                            child: Image.network(
                              Images.logoWeb,
                              fit: BoxFit.contain,
                              width: 250,
                              height: 100,
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: Get.width - Get.width * 0.65,
                      child: Stack(
                        children: [
                          Image.network(
                            Images.loginBackground,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                          Center(child: FormLoginWebView())
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      } else {
        return AppContainer(
          child: Scaffold(
            //   resizeToAvoidBottomPadding: false,
            body: Stack(
              children: [
                Image.asset(
                  Images.background,
                  fit: BoxFit.fill,
                  height: double.infinity,
                  width: double.infinity,
                ),
                Container(
                  color: AppColor.whiteColor,
                  margin: EdgeInsets.only(right: Get.width - Get.width * 0.75),
                  child: Obx(() => SafeArea(
                          child: Row(
                        children: [
                          Container(
                            width: Get.width * 0.75,
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  height: 135,
                                  child: Image.asset(
                                    Images.logo,
                                    width: 187,
                                    height: 87,
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    controller.rxForgotPassword() == true
                                        ? LocaleKeys.auth_forgot_button.tr
                                        : LocaleKeys.auth_login_title.tr,
                                    style: fontInter(18,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.c000333),
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 0.5,
                                              color: AppColor.c8c8c8c))),
                                ),
                                controller.rxForgotPassword() == true
                                    ? FormForgotView()
                                    : FormLoginView()
                              ],
                            ),
                          ),
                          Expanded(
                            child: SizedBox(),
                          ),
                        ],
                      ))),
                ),
                Obx(() => Container(
                      alignment: Alignment.bottomLeft,
                      padding: EdgeInsets.only(
                          left: 16,
                          right: Get.width - Get.width * 0.75 + 16,
                          bottom: 24 + context.mediaQueryViewInsets.bottom),
                      child: Row(
                        children: [
                          LinkView(
                            controller.rxForgotPassword() == true
                                ? LocaleKeys.auth_login_button.tr
                                : LocaleKeys.auth_forgot_button.tr,
                            textColor: AppColor.cb3b3b3,
                            onTap: () {
                              controller.rxForgotPassword(
                                  !controller.rxForgotPassword());
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
                    ))
              ],
            ),
          ),
        );
      }
    });
  }
}
