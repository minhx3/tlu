import 'package:get/get.dart';
import 'package:thanglong_university/app/model/schedule_model.dart';

class TaskController extends GetxController {
  final count = 0.obs;
  ScheduleModel subjectItem = Get.arguments;
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
