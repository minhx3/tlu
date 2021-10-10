
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:get_storage/get_storage.dart';
import 'package:screen_autosize/screen_autosize.dart';

import 'app/configuration/base/app_binding.dart';
import 'app/configuration/constant/constant.dart';
import 'app/routes/app_pages.dart';
import 'app/service/notification.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'generated/locales.g.dart';

class Binding extends AutoSizeWidgetsFlutterBinding{
  static WidgetsBinding ensureInitialized() {
    if (WidgetsBinding.instance == null) Binding();
    return WidgetsBinding.instance;
  }
}

void main()async {
  AutoSizeUtils.instance.initConfig(baseWidth: 375);
  Binding.ensureInitialized();
  await Firebase.initializeApp();
  NotificationFCB.instance.takeFCMTokenWhenAppLaunch();
  NotificationFCB.instance.initLocalNotification();

  timeago.setLocaleMessages('vi', timeago.ViMessages());

  await GetStorage.init();
  runAutoSizeApp(MyApp());
}



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      builder: (context, widget) {
        return MediaQueryWrapper(builder: (BuildContext context){
          return widget;
        },);
      },
      initialRoute: Routes.INDEX,
      getPages: AppPages.routes,
      initialBinding: AppBinding(),
      locale: Locale(Constant.defautLocale),
      defaultTransition: Transition.cupertino,
      translationsKeys: AppTranslation.translations,
    );
  }
}
