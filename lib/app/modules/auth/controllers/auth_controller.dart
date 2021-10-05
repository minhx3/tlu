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

class UserCredential {
  static const requestOTP = 0;
  static const verifyOTP = 1;
  static const createNewPassword = 2;
}

class AuthController extends AppController {
  final rxForgotPassword = false.obs;
  final tabIndex = 0.obs;
  final forgotStatus = ForgotStatus.requestOTP.obs;
  final rxErrMessage = "".obs;
  final rxUserNameValidate = "".obs;
  final rxPasswordValidate = "".obs;

  final TextEditingController usernameTextEdit =
      TextEditingController(text: "A00374");
  final TextEditingController passwordTextEdit =
      TextEditingController(text: "02011900");

  final TextEditingController usernameForgetCtrl = TextEditingController();

  final TextEditingController otpCtrl = TextEditingController();
  final TextEditingController newPassCtrl = TextEditingController();
  final TextEditingController reNewPassCtrl = TextEditingController();

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
    rxErrMessage("");
    rxUserNameValidate("");
    rxPasswordValidate("");
    tabIndex(index);
  }

  void setForgotStatus(int value) => forgotStatus(value);

  loginUser() async {
    rxUserNameValidate(
        usernameTextEdit.text.isEmpty ? "Vui lòng nhập tài khoản" : "");
    rxPasswordValidate(
        passwordTextEdit.text.isEmpty ? "Vui lòng nhập mật khẩu" : "");

    if (usernameTextEdit.text.isEmpty || passwordTextEdit.text.isEmpty) {
      rxErrMessage("Vui lòng nhập tài khoản/mật khẩu");
      return;
    }

    final userType = tabIndex() == 0 ? Constant.student : Constant.teacher;
    showLoadingGlobal();
    final result = await Appclient.shared
        .loginUser(
            username: usernameTextEdit.text,
            password: passwordTextEdit.text,
            type: userType)
        .whenComplete(() {
      hideLoadingGlobal();
    });
    if (result != null) {
      Storage.setAccessToken(result.accessToken);
      Storage.setUserId(usernameTextEdit.text);
      Storage.setUserType(userType);
      rxErrMessage("");
      pushReplaceAllTo(Routes.INDEX);
    } else {
      rxErrMessage("Tài khoản/ mật khẩu không đúng");
    }
  }

  void createForgotPass() async {
    if (usernameForgetCtrl.text.isEmpty) {
      return;
    }
    bool res =
        await Appclient.shared.forgoPassword(username: usernameForgetCtrl.text);
    if (res) {
      setForgotStatus(ForgotStatus.verifyOTP);
    }
  }

  void sendVerifyOtp() async {
    if (otpCtrl.text.isEmpty) {
      return;
    }
    bool res = await Appclient.shared.verifyOTP(otp: otpCtrl.text);
    if (res) {
      setForgotStatus(ForgotStatus.createNewPassword);
    }
  }

  void confirmNewPass() async {
    if (newPassCtrl.text.isEmpty || reNewPassCtrl.text.isEmpty) {
      return;
    }
    if (newPassCtrl.text != reNewPassCtrl.text) {
      return;
    }
    bool res = await Appclient.shared.confirmPassword(
        otp: otpCtrl.text,
        pass: newPassCtrl.text,
        passConfirm: reNewPassCtrl.text,
        phone: usernameForgetCtrl.text);
    if (res) {
      rxForgotPassword.toggle();
    }
  }
}
