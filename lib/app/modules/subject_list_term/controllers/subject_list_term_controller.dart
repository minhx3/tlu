import 'package:get/get.dart';
import 'package:thanglong_university/app/model/register_entity.dart';
import 'package:thanglong_university/app/model/register_subject_entity.dart';
import 'package:thanglong_university/app/service/api/app_client.dart';

class SubjectListTermController extends GetxController {
  RxList<RegisterSubjectEntity> registerSubjects = RxList();
  final count = 0.obs;
  RegisterEntity semester = Get.arguments;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getRegisterSubjectList();
  }

  getRegisterSubjectList()async{
    var res = await Appclient.shared.getSubjectsRegisterById(semester.groupId);
    registerSubjects(res);
  }
  @override
  void onClose() {}
  void increment() => count.value++;
}
