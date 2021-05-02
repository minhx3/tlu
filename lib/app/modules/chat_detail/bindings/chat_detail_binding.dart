import 'package:get/get.dart';
import 'package:thanglong_university/app/modules/chat_detail/controllers/chat_detail_controller.dart';

class ChatDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatDetailController>(() => ChatDetailController());
  }
}
