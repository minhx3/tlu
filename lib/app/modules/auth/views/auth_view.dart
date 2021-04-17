import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/modules/auth/views/form_forgot_view.dart';
import 'package:thanglong_university/app/modules/auth/views/form_login_view.dart';
import 'package:thanglong_university/app/views/views/app_widget.dart';
import 'package:thanglong_university/app/views/views/button_view.dart';
import 'package:thanglong_university/app/views/views/link_view.dart';
import 'package:thanglong_university/app/views/views/textfield_view.dart';
import 'package:thanglong_university/generated/locales.g.dart';
import '../controllers/auth_controller.dart';

class AuthView extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Stack(
          children: [
            Image.asset(
              Images.background,
              fit: BoxFit.fitHeight,
              height: double.infinity,
              width: double.infinity,
            ),
            ListView(
              children: [
                Obx(() => SafeArea(
                        child: Row(
                      children: [
                        Container(
                          width: 265,
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
                                margin: EdgeInsets.symmetric(vertical: 20),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  controller.rxForgotPassword() == true
                                      ? LocaleKeys.auth_forgot_button.tr
                                      : LocaleKeys.auth_login_title.tr,
                                  style: fontInter(18,
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.textColor),
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 0.5,
                                            color: AppColor.lineColor))),
                              ),
                              controller.rxForgotPassword() == true
                                  ? FormForgotView()
                                  : FormLoginView()
                            ],
                          ),
                        ),
                        Expanded(
                          child: SizedBox(),
                        )
                      ],
                    ))),
              ],
            )
          ],
        ),
      ),
    );
  }
}
