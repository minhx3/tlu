import 'package:get/get.dart';
import 'package:thanglong_university/app/modules/education/controllers/education_controller.dart';
import 'package:thanglong_university/app/modules/home/controllers/home_controller.dart';

import '../controllers/index_controller.dart';

class IndexBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<EducationController>(
      () => EducationController(),
    );
    Get.lazyPut<IndexController>(
      () => IndexController(),
    );
  }
}
