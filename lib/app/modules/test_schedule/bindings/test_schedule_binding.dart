import 'package:get/get.dart';

import '../controllers/test_schedule_controller.dart';

class TestScheduleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestScheduleController>(
      () => TestScheduleController(),
    );
  }
}
