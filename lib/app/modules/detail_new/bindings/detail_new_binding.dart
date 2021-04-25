import 'package:get/get.dart';

import '../controllers/detail_new_controller.dart';

class DetailNewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailNewController>(
      () => DetailNewController(),
    );
  }
}
