import 'package:get/get.dart';

import '../controllers/subject_list_cart_controller.dart';

class SubjectListCartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubjectListCartController>(
      () => SubjectListCartController(),
    );
  }
}
