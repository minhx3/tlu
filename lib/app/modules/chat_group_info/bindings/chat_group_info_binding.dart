import 'package:get/get.dart';

import '../controllers/chat_group_info_controller.dart';

class ChatGroupInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatGroupInfoController>(
      () => ChatGroupInfoController(),
    );
  }
}
