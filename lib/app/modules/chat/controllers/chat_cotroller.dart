import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:thanglong_university/app/model/chat_group_entity.dart';
import 'package:thanglong_university/app/model/register_subject_entity.dart';
import 'package:thanglong_university/app/service/api/app_client.dart';

class ChatController extends GetxController {
  RxList<ChatGroupEntity> group = RxList();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getGroup();
  }

  getGroup() async {
    try {
      List<RegisterSubjectEntity> res =
          await Appclient.shared.getSemesterList();
      List<ChatGroupEntity> chat =
          res.map((e) => e.getListSubject).expand((e1) => e1);
      group(chat);
    } on Exception catch (e) {} finally {}
  }
}
