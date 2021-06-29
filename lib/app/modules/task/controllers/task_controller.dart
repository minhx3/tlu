import 'package:get/get.dart';
import 'package:thanglong_university/app/model/subject_model.dart';

class TaskController extends GetxController {
  //TODO: Implement TaskController

  final count = 0.obs;
  SubjectModel subjectItem = Get.arguments;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
