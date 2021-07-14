import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';
import 'package:thanglong_university/app/modules/auth/controllers/auth_controller.dart';
import 'package:thanglong_university/app/modules/auth/views/form_forgot_view.dart';
import 'package:thanglong_university/app/routes/app_pages.dart';
import 'package:thanglong_university/app/views/views/link_view.dart';
import 'package:thanglong_university/generated/locales.g.dart';

class ForgotWebPage extends GetView<AuthController> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, info) {
      return Scaffold(
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: Get.height,
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
                        Center(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: (Get.width - Get.width * 0.65) *
                                    0.7 *
                                    0.08),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(width: 1, color: AppColor.ce6e6e6),
                              borderRadius: BorderRadius.circular(5),
                              color: AppColor.whiteColor,
                            ),
                            width: (Get.width - Get.width * 0.65) * 0.7,
                            height: 408,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 96,
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    LocaleKeys.auth_forgot_button.tr,
                                    style: fontInter(30,
                                        fontWeight: FontWeight.w600,
                                        color: AppColor.c000333),
                                  ),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 0.5,
                                              color: AppColor.c8c8c8c))),
                                ),
                                FormForgotView(),
                                Expanded(child: SizedBox()),
                                SizedBox(
                                  height: 50,
                                  child: Row(
                                    children: [
                                      LinkView(
                                        LocaleKeys.auth_login_button.tr,
                                        textColor: AppColor.cb3b3b3,
                                        onTap: () {
                                          pushTo(Routes.AUTH);
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
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
