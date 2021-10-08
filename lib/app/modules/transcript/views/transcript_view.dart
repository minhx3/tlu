import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';
import 'package:thanglong_university/app/configuration/extension/iterable.dart';
import 'package:thanglong_university/app/model/process_model.dart';
import 'package:thanglong_university/app/model/register_subject_entity.dart';
import 'package:thanglong_university/app/model/score_detail_entity.dart';
import 'package:thanglong_university/app/model/transcript_model.dart';
import 'package:thanglong_university/app/modules/transcript/views/detail_transcript_subject_view.dart';
import 'package:thanglong_university/app/routes/app_pages.dart';
import 'package:thanglong_university/app/service/api/app_client.dart';
import 'package:thanglong_university/app/views/views/app_bar_view.dart';
import 'package:thanglong_university/app/views/views/app_widget.dart';
import 'package:thanglong_university/app/views/views/link_view.dart';

import '../controllers/transcript_controller.dart';

pushToDetailClass(subjectClassId) async {
  RegisterSubjectEntity subjectClassData =
      await Appclient.shared.getSubjectsClassById(subjectClassId);

  pushTo(Routes.DETAI_CLASS, arguments: {
    "id": subjectClassId,
    'data': subjectClassData,
    'type': ClassDetailType.studying
  });
}

class TranscriptView extends GetView<TranscriptController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => AppContainer(
          child: Scaffold(
              backgroundColor: AppColor.cf2f2f2,
              body: Column(
                children: [
                  AppBarView(
                    title: "Bảng điểm",
                    type: AppBarType.icon,
                    iconLeading: controller.isFilter.isTrue
                        ? Images.icSort
                        : Images.icSortAsc,
                    iconTintColor: Color(
                        controller.isFilter.isTrue ? 0xff000333 : 0xffCACAD4),
                    onAction: () {
                      controller.setFilter(!controller.isFilter());
                    },
                  ),
                  Expanded(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              controller.isFilter() ? 5 : 0)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          sectionOverview(controller.isFilter()),
                          Expanded(
                            child: ListView(
                              padding: EdgeInsets.zero,
                              children: [
                                SectionTranscript(
                                    name: 'Môn đại cương',
                                    data: controller.transcriptsDC),
                                SectionTranscript(
                                    name: 'Môn chuyên ngành',
                                    data: controller.transcriptsCN)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )),
        ));
  }

  Container sectionOverview(bool isSort) {
    ProcessModel p = Get.arguments;

    return Container(
        height: 50,
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: AppColor.lineColor))),
        child: Row(
          children: [
            Text(
              "Tổng quan",
              style: fontInter(14, fontWeight: FontWeight.w600),
            ),
            Expanded(
              child: SizedBox(),
            ),
            Text(
              "TC: ${p?.sumCredits ?? ''}",
              style: fontInter(14, fontWeight: FontWeight.w600),
            ),
            Container(
              width: 1,
              height: 17,
              color: Colors.black,
              margin: EdgeInsets.symmetric(horizontal: 10),
            ),
            Text(
              isSort ? "GPA: ${p?.gpa}" : 'ĐTB: ${p?.gpa10}',
              style: fontInter(14, fontWeight: FontWeight.w600),
            ),
          ],
        ));
  }
}

class SectionTranscript extends StatefulWidget {
  final String name;
  final List<TranscriptModel> data;

  const SectionTranscript({Key key, this.name, this.data}) : super(key: key);

  @override
  _SectionTranscriptState createState() => _SectionTranscriptState();
}

class _SectionTranscriptState extends State<SectionTranscript> {
  bool showNoScore = false;

  @override
  Widget build(BuildContext context) {
    List<TranscriptModel> _data = widget.data
        .where((element) => showNoScore ? true : element.gpa > 0)
        .toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 10),
          child: Text(
            widget.name,
            style: fontInter(12,
                color: AppColor.c4d4d4d, fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: AppColor.whiteColor,
              borderRadius: BorderRadius.circular(5)),
          child: ListView(
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: _data.mapIndexed((e, i) => transcripItem(e, i)).toList(),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: LinkView(
            showNoScore ? 'Ẩn môn chưa có điểm' : "Xem môn chưa có điểm",
            textColor: AppColor.c000333.withOpacity(.5),
            onTap: () => setState(() {
              showNoScore = !showNoScore;
            }),
          ),
          height: 50,
        )
      ],
    );
  }
}

Widget transcripItem(TranscriptModel item, int index) {
  return InkWell(
    onTap: () async {
      ScoreDetailEntity res = await Appclient.shared.getTrascriptById(item.id);
      if (res != null) {
        res.gpa == -1
            ? pushToDetailClass(item.subjectClassId)
            : Get.dialog(DetailTranscriptSubjectView(res));
      }
    },
    child: Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 16),
      color: index % 2 != 0 ? AppColor.itemTranscriptColor : Colors.transparent,
      child: Row(
        children: [
          Expanded(
            child: Text(
              item?.subject?.name,
              maxLines: 1,
              style: fontInter(14,
                  color: AppColor.sectionTermColor,
                  fontWeight: FontWeight.w600),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "${item?.subject?.credits} tín",
            style: fontInter(14, fontWeight: FontWeight.w600),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Text(
              item.gpa > 0 ? item.gpa.toString() : '   -  ',
              style: fontInter(14,
                  fontWeight: FontWeight.w600,
                  color: item.gpa > 0 ? AppColor.c31B27C : AppColor.c404040),
            ),
          ),
          Image.asset(
            Images.infoIcon,
            width: 20,
            height: 20,
          )
        ],
      ),
    ),
  );
}
