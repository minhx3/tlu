import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/modules/transcript/views/detail_transcript_subject_view.dart';
import 'package:thanglong_university/app/modules/transcript/views/transcript_filter_view.dart';
import 'package:thanglong_university/app/views/views/app_bar_view.dart';
import 'package:thanglong_university/app/views/views/app_widget.dart';
import 'package:thanglong_university/app/views/views/link_view.dart';

import '../controllers/transcript_controller.dart';

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
                    iconLeading: Images.iconFilter,
                    onAction: () {
                      controller.setFilter(!controller.isFilter());
                    },
                  ),
                  controller.isFilter() == true
                      ? TranscriptFilterView()
                      : SizedBox(),
                  Expanded(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                      decoration: BoxDecoration(
                          color: AppColor.homeBackground,
                          borderRadius: BorderRadius.circular(
                              controller.isFilter() ? 5 : 0)),
                      child: Container(
                        color: AppColor.homeBackground,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            sectionOverview(),
                            Expanded(
                              child: ListView(
                                padding: EdgeInsets.zero,
                                children: List.generate(3, sectionTranscript)
                                    .toList(),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )),
        ));
  }

  Column sectionTranscript(int section) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 10),
          child: Text(
            "Môn đại cương",
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
            children: List.generate(5, transcripItem).toList(),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: LinkView(
            "Xem môn chưa có điểm",
            textColor: AppColor.c000333.withOpacity(.5),
          ),
          height: 50,
        )
      ],
    );
  }

  Widget transcripItem(int index) {
    return InkWell(
      onTap: () {
        Get.dialog(DetailTranscriptSubjectView());
      },
      child: Container(
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 16),
        color:
            index % 2 != 0 ? AppColor.itemTranscriptColor : Colors.transparent,
        child: Row(
          children: [
            Expanded(
              child: Text(
                "Thương mại quốc tế",
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
              "3 tín",
              style: fontInter(14, fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "6.7",
                style: fontInter(14,
                    fontWeight: FontWeight.w600, color: AppColor.c31B27C),
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

  Container sectionOverview() {
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
              "TC: 128",
              style: fontInter(14, fontWeight: FontWeight.w600),
            ),
            Container(
              width: 1,
              height: 17,
              color: Colors.black,
              margin: EdgeInsets.symmetric(horizontal: 10),
            ),
            Text(
              "GPA: 3.24",
              style: fontInter(14, fontWeight: FontWeight.w600),
            ),
          ],
        ));
  }
}
