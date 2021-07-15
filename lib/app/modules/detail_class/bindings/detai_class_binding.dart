import 'package:get/get.dart';

import '../controllers/detai_class_controller.dart';

class DetaiClassBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetaiClassController>(
      () => DetaiClassController(),
    );
  }
}
