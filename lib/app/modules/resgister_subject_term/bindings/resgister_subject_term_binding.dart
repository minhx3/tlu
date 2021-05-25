import 'package:get/get.dart';

import '../controllers/resgister_subject_term_controller.dart';

class ResgisterSubjectTermBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ResgisterSubjectTermController>(
      () => ResgisterSubjectTermController(),
    );
  }
}
