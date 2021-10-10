import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';
import 'package:thanglong_university/app/model/register_subject_entity.dart';
import 'package:thanglong_university/app/model/score_detail_entity.dart';
import 'package:thanglong_university/app/modules/transcript/controllers/transcript_controller.dart';
import 'package:thanglong_university/app/routes/app_pages.dart';
import 'package:thanglong_university/app/service/api/app_client.dart';
import 'package:thanglong_university/app/views/views/app_widget.dart';
import 'package:thanglong_university/app/views/views/button_view.dart';

enum ClassDetailType { studying, studied }

class DetailTranscriptSubjectView extends GetView<TranscriptController> {
  final ScoreDetailEntity item;

  DetailTranscriptSubjectView(this.item);

  @override
  Widget build(BuildContext context) {
    return SlideInUp(
      child: AppContainer(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                padding: EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    header(),
                    SizedBox(
                      height: 14,
                    ),
                    section(
                        'Điểm QT trung bình:',
                        item.scores.firstWhere(
                            (element) => element.scoreName == 'PROGRESS',
                            orElse: () => null)),
                    section(
                        'Điểm thi trung bình:',
                        item.scores.firstWhere(
                            (element) => element.scoreName == 'TEST',
                            orElse: () => null)),
                    section(
                        'Điểm thi chuyên cần:',
                        item.scores.firstWhere(
                            (element) => element.scoreName == 'EXTRA',
                            orElse: () => null)),
                    section(
                        'Điểm kỹ năng:',
                        item.scores.firstWhere(
                            (element) => element.scoreName == 'SKILL',
                            orElse: () => null)),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                      child: rowItem(
                          title: "Tổng kết",
                          value: item?.gpa?.toString() ?? ''),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                      child: rowItem(
                          title: "Số tín chỉ",
                          value: item?.subject?.credits?.toString() ?? ''),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    ButtonView(
                      title: "Chi tiết môn",
                      type: ButtonType.outline,
                      horizontalSpacing: 16,
                      onTap: pushToDetailClass,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: GestureDetector(
                  onTap: () {
                    pop();
                  },
                  child: Image.asset(
                    Images.dismissIcon,
                    width: 36,
                    height: 36,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  pushToDetailClass() async {
    RegisterSubjectEntity subjectClassData =
        await Appclient.shared.getSubjectsClassById(item?.subjectClassId);

    pushTo(Routes.DETAI_CLASS, arguments: {
      "id": item?.subjectClassId,
      'data': subjectClassData,
      'type': ClassDetailType.studying
    });
  }

  Widget section(title, Score score) {
    if (score == null) {
      return SizedBox.shrink();
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          rowItem(title: title, value: score.scoreAvg),
          score.listScoreDetail.length <= 1
              ? SizedBox.shrink()
              : Column(
                  children: score.listScoreDetail
                      .map(
                        (e) => rowItem(
                            title: e?.skill,
                            value: e?.scoreSkill.toString(),
                            padding: 8,
                            fontSize: 13,
                            isSubItem: true),
                      )
                      .toList(),
                ),
          Divider(
            thickness: 1,
            indent: 0,
            endIndent: 0,
            color: AppColor.lineColor,
          )
        ],
      ),
    );
  }

  Container rowItem(
      {String title,
      String value,
      bool showLine = false,
      double fontSize = 14,
      double padding = 0,
      bool isSubItem = false,
      Color color}) {
    return Container(
        height: showLine ? 40 : 30,
        padding: EdgeInsets.only(left: padding),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: showLine == true
                        ? AppColor.lineColor
                        : Colors.transparent,
                    width: 1))),
        child: Row(
          children: [
            Expanded(
                child: Text(
              title,
              style: fontInter(isSubItem ? 13 : 14,
                  fontWeight: FontWeight.w500,
                  color: isSubItem ? AppColor.c808080 : AppColor.c333333),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )),
            Text(
              value,
              style: fontInter(isSubItem ? 13 : 16,
                  fontWeight: FontWeight.w600, color: AppColor.c000333),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ));
  }

  Container header() {
    return Container(
        height: 56,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    item?.subject?.name ?? '',
                    style: fontInter(16,
                        fontWeight: FontWeight.w600,
                        color: AppColor.whiteColor),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: AppColor.cfc7171,
                      borderRadius: BorderRadius.circular(5)),
                  height: 18,
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  alignment: Alignment.center,
                  child: Text(
                    item?.subjectClassId ?? '',
                    style: fontInter(10,
                        fontWeight: FontWeight.w600,
                        color: AppColor.whiteColor),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: AppColor.appBarDarkBackground,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5), topRight: Radius.circular(5)),
        ));
  }
}
