import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';
import 'package:thanglong_university/app/model/schedule_model.dart';
import 'package:thanglong_university/app/routes/app_pages.dart';
import 'package:thanglong_university/app/service/storage/storage.dart';

class ScheduleItemView extends GetView {
  final ScheduleModel item;

  ScheduleItemView(this.item);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pushTo(Routes.TASK, arguments: item);
      },
      child: Column(
        children: [
          SizedBox(
            height: 40,
            child: Row(
              children: [
                Padding(
                  child: Image.asset(
                    Images.dot,
                    width: 18,
                  ),
                  padding: EdgeInsets.all(8),
                ),
                Text(
                  "${item.getTime} ${item.getSession}",
                  style: fontInter(12,
                      color: Colors.red, fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.circular(5)),
            child: Column(
              children: [
                contentView(),
                Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        blurRadius: 3,
                        spreadRadius: 0,
                        offset: Offset(0, 5),
                        color: AppColor.hintTextColor.withOpacity(0.1)),
                  ], color: AppColor.whiteColor),
                  child: Row(
                    children: [
                     isTeacher? SizedBox.shrink(): blockView(
                        "Mã lớp:",
                        item.subjectClassId ?? '',
                      ),
                      isTeacher? SizedBox.shrink(): SizedBox(
                        width: 20,
                      ),
                      blockView("Địa điểm:", "${item.address}"),
                      Expanded(
                        child: SizedBox(),
                      ),
                      item.favourite
                          ? GestureDetector(
                              child: Image.asset(
                                Images.iconStar,
                                width: 18,
                                color: Colors.amber,
                              ),
                              onTap: () {})
                          : SizedBox.shrink()
                    ],
                  ),
                ),
                // noteView()
              ],
            ),
          )
        ],
      ),
    );
  }

  Padding contentView() {
    return Padding(
      padding: EdgeInsets.only(left: 16, top: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  "${item.title ?? ""}",
                  style: fontInter(16,
                      fontWeight: FontWeight.w600,
                      color: AppColor.appBarDarkBackground),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              isTeacher
                  ? SizedBox.shrink()
                  : Container(
                      decoration: BoxDecoration(
                          color: AppColor.cfc7171,
                          borderRadius: BorderRadius.circular(5)),
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                      alignment: Alignment.center,
                      child: Text(
                        "${item?.subjectId ?? ""}",
                        style: fontInter(10,
                            fontWeight: FontWeight.w600,
                            color: AppColor.whiteColor),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            "${item.content ?? ""}",
            style: fontInter(12,
                fontWeight: FontWeight.w400, color: AppColor.subTextColor),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Container(
            height: 1,
            margin: EdgeInsets.only(top: 10),
            width: double.infinity,
            color: AppColor.subTextColor.withOpacity(0.1),
          ),
        ],
      ),
    );
  }

  Widget blockView(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: fontInter(11,
              fontWeight: FontWeight.w500, color: AppColor.subTextColor),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          content,
          style: fontInter(12,
              fontWeight: FontWeight.w600, color: AppColor.sectionTermColor),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }

  Padding noteView() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Note:",
            style: fontInter(14,
                fontWeight: FontWeight.w500, color: AppColor.labelColor),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "${item.note ?? ""}",
            style: fontInter(12,
                fontWeight: FontWeight.w500, color: AppColor.subTextColor),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
