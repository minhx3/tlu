import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thanglong_university/app/configuration/base/app_controller.dart';
import 'package:thanglong_university/app/configuration/constant/constant.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';
import 'package:thanglong_university/app/routes/app_pages.dart';
import 'package:thanglong_university/app/service/api/app_client.dart';
import 'package:thanglong_university/app/service/storage/storage.dart';

abstract class ForgotStatus {
  static const requestOTP = 0;
  static const verifyOTP = 1;
  static const createNewPassword = 2;
}

class AuthController extends AppController {
  //TODO: Implement AuthController
  final rxForgotPassword = false.obs;
  final tabIndex = 0.obs;
  final forgotStatus = ForgotStatus.requestOTP.obs;
  final TextEditingController usernameTextEdit =
      TextEditingController(text: "A00374");
  final TextEditingController passwordTextEdit =
      TextEditingController(text: "02011900");

  final rxErrUserNamePassword = "".obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void setTab(int index) {
    // usernameTextEdit?.clear();
    // passwordTextEdit?.clear();
    rxErrUserNamePassword("");
    tabIndex(index);
  }

  void setForgotStatus(int value) => forgotStatus(value);

  loginUser() async {
    bool isCheckUserPassword =
        usernameTextEdit.text.isEmpty && passwordTextEdit.text.isEmpty;

    rxErrUserNamePassword(isCheckUserPassword == true
        ? "Vui lòng nhập tài khoản, mật khẩu đăng nhập"
        : "");
    if (isCheckUserPassword == false) {
      bool isCheckUser = usernameTextEdit.text.isEmpty;
      rxErrUserNamePassword(
          isCheckUser == true ? "Vui lòng nhập tài khoản" : "");

      bool isCheckPassword = passwordTextEdit.text.isEmpty;
      rxErrUserNamePassword(
          isCheckPassword == true ? "Vui lòng nhập mật khẩu" : "");
      final userType = tabIndex() == 0 ? Constant.student : Constant.teacher;
      if (rxErrUserNamePassword().isEmpty) {
        showLoadingGlobal();
        final result = await Appclient.shared.loginUser(
            username: usernameTextEdit.text,
            password: passwordTextEdit.text,
            type: userType);
        if (result != null) {
          2.delay(() {
            hideLoadingGlobal();
          });
          print(result.accessToken);
          Storage.setAccessToken(result.accessToken);
          Storage.setUserType(userType);
          rxErrUserNamePassword("");
          pushReplaceAllTo(Routes.INDEX);
        } else {
          rxErrUserNamePassword("Tài khoản/ mật khẩu không đúng");
        }
      }
    }
  }
}
