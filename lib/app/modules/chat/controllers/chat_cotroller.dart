import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:thanglong_university/app/model/chat/chat.dart';
import 'package:thanglong_university/app/model/chat/subject_class_entity.dart';
import 'package:thanglong_university/app/service/api/app_client.dart';
import 'package:thanglong_university/app/service/storage/storage.dart';

class ChatController extends GetxController {
  final crud = Get.put(ChatCrud());

  RxList<SubjectClassEntity> group = RxList();
  final list = <Chat>[].obs;

  List<SubjectClassEntity> get getGroupWithBadge {

  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    list.bindStream(crud.chatStream(Storage.getUserId()));
    getGroup();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    // group(fake);
  }

  getGroup() async {
    try {
      List<SubjectClassEntity> res =
          await Appclient.shared.getSubjectClassList(true);
      group(res);
    } on Exception catch (e) {} finally {}
  }
}
