// @dart=2.9
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:screen_autosize/screen_autosize.dart';

import 'app/configuration/base/app_binding.dart';
import 'app/configuration/constant/constant.dart';
import 'app/routes/app_pages.dart';
import 'app/service/notification.dart';
import 'generated/locales.g.dart';
import 'package:timeago/timeago.dart' as timeago;

class Binding extends AutoSizeWidgetsFlutterBinding{
  static WidgetsBinding ensureInitialized() {
    if (WidgetsBinding.instance == null) Binding();
    return WidgetsBinding.instance;
  }
}

void main() async {
  AutoSizeUtils.instance.initConfig(baseWidth: 375);

  Binding.ensureInitialized();
  await Firebase.initializeApp();
  NotificationFCB.instance.takeFCMTokenWhenAppLaunch();
  NotificationFCB.instance.initLocalNotification();

  timeago.setLocaleMessages('vi', timeago.ViMessages());

  await GetStorage.init();

  GetPlatform.isWeb
      ? runApp(GetMaterialApp(
          title: "Application",
          initialRoute: Routes.AUTH,
          getPages: AppPages.routes,
          initialBinding: AppBinding(),
          locale: Locale(Constant.defautLocale),
          defaultTransition: Transition.native,
          translationsKeys: AppTranslation.translations,
        ))
      : runAutoSizeApp(GetMaterialApp(
          title: "Application",
          initialRoute: Routes.INDEX,
          getPages: AppPages.routes,
          initialBinding: AppBinding(),
          locale: Locale(Constant.defautLocale),
          defaultTransition: Transition.cupertino,
          translationsKeys: AppTranslation.translations,
        ));
}
