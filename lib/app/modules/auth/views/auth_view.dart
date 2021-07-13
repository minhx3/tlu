import 'package:flutter/material.dart';
import 'package:thanglong_university/app/modules/auth/views/mobile/login_mobile_page.dart';
import 'package:thanglong_university/app/modules/auth/views/web/login_web_page.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AuthView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, info) {
      // Check the sizing information here and return your UI
      if (info.deviceScreenType == DeviceScreenType.desktop) {
        return Scaffold(
          body: LoginWebPageView(),
        );
      } else {
        return LoginMobilePage();
      }
    });
  }
}
