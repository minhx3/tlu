import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thanglong_university/app/model/register_subject_entity.dart';
import 'package:thanglong_university/app/service/api/app_client.dart';

class DetaiClassController extends GetxController
    with SingleGetTickerProviderMixin {
  final collapsed = false.obs;
  AnimationController collapseAnimationController = AnimationController(
      vsync: NavigatorState(), duration: Duration(milliseconds: 400));
  AnimationController collapseIconAnimationController = AnimationController(
      vsync: NavigatorState(), duration: Duration(milliseconds: 400));

  List<Map<String, dynamic>> columnList = [
    {"title": "Lớp", "data": []},
    {"title": "Mã giáo viên", "data": []},
    {"title": "Thời gian", "data": []},
    {"title": "Phòng", "data": []},
  ];

  String subjectClassId = Get.arguments["id"];
  RegisterSubjectEntity subjectClassData;

  @override
  Future<void> onInit() async {
    super.onInit();

    if (Get.arguments["data"] != null) {
      subjectClassData = Get.arguments["data"] as RegisterSubjectEntity;
    } else if (subjectClassId != null) {
      subjectClassData =
          await Appclient.shared.getSubjectsClassById(subjectClassId);
    }

    if (subjectClassData != null) {
      (subjectClassData.listTimelineClass ?? [])
          .asMap()
          .forEach((index, element) {
        (columnList[0]['data'] as List).add(element.id ?? "");
        (columnList[1]['data'] as List).add(element.teacher?.id ?? "");
        (columnList[2]['data'] as List)
            .add((element.listSchedule ?? []).map((e) => e.getTime).join("\n"));
        (columnList[3]['data'] as List)
            .add((element.listSchedule ?? []).map((e) => e.address).join(", "));
      });
      if ((subjectClassData.listTimelineClass ?? []).length == 1) {
        columnList.removeAt(0);
      }
    }
  }

  collapseAnimate() => collapsed(!collapsed());

  @override
  void onReady() {
    super.onReady();
  }

  // @override
  // void onClose() {}

  @override
  void dispose() {
    collapseAnimationController.dispose();
    super.dispose();
  }
}
