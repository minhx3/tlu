import 'package:get/get.dart';

class DetaiClassController extends GetxController {
  //TODO: Implement DetaiClassController

  final count = 0.obs;
  var data = Map<int, List<String>>();
  var columnList = ["Lớp", "Mã giáo viên", "Thời gian", "Phòng"];
  @override
  void onInit() {
    super.onInit();
    data[0] = ["LT", "BT"];
    data[1] = ["CQA005", "CQA009"];
    data[2] = ["T2, 1-3", "T2, 1-3"];
    data[3] = ["HOITRUONG", "B303"];
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
