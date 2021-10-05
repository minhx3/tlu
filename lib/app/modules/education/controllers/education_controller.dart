import 'package:collection/collection.dart';
import 'package:get/get.dart';
import 'package:thanglong_university/app/model/process_model.dart';
import 'package:thanglong_university/app/model/register_subject_entity.dart';
import 'package:thanglong_university/app/model/schedule_teacher_model.dart';
import 'package:thanglong_university/app/model/test_schedule_model.dart';
import 'package:thanglong_university/app/service/api/app_client.dart';
import 'package:thanglong_university/app/service/storage/storage.dart';

class EducationController extends GetxController {
  final count = 0.obs;
  final rxMapSubjectList = Rx<Map<String, List<RegisterSubjectEntity>>>();
  final rxMapOtherSubjectList = Rx<Map<String, List<RegisterSubjectEntity>>>();
  final rxProcess = Rx<ProcessModel>();
  final rxScheduleList = RxList<TestScheduleModel>();
  final rxScheduleTeacherList = Rx<Map<String, List<ScheduleTeacherModel>>>();

  final isShowOther = false.obs;

  @override
  void onInit() {
    super.onInit();

    if (isTeacher) {
      getScheduleTeacherList();
    } else {
      getTestSchedule();
      getLearningComeout();
      getSubjectList();
      getOtherSubjectList();
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => count.value++;

  getSubjectList() async {
    final result = await Appclient.shared.getSubjectList(false);

    if (result != null) {
      final map = groupBy<RegisterSubjectEntity, String>(result, (s) {
        return s.semester.name;
      });
      rxMapSubjectList(map);
    }
  }

  getScheduleTeacherList() async {
    List<ScheduleTeacherModel> result =
        await Appclient.shared.getScheduleTeacherList();
    if (result != null) {
      final map = groupBy<ScheduleTeacherModel, String>(result, (s) {
        return s.subjectClassName;
      });
      rxScheduleTeacherList(map);
    }
  }

  getOtherSubjectList() async {
    final result = await Appclient.shared.getSubjectList(true);

    if (result != null) {
      final map = groupBy<RegisterSubjectEntity, String>(result, (s) {
        return s.semester.name;
      });
      rxMapOtherSubjectList(map);
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
