import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:thanglong_university/app/modules/auth/bindings/auth_binding.dart';
import 'package:thanglong_university/app/modules/auth/views/auth_view.dart';
import 'package:thanglong_university/app/modules/detail_new/bindings/detail_new_binding.dart';
import 'package:thanglong_university/app/modules/detail_new/views/detail_new_view.dart';
import 'package:thanglong_university/app/modules/education/bindings/education_binding.dart';
import 'package:thanglong_university/app/modules/education/views/education_view.dart';
import 'package:thanglong_university/app/modules/home/bindings/home_binding.dart';
import 'package:thanglong_university/app/modules/home/views/home_view.dart';
import 'package:thanglong_university/app/modules/index/bindings/index_binding.dart';
import 'package:thanglong_university/app/modules/index/views/index_view.dart';
import 'package:thanglong_university/app/modules/notification/bindings/notification_binding.dart';
import 'package:thanglong_university/app/modules/notification/views/notification_view.dart';
import 'package:thanglong_university/app/modules/task/bindings/task_binding.dart';
import 'package:thanglong_university/app/modules/task/views/task_view.dart';
import 'package:thanglong_university/app/modules/test_schedule/bindings/test_schedule_binding.dart';
import 'package:thanglong_university/app/modules/test_schedule/views/test_schedule_view.dart';
import 'package:thanglong_university/app/modules/transcript/bindings/transcript_binding.dart';
import 'package:thanglong_university/app/modules/transcript/views/transcript_view.dart';

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
    GetPage(
      name: _Paths.DETAIL_NEW,
      page: () => DetailNewView(),
      binding: DetailNewBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.TASK,
      page: () => TaskView(),
      binding: TaskBinding(),
    ),
    GetPage(
      name: _Paths.EDUCATION,
      page: () => EducationView(),
      binding: EducationBinding(),
    ),
    GetPage(
      name: _Paths.TRANSCRIPT,
      page: () => TranscriptView(),
      binding: TranscriptBinding(),
    ),
    GetPage(
      name: _Paths.TEST_SCHEDULE,
      page: () => TestScheduleView(),
      binding: TestScheduleBinding(),
    ),
  ];
}
