import 'package:collection/collection.dart';
import 'package:get/get.dart';
import 'package:thanglong_university/app/model/process_model.dart';
import 'package:thanglong_university/app/model/subject_model.dart';
import 'package:thanglong_university/app/model/test_schedule_model.dart';
import 'package:thanglong_university/app/service/api/app_client.dart';
import 'package:thanglong_university/app/service/api/trainning_router.dart';

class EducationController extends GetxController {
  //TODO: Implement EducationController

  final count = 0.obs;
  final rxMapSubjectList = Rx<Map<String, List<SubjectModel>>>();
  final rxProcess = Rx<ProcessModel>();
  final rxScheduleList = RxList<TestScheduleModel>();

  @override
  void onInit() {
    super.onInit();

    getTestSchedule();
    getLearningComeout();
    getSubjectList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  getSubjectList() async {
    final result = await Appclient.shared.getSubjectList();

    if (result != null) {
      final map = groupBy<SubjectModel, String>(result, (s) {
        return s.semester.name;
      });
      rxMapSubjectList(map);
    }
  }

  getLearningComeout() async {
    final result = await Appclient.shared.getLearningComeout();

    if (result != null) {
      rxProcess(result);
    }
  }

  getTestSchedule() async {
    final result = await Appclient.shared.getTestSchedule();

    if (result != null) {
      rxScheduleList(result);
    }
  }
}
