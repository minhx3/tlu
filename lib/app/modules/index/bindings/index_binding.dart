import 'package:get/get.dart';
import 'package:thanglong_university/app/modules/chat/controllers/chat_cotroller.dart';
import 'package:thanglong_university/app/modules/education/controllers/education_controller.dart';
import 'package:thanglong_university/app/modules/home/controllers/home_controller.dart';
import 'package:thanglong_university/app/modules/profile/controllers/profile_controller.dart';
import 'package:thanglong_university/app/modules/schedule/controllers/schedule_controller.dart';

import '../controllers/index_controller.dart';

class IndexBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScheduleController>(
      () => ScheduleController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.put<EducationController>(
      EducationController(),
    );
    Get.put<ProfileController>(
      ProfileController(),
    );
    Get.lazyPut(() => ChatController()
    );
    Get.lazyPut<IndexController>(
      () => IndexController(),
    );
  }
}
