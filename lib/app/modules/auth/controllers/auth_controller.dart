import 'package:get/get.dart';

class AuthController extends GetxController {
  //TODO: Implement AuthController
  final rxForgotPassword = false.obs;
  final tabIndex = 0.obs;
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
}
