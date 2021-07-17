import 'package:get/get.dart';
import 'package:thanglong_university/app/model/register_entity.dart';
import 'package:thanglong_university/app/service/api/app_client.dart';

class ResgisterSubjectTermController extends GetxController {
  final count = 0.obs;
  RxList<RegisterEntity> subjects = RxList();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getGroupRegister();
  }

  getGroupRegister() async {
    var res = await Appclient.shared.getGroupRegister();
    subjects(res);
  }

  @override
  void onClose() {}

  void increment() => count.value++;
}
