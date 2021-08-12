import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thanglong_university/app/model/user_model.dart';
import 'package:thanglong_university/app/modules/index/controllers/index_controller.dart';
import 'package:thanglong_university/app/modules/profile/controllers/profile_controller.dart';
import 'package:thanglong_university/app/service/storage/storage.dart';
import 'package:thanglong_university/app/views/views/custom_dialog.dart';
import 'package:thanglong_university/app/views/views/image_view.dart';
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

showErrorMessage(
        {String title,
        String message,
        int duration = 3,
        Widget titleWidget,
        Widget messageWidget}) =>
    Get.generalDialog(
        transitionDuration: Duration(milliseconds: 300),
        barrierLabel: "",
        barrierDismissible: true,
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> animationSecond) {
          Future.delayed(Duration(seconds: duration), () {
            if (Get.isDialogOpen) Navigator.of(Get.context).pop();
          });

          return CustomAlertDialog(
            scrollable: true,
            elevation: 6,
            title: Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8)),
                        color: AppColor.cfc7171),
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: title != null
                        ? Text("$title",
                            style: TextStyle(
                                color: AppColor.c000333,
                                fontSize: 16,
                                fontWeight: FontWeight.w600))
                        : (titleWidget ?? SizedBox()),
                  )
                ])),
            alignMent: Alignment.topCenter,
            insetPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 85),
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            titlePadding: EdgeInsets.zero,
            content: (message != null
                    ? Text("$message",
                        style: TextStyle(
                            color: AppColor.c4d4d4d,
                            fontSize: 12,
                            fontWeight: FontWeight.w500))
                    : messageWidget)
                .marginOnly(bottom: 20, top: 4),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10))),
          );
        },
        useRootNavigator: false,
        barrierColor: Colors.black.withOpacity(0.3));

showMessage(
        {String title,
        String message,
        int duration = 3,
        Widget titleWidget,
        Widget messageWidget}) =>
    Get.generalDialog(
            transitionDuration: Duration(milliseconds: 300),
            barrierLabel: "",
            barrierDismissible: true,
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> animationSecond) {
              Future.delayed(Duration(seconds: duration), () {
                if (Get.isDialogOpen) Navigator.of(Get.context).pop();
              });

              return CustomAlertDialog(
                scrollable: true,
                elevation: 6,
                title: Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8)),
                            color: AppColor.c31B27C),
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: title != null
                            ? Text("$title",
                                style: TextStyle(
                                    color: AppColor.c000333,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600))
                            : (titleWidget ?? SizedBox()),
                      )
                    ])),
                alignMent: Alignment.topCenter,
                insetPadding:
                    EdgeInsets.symmetric(horizontal: 15, vertical: 85),
                contentPadding: EdgeInsets.only(top: 20, left: 20, bottom: 20),
                titlePadding: EdgeInsets.zero,
                content: (message != null
                        ? Text("$message",
                            style: TextStyle(
                                color: AppColor.c4d4d4d,
                                fontSize: 12,
                                fontWeight: FontWeight.w500))
                        : messageWidget)
                    .marginOnly(bottom: 20, top: 4),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
              );
            },
            useRootNavigator: false,
            barrierColor: Colors.black.withOpacity(0.3))
        .then((exit) {
      return exit;
    });

showConfirmDialog(
        {String title,
        String message,
        Widget titleWidget,
        Widget messageWidget,
        Widget actions}) =>
    Get.generalDialog(
        transitionDuration: Duration(milliseconds: 300),
        barrierLabel: "",
        barrierDismissible: true,
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> animationSecond) {
          return CustomAlertDialog(
            scrollable: true,
            elevation: 6,
            title: Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8)),
                        color: AppColor.c000333),
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: title != null
                        ? Text("$title",
                            style: TextStyle(
                                color: AppColor.c000333,
                                fontSize: 16,
                                fontWeight: FontWeight.w600))
                        : (titleWidget ?? SizedBox()),
                  ).marginOnly(bottom: 4)
                ])),
            alignMent: Alignment.topCenter,
            insetPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 85),
            contentPadding: EdgeInsets.symmetric(horizontal: 20),
            titlePadding: EdgeInsets.zero,
            content: Column(
              children: [
                (message != null
                        ? Text("$message",
                            style: TextStyle(
                                color: AppColor.c4d4d4d,
                                fontSize: 12,
                                fontWeight: FontWeight.w500))
                        : messageWidget)
                    .marginOnly(top: 4),
                actions != null
                    ? Container(
                        margin: EdgeInsets.symmetric(vertical: 15),
                        height: 1,
                        color: AppColor.cd9d9d9,
                      )
                    : SizedBox(),
                actions != null ? actions.marginOnly(bottom: 15) : SizedBox()
              ],
            ),
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10))),
          );
        },
        useRootNavigator: false,
        barrierColor: Colors.black.withOpacity(0.3));

delay(Function onCompleted, {int time = 2}) {
  Future.delayed(Duration(seconds: time)).whenComplete(onCompleted);
}

getBottomBar() {
  return GetBuilder<IndexController>(builder: (tx) {
    UserModel _profile = ProfileController.to.rxUserInfo();
    return BottomNavigationBar(
      onTap: (index) {
        tx.setTab(index);
        Get.toNamed(tx.sideMenuRoute[index]);
      },
      type: BottomNavigationBarType.fixed,
      items: tx.tabsList.map((e) {
        final index = tx.tabsList.indexOf(e);

        // replace profile tab by avatar image
        if (index == 4 && _profile?.avatar != null) {
          return BottomNavigationBarItem(
              icon: CircleAvatar(
                radius: 15,
                backgroundColor: AppColor.iconTabSelected,
                child: CircleAvatar(
                  radius: index == tx.rxTabIndex() ? 13.5 : 15,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(_profile.avatar),
                ),
              ),
              label: "");
        }

        return BottomNavigationBarItem(
            icon: ImageView(
              index == tx.rxTabIndex() ? e.iconSelected : e.icon,
              type: e.type ?? Type.assets,
              width: 24,
              height: 24,
              color: index == tx.rxTabIndex()
                  ? AppColor.iconTabSelected
                  : AppColor.iconTabUnSelected,
            ),
            label: "");
      }).toList(),
    );
  });
}

var boxShadow = BoxDecoration(boxShadow: [
  BoxShadow(
    blurRadius: 6,
    spreadRadius: 2,
    color: Colors.black.withOpacity(0.07),
  ),
], color: AppColor.whiteColor);
