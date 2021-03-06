import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';
import 'package:thanglong_university/app/model/register_entity.dart';
import 'package:thanglong_university/app/model/register_subject_entity.dart';
import 'package:thanglong_university/app/modules/subject_list_term/models/subject_filter.dart';
import 'package:thanglong_university/app/service/api/app_client.dart';
import 'package:thanglong_university/app/configuration/extension/string.dart';
import 'package:thanglong_university/app/views/views/button_view.dart';

class SubjectListTermController extends GetxController
    with SingleGetTickerProviderMixin {
  RxList<RegisterSubjectEntity> registerSubjects = RxList();
  Rx<SubjectFilter> subjectFilter = Rx<SubjectFilter>();
  List<RegisterSubjectEntity> _registerSubjects;
  final filterCollapsed = false.obs;

  RegisterEntity queryParams = Get.arguments;

  AnimationController expandController = AnimationController(
      vsync: NavigatorState(), duration: Duration(milliseconds: 400));
  Animation<double> filterFormAnimation;
  TextEditingController textEditController = new TextEditingController();

  @override
  void onInit() {
    filterFormAnimation = CurvedAnimation(
      parent: expandController,
      curve: Curves.fastOutSlowIn,
    );
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    subjectFilter(new SubjectFilter());
    getRegisterSubjectList();
  }

  getRegisterSubjectList() async {
    var res =
        await Appclient.shared.getSubjectsRegisterById(queryParams.groupId);
    _registerSubjects = res;
    registerSubjects(res);
  }

  filterSubject([SubjectFilter filter]) {
    filter = filter ?? subjectFilter();
    subjectFilter(filter);
    subjectFilter.refresh();
    List<RegisterSubjectEntity> subjectFiltered = _registerSubjects;
    if (filter.title.isNotEmpty && filter.title.trim().length > 2) {
      subjectFiltered = subjectFiltered
          .where((element) =>
              element.subject.name
                  .nonAccent()
                  .contains(filter.title.nonAccent()) ||
              element.id.toString().toLowerCase() == filter.title ||
              (element.listTimelineClass ?? [])
                      .where((subjectClass) =>
                          subjectClass.id.toString().toLowerCase() ==
                          filter.title)
                      .length >
                  0)
          .toList();
    }
    if (filter.day.length > 0) {
      subjectFiltered = subjectFiltered
          .where((element1) =>
              (element1?.listTimelineClass ?? []).indexWhere((element2) =>
                  (element2?.listSchedule ?? []).indexWhere(
                      (element3) => filter.day.contains(element3.dayOfWeek)) >=
                  0) >=
              0)
          .toList();
    }
    if (filter.time.length > 0) {
      subjectFiltered = subjectFiltered
          .where((element1) =>
              (element1?.listTimelineClass ?? []).indexWhere((element2) =>
                  (element2?.listSchedule ?? []).indexWhere((element3) =>
                      (element3?.listSession ?? []).indexWhere((element4) {
                        int dayTime = 2; // toi
                        if ((element4?.startTime?.hours ?? 0) <= 11) {
                          dayTime = 0; // sang
                        } else if ((element4?.startTime?.hours ?? 0) <= 17) {
                          dayTime = 1; // chieu
                        }
                        return filter.time.contains(dayTime);
                      }) >=
                      0) >=
                  0) >=
              0)
          .toList();
    }
    if (filter.type != "") {
      subjectFiltered = subjectFiltered
          .where((element) => element.subject.type == filter.type)
          .toList();
    }
    registerSubjects(subjectFiltered);
  }

  updateFilter([SubjectFilter filter]) {
    subjectFilter(filter ?? new SubjectFilter());
    subjectFilter.refresh();
  }

  confirmRegisterSubject(RegisterSubjectEntity subject) {
    showConfirmDialog(
        actions: Row(
          children: [
            Expanded(
              child: ButtonView(
                backgroundColor: AppColor.c000333,
                title: "H???y",
                onTap: () {
                  Navigator.of(Get.context).pop();
                },
              ),
            ),
            SizedBox(width: 5),
            Expanded(
              child: ButtonView(
                title: "X??c nh???n",
                onTap: () {
                  postRegisterSubject(subject.id);
                },
              ),
            ),
          ],
        ),
        messageWidget: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "B???n c?? ch???c ch???n ????ng k?? l???p",
              style: TextStyle(color: AppColor.c4d4d4d, fontSize: 12),
            ),
            SizedBox(height: 2),
            Text(
              "${subject?.name ?? subject?.subject?.name} - ${subject.getAllTime} ?",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColor.c4d4d4d,
                  fontSize: 12),
            )
          ],
        ),
        titleWidget: RichText(
          text: TextSpan(
            text: 'X??c nh???n ',
            style: TextStyle(
                color: AppColor.c000333,
                fontWeight: FontWeight.w600,
                fontSize: 16),
            children: const <TextSpan>[
              TextSpan(
                  text: '????ng k?? l???p',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: AppColor.c5ccc78)),
            ],
          ),
        ));
  }

  postRegisterSubject(String subjectClassId) async {
    var res = await Appclient.shared.postRegisterSubjectClass(subjectClassId);
    if (res?.statusCode == 200) {
      showMessage(
          titleWidget: RichText(
            text: TextSpan(
              text: '????ng k?? ',
              style: TextStyle(
                  color: AppColor.c000333,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
              children: const <TextSpan>[
                TextSpan(
                    text: 'Th??nh c??ng',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: AppColor.c5ccc78)),
              ],
            ),
          ),
          message: res?.message);
    } else {
      showErrorMessage(
          titleWidget: RichText(
            text: TextSpan(
              text: '????ng k?? ',
              style: TextStyle(
                  color: AppColor.c000333,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
              children: const <TextSpan>[
                TextSpan(
                    text: 'th???t b???i',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: AppColor.cfc7171)),
              ],
            ),
          ),
          message: res?.errorReason);
    }
    return res;
  }

  collapseFilterForm() {
    filterCollapsed(!filterCollapsed());
  }

  @override
  void onClose() {}

  @override
  void dispose() {
    expandController.dispose();
    textEditController.dispose();
    super.dispose();
  }
}
