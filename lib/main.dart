import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/configuration/base/app_binding.dart';
import 'app/configuration/constant/constant.dart';
import 'app/routes/app_pages.dart';
import 'app/utils/auto_size/src/auto_size.dart';
import 'generated/locales.g.dart';

void main() {
  runAutoSizeApp(
      GetMaterialApp(
        title: "Application",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        initialBinding: AppBinding(),
        locale: Locale(Constant.defautLocale),
        defaultTransition: Transition.cupertino,
        translationsKeys: AppTranslation.translations,
      ),
      height: Constant.designHeight,
      width: Constant.designWidth);
}
