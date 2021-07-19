import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:thanglong_university/app/model/chat/subject_class_entity.dart';
import 'package:thanglong_university/app/service/api/app_client.dart';

class ChatController extends GetxController {
  RxList<SubjectClassEntity> group = RxList();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    // group(fake);
    getGroup();
  }

  getGroup() async {
    try {
      List<SubjectClassEntity> res =
          await Appclient.shared.getSubjectClassList(true);
      group(res);
    } on Exception catch (e) {} finally {}
  }
}
