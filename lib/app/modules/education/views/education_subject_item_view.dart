import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';
import 'package:thanglong_university/app/model/register_subject_entity.dart';
import 'package:thanglong_university/app/model/score_detail_entity.dart';
import 'package:thanglong_university/app/modules/transcript/views/detail_transcript_subject_view.dart';
import 'package:thanglong_university/app/routes/app_pages.dart';
import 'package:thanglong_university/app/service/api/app_client.dart';

class EducationSubjectItemView extends GetView {
  final RegisterSubjectEntity item;
  final double space;
  final bool isCurrent;

  EducationSubjectItemView({this.item, this.space = 5, this.isCurrent = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        if (isCurrent) {
          pushTo(Routes.DETAI_CLASS, arguments: {
            "id": item.id,
            "data": item,
            'type': ClassDetailType.studying
          });
        } else {
          ScoreDetailEntity res =
              await Appclient.shared.getTrascriptById(item.transciptId);
          if (res != null) {
            Get.dialog(DetailTranscriptSubjectView(res));
          }
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        margin: EdgeInsets.only(left: 16, right: 16, top: 5),
        decoration: boxShadow
            .copyWith(borderRadius: BorderRadius.circular(5), boxShadow: []),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    "${item?.subject?.name ?? ""}",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: fontInter(16,
                        fontWeight: FontWeight.w600, color: AppColor.c000333),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: AppColor.cfc7171,
                      borderRadius: BorderRadius.circular(5)),
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                  alignment: Alignment.center,
                  child: Text(
                    "${item.subject?.id ?? ""}",
                    style: fontInter(10,
                        fontWeight: FontWeight.w600,
                        color: AppColor.whiteColor),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  itemView("Thời gian:", "T2, 1-3\nT2, 1-3"),
                  VerticalDivider(
                    thickness: 1,
                    color: AppColor.lineColor,
                    width: 30,
                  ),
                  itemView("Địa điểm:", "B301"),
                  VerticalDivider(
                    thickness: 1,
                    color: AppColor.lineColor,
                    width: 30,
                  ),
                  itemView("Số tín chỉ:",
                      "${item?.prerequisiteSubject?.credits ?? 0} Tín"),
                ],
              ),
            ).marginOnly(top: 10)
          ],
        ),
      ),
    );
  }

  Widget itemView(String title, String subTitle) {
    return IntrinsicHeight(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: fontInter(11,
                fontWeight: FontWeight.w500, color: AppColor.c808080),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            subTitle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: fontInter(12,
                fontWeight: FontWeight.w600, color: AppColor.c000333),
          ),
        ],
      ),
    );
  }
}
