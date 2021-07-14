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

showLoadingGlobal({bool isTransparent = true}) => Get.dialog(
    WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.8),
              borderRadius: BorderRadius.circular(10)),
          width: 80,
          height: 80,
          child: centerloading(size: 30),
        ),
      ),
    ),
    barrierDismissible: false,
    barrierColor: isTransparent == false
        ? Colors.black.withOpacity(0.5)
        : Colors.transparent);

hideLoadingGlobal() => pop();

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

showErrorMessage({String title, String message, int duration = 3}) =>
    Get.snackbar(title ?? null, message ?? "",
        isDismissible: true,
        overlayColor: Colors.white,
        borderRadius: 8,
        colorText: Colors.white,
        animationDuration: Duration(milliseconds: 300),
        duration: Duration(seconds: duration),
        backgroundColor: AppColor.errorColor,
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.all(10));

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
    color: Colors.black.withOpacity(0.07),
  ),
], color: AppColor.whiteColor);
