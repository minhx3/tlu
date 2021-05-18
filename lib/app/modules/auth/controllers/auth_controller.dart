import 'package:get/get.dart';

abstract class ForgotStatus {
  static const requestOTP = 0;
  static const verifyOTP = 1;
  static const createNewPassword = 2;
}

class AuthController extends GetxController {
  //TODO: Implement AuthController
  final rxForgotPassword = false.obs;
  final tabIndex = 0.obs;
  final forgotStatus = ForgotStatus.requestOTP.obs;
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
  void setTab(int index) => tabIndex(index);
  void setForgotStatus(int value) => forgotStatus(value);
}
