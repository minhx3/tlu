import 'package:get/get.dart';

class TranscriptController extends GetxController {
  final count = 0.obs;
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
  void increment() => count.value++;

  setFilter(bool value) => isFilter(value);
}
