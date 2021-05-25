import 'package:get/get.dart';

import '../controllers/subject_list_term_controller.dart';

class SubjectListTermBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubjectListTermController>(
      () => SubjectListTermController(),
    );
  }
}
