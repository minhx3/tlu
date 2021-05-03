import 'package:get/get.dart';

class ScheduleController extends GetxController {
  //TODO: Implement ScheduleController

  final tagIndex = 0.obs;
  final isFilter = false.obs;
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

  setTag(int index) => tagIndex(index);
  switchFilter() => isFilter(!isFilter());
}
