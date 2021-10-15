import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';
import 'package:thanglong_university/app/model/register_subject_entity.dart';
import 'package:thanglong_university/app/modules/education/views/education_subject_item_view.dart';
import 'package:thanglong_university/app/routes/app_pages.dart';
import 'package:thanglong_university/app/views/views/button_view.dart';

import '../controllers/education_controller.dart';

class EducationStudentView extends GetView<EducationController> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          padding: EdgeInsets.only(bottom: 30),
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Column(
                children: [
                  Obx(() {
                    final data = controller.rxProcess();
                    return counterView(
                        title:
                            "${data?.completeCredits ?? 0}/${data?.sumCredits ?? 0}",
                        subTitle: "${data?.gpa ?? 0}",
                        hasProgress: true,
                        value: (data?.completeCredits ?? 0) /
                            (data?.sumCredits ?? 0),
                        onTap: () {
                          pushTo(Routes.TRANSCRIPT,
                              arguments: controller.rxProcess());
                        });
                  }),
                  Obx(() {
                    final data = controller.rxProcess();
                    final count = controller.rxScheduleList().length;
                    return counterView(
                        title: "${data?.sumCreditsInSemster ?? 0} tín chỉ",
                        subTitle: "${count ?? 0} môn",
                        space: 10,
                        type: 2,
                        value: (data?.completeCredits ?? 0) /
                            (data?.sumCredits ?? 0),
                        onTap: () {
                          pushTo(Routes.TEST_SCHEDULE,
                              arguments: controller.rxScheduleList);
                        });
                  }),
                ],
              ),
            ),
            Container(
              height: 1,
              margin: EdgeInsets.symmetric(horizontal: 16),
              color: AppColor.ce6e6e6,
            ),
            Obx(() {
              Map<String, List<RegisterSubjectEntity>> studentSubject =
                  controller.rxMapSubjectList();

              return Column(
                children: studentSubject.entries
                    .map((e) => _ItemGroupByStudentSubjectView(
                        isLastItem: e.key.contains(studentSubject.keys.last),
                        isCurrent: true,
                        subjectName: e.key,
                        itemChilds: e.value))
                    .toList(),
              );
            }),
            Obx(() => ButtonView(
                  title: controller.isShowOther.isTrue
                      ? 'Ẩn các kỳ trước'
                      : "Xem thêm các kì trước",
                  type: ButtonType.outline,
                  horizontalSpacing: 16,
                  verticalSpacing: 16,
                  onTap: () {
                    controller.isShowOther.toggle();
                  },
                )),
            Obx(() {
              if (controller.isShowOther.isFalse) {
                return SizedBox.shrink();
              }
              Map<String, List<RegisterSubjectEntity>> studentSubject =
                  controller.rxMapSubjectList();

              return Column(
                children: studentSubject.entries
                    .map((e) => _ItemGroupByStudentSubjectView(
                        isLastItem: e.key.contains(studentSubject.keys.last),
                        isCurrent: false,
                        subjectName: e.key,
                        itemChilds: e.value))
                    .toList(),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget counterView(
      {int type = 1,
      String title,
      String subTitle,
      bool hasProgress = false,
      double value,
      double space = 0,
      Function onTap}) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: EdgeInsets.only(top: space),
        decoration: boxShadow.copyWith(
            color: type == 1 ? AppColor.c000333 : AppColor.whiteColor,
            borderRadius: BorderRadius.circular(5)),
        padding: EdgeInsets.fromLTRB(15, type == 1 ? 17 : 11, 15, 12),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        type == 1
                            ? "Tín chỉ đã hoàn thành:"
                            : "Tín chỉ trong học kỳ:",
                        style: fontInter(type == 1 ? 14 : 12,
                            fontWeight: FontWeight.w600,
                            color: type == 1
                                ? AppColor.c9d9daa
                                : AppColor.c8c8c8c),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        title ?? "",
                        style: fontInter(type == 1 ? 28 : 16,
                            fontWeight: FontWeight.w600,
                            color: type == 1
                                ? AppColor.whiteColor
                                : AppColor.c000333),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  width: 1,
                  height: 50,
                  color: Color(type == 1 ? 0xff33355A : 0xffE6E6E6),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        type == 1 ? "ĐTBTL" : "Lịch thi",
                        style: fontInter(type == 1 ? 14 : 12,
                            fontWeight: FontWeight.w600,
                            color: type == 1
                                ? AppColor.c9d9daa
                                : AppColor.c8c8c8c),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        subTitle ?? "",
                        style: fontInter(type == 1 ? 28 : 16,
                            fontWeight: FontWeight.w600,
                            color: type == 1
                                ? AppColor.whiteColor
                                : AppColor.appBarDarkBackground),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Image.asset(Images.arrowRight,
                    height: 18,
                    color: type == 1 ? AppColor.whiteColor : Color(0xff595C82))
              ],
            ),
            hasProgress == false
                ? SizedBox()
                : Container(
                    alignment: Alignment.center,
                    height: 50,
                    child: Container(
                        height: 7,
                        margin: EdgeInsets.only(top: 20),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: LinearProgressIndicator(
                            backgroundColor:
                                AppColor.whiteColor.withOpacity(0.15),
                            valueColor:
                                AlwaysStoppedAnimation<Color>(AppColor.cfc2626),
                            value: (value.isNaN) ? 0 : value,
                          ),
                        )),
                  )
          ],
        ),
      ),
    );
  }
}

class _ItemGroupByStudentSubjectView extends StatelessWidget {
  final String subjectName;
  final bool isLastItem;
  final bool isCurrent;
  final List<RegisterSubjectEntity> itemChilds;

  const _ItemGroupByStudentSubjectView(
      {Key key,
      @required this.subjectName,
      @required this.itemChilds,
      this.isLastItem = false,
      this.isCurrent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 15, 15, 10),
          child: Text(
            subjectName,
            style: fontInter(14,
                color: AppColor.c4d4d4d, fontWeight: FontWeight.w600),
          ),
        ),
        ListView(
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: itemChilds
              .map((e) => EducationSubjectItemView(
                    isCurrent: isCurrent,
                    item: e,
                  ))
              .toList(),
        ),
        SizedBox(
          height: 20,
        ),
        !isLastItem
            ? Divider(
                thickness: 2,
                indent: 15,
                endIndent: 15,
                color: AppColor.ce6e6e6,
              )
            : SizedBox.shrink(),
      ],
    );
  }
}
