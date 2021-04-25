import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thanglong_university/app/service/storage/storage.dart';

import 'color.dart';

pushTo(String routeName, {Object arguments}) async {
  return Get.toNamed(routeName, arguments: arguments);
}

pushReplaceTo(String routeName, {Object arguments}) async {
  return Get.offAndToNamed(routeName, arguments: arguments);
}

pushReplaceAllTo(String routeName, {Object arguments}) async {
  return Get.offAllNamed(routeName, arguments: arguments);
}

pop({dynamic result}) async {
  return Get.back(result: result);
}

changeLanguage(String locale) {
  Storage.setLanguage(locale);
  Get.updateLocale(Locale(locale));
}

showLoading({bool isTransparent = false}) => Get.dialog(
    WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: SizedBox(
          height: 35,
          child: CircularProgressIndicator(
            backgroundColor: Colors.white.withOpacity(0.5),
            strokeWidth: 2,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
      ),
    ),
    barrierDismissible: false,
    barrierColor: isTransparent == false
        ? Colors.black.withOpacity(0.5)
        : Colors.transparent);

hideLoading() => pop();

centerloading({double size = 35, Color backgroundColor, Color activeColor}) =>
    Center(
        child: SizedBox(
      height: size,
      width: size,
      child: CircularProgressIndicator(
        backgroundColor: backgroundColor ?? Colors.white.withOpacity(0.5),
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(activeColor ?? Colors.white),
      ),
    ));

showErrorMessage({String title, String message}) => Get.snackbar(
      title ?? null,
      message ?? "",
      isDismissible: true,
      overlayColor: Colors.white,
      borderRadius: 10,
      colorText: Colors.white,
      animationDuration: Duration(milliseconds: 300),
      backgroundColor: AppColor.errorColor,
    );

showMessage({String title, String message, Duration duration}) => Get.snackbar(
      title ?? null,
      message ?? "",
      isDismissible: true,
      overlayColor: Colors.white,
      borderRadius: 10,
      colorText: Colors.white,
      duration: duration ?? Duration(milliseconds: 300),
      backgroundColor: Colors.black,
    );

delay(Function onCompleted, {int time = 2}) {
  Future.delayed(Duration(seconds: time)).whenComplete(onCompleted);
}

var boxShadow = BoxDecoration(boxShadow: [
  BoxShadow(
    blurRadius: 6,
    spreadRadius: 2,
    color: Colors.black.withOpacity(0.15),
  ),
], color: AppColor.whiteColor);
