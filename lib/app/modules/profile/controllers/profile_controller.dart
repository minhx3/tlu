import 'package:get/get.dart';
import 'package:thanglong_university/app/configuration/base/app_controller.dart';
import 'package:thanglong_university/app/model/chat/chat.dart';
import 'package:thanglong_university/app/model/user_model.dart';
import 'package:thanglong_university/app/modules/chat/controllers/chat_cotroller.dart';
import 'package:thanglong_university/app/modules/index/controllers/index_controller.dart';
import 'package:thanglong_university/app/modules/index/model/tab_item.dart';
import 'package:thanglong_university/app/service/api/app_client.dart';
import 'package:thanglong_university/app/views/views/image_view.dart';

class ProfileController extends AppController {
  final count = 0.obs;
  final rxUserInfo = Rx<UserModel>();
  final list = <Chat>[].obs;

  static ProfileController get to => Get.find();

  String get myUserId => rxUserInfo().userModelId;

  List<Chat> get listUserChat => list();

  @override
  void onInit() {
    super.onInit();
    getUserInfo();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => count.value++;

  getUserInfo() async {
    showLoading();
    final result = await Appclient.shared.getUserInfo();
    if (result != null) {
      final crud = Get.find<ChatCrud>();
      list.bindStream(crud.chatUserStream(result.userModelId));

      1.delay(() {
        hideLoading();
        rxUserInfo(result);
      });
    }
  }
}
