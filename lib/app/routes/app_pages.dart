import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:thanglong_university/app/modules/auth/bindings/auth_binding.dart';
import 'package:thanglong_university/app/modules/auth/views/auth_view.dart';
import 'package:thanglong_university/app/modules/home/bindings/home_binding.dart';
import 'package:thanglong_university/app/modules/home/views/home_view.dart';
import 'package:thanglong_university/app/modules/index/bindings/index_binding.dart';
import 'package:thanglong_university/app/modules/index/views/index_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.AUTH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
        name: _Paths.INDEX,
        page: () => IndexView(),
        binding: IndexBinding(),
        transition: Transition.noTransition),
  ];
}
