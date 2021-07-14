import 'package:flutter/material.dart';
import 'package:flutter_animator/widgets/sliding_entrances/slide_in_left.dart';
import 'package:get/get.dart';
import 'package:keyboard_utils/keyboard_aware/keyboard_aware.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/constant.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/modules/auth/controllers/auth_controller.dart';
import 'package:thanglong_university/app/modules/auth/views/form_forgot_view.dart';
import 'package:thanglong_university/app/modules/auth/views/form_login_view.dart';
import 'package:thanglong_university/app/views/views/app_widget.dart';
import 'package:thanglong_university/app/views/views/link_view.dart';
import 'package:thanglong_university/generated/locales.g.dart';

class LoginMobilePage extends GetView<AuthController> {
  const LoginMobilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => AppContainer(
          viewState: controller.rxViewState(),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
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
                  height: double.infinity,
                  margin: EdgeInsets.only(
                      right:
                          Constant.designWidth - Constant.designWidth * 0.75),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          child: Obx(() => SafeArea(
                                  child: Row(
                                children: [
                                  Container(
                                    width: Constant.designWidth * 0.75,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
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
                                          margin: EdgeInsets.symmetric(
                                              vertical: 10),
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            controller.rxForgotPassword() ==
                                                    true
                                                ? LocaleKeys
                                                    .auth_forgot_button.tr
                                                : LocaleKeys
                                                    .auth_login_title.tr,
                                            style: fontInter(18,
                                                fontWeight: FontWeight.bold,
                                                color: AppColor.c000333),
                                          ),
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      width: 0.5,
                                                      color:
                                                          AppColor.c8c8c8c))),
                                        ),
                                        controller.rxForgotPassword() == true
                                            ? SlideInLeft(
                                                child: FormForgotView())
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
                      ],
                    ),
                  ),
                ),
                KeyboardAware(builder: (c, s) {
                  print("Keboard height: ${s.keyboardHeight.toString()}");

                  return s.isKeyboardOpen == true
                      ? SizedBox()
                      : Obx(
                          () => Container(
                            alignment: Alignment.bottomLeft,
                            padding: EdgeInsets.only(
                                left: 16,
                                right: Constant.designWidth -
                                    Constant.designWidth * 0.75 +
                                    16,
                                bottom:
                                    24 + context.mediaQueryViewInsets.bottom),
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
                          ),
                        );
                })
              ],
            ),
          ),
        ));
  }
}
