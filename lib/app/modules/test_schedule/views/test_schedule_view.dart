import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/constant.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/views/views/app_bar_view.dart';
import 'package:thanglong_university/app/views/views/app_widget.dart';

import '../controllers/test_schedule_controller.dart';

class TestScheduleView extends GetView<TestScheduleController> {
  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: Scaffold(
        backgroundColor: AppColor.homeBackground,
        body: Column(
          children: [
            AppBarView(
              type: AppBarType.tab,
              title: "Lịch thi",
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.only(bottom: 60),
                children: [
                  Stack(
                    children: [
                      timeSchedule(),
                      Container(
                        margin: EdgeInsets.only(top: 200),
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                            color: AppColor.homeBackground,
                            borderRadius: BorderRadius.circular(5)),
                        child: Container(
                          color: AppColor.homeBackground,
                          child: ListView(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: List.generate(6, (index) {
                              return rowItem();
                            })
                              ..add(note()),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container note() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Lưu ý",
            style: fontInter(16,
                fontWeight: FontWeight.w600, color: AppColor.sectionTermColor),
          ),
          SizedBox(
            height: 16,
          ),
          Text(
              "- Những môn vừa thi viết và thi trên máy, sinh viên cần xem lịch thi chung để biết ngày thi trên máy. Sinh viên tự thu xếp thời gian thi vấn đáp và thi trên máy để không bị trùng với môn thi khác trong cùng ngày của mình. \n\n - Những sinh viên bị trùng ca thi của những môn học đi và học lại cần đến bàn 3 Phòng Tiếp Sinh viên đăng ký thi trùng ca trước khi kỳ thi chính thức bắt đầu.\n\n - Đối với môn giáo dục thể chất, Hát nhạc xem lịch thi phân ca thi tại bộ môn.",
              style: fontInter(14,
                  fontWeight: FontWeight.w500, color: AppColor.labelColor)),
        ],
      ),
      width: Constant.designWidth,
    );
  }

  Container rowItem() {
    return Container(
      margin: EdgeInsets.only(top: 5),
      padding: EdgeInsets.all(16),
      height: 66,
      decoration: BoxDecoration(
          color: AppColor.whiteColor, borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "1. Tiếng Anh trung cấp 2",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: fontInter(14,
                    fontWeight: FontWeight.w600, color: AppColor.c808080),
              ),
              Text(
                "GE303",
                style: fontInter(14,
                    fontWeight: FontWeight.w600, color: AppColor.cbfbfbf),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Container(height: 36, width: 1, color: AppColor.lineColor),
          ),
          Expanded(
            child: SizedBox(),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Bộ môn 2",
                maxLines: 1,
                textAlign: TextAlign.end,
                overflow: TextOverflow.ellipsis,
                style: fontInter(14,
                    fontWeight: FontWeight.w600, color: AppColor.c31B27C),
              ),
              Text(
                "Nghỉ quá buổi",
                textAlign: TextAlign.end,
                maxLines: 1,
                style: fontInter(14,
                    fontWeight: FontWeight.w600, color: AppColor.cbfbfbf),
              )
            ],
          )
        ],
      ),
    );
  }

  Container timeSchedule() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      height: 269,
      color: AppColor.appBarDarkBackground,
      width: Constant.designWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          sectionOverview(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Sinh viên mang theo Thẻ sinh viên + CMND",
              textAlign: TextAlign.center,
              style: fontInter(13,
                  fontWeight: FontWeight.w500,
                  color: AppColor.whiteColor.withOpacity(0.5)),
            ),
          ),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 16,
            runSpacing: 8,
            children: [
              Text(
                "Ca 1: 07h15 - 08h45",
                textAlign: TextAlign.center,
                style: fontInter(13,
                    fontWeight: FontWeight.w500,
                    color: AppColor.whiteColor.withOpacity(0.5)),
              ),
              Text(
                "Ca 1: 07h15 - 08h45",
                textAlign: TextAlign.center,
                style: fontInter(13,
                    fontWeight: FontWeight.w500,
                    color: AppColor.whiteColor.withOpacity(0.5)),
              ),
              Text(
                "Ca 1: 07h15 - 08h45",
                textAlign: TextAlign.center,
                style: fontInter(13,
                    fontWeight: FontWeight.w500,
                    color: AppColor.whiteColor.withOpacity(0.5)),
              ),
              Text(
                "Ca 1: 07h15 - 08h45",
                textAlign: TextAlign.center,
                style: fontInter(13,
                    fontWeight: FontWeight.w500,
                    color: AppColor.whiteColor.withOpacity(0.5)),
              ),
              Text(
                "Ca 1: 07h15 - 08h45",
                textAlign: TextAlign.center,
                style: fontInter(13,
                    fontWeight: FontWeight.w500,
                    color: AppColor.whiteColor.withOpacity(0.5)),
              ),
            ],
          )
        ],
      ),
    );
  }

  Container sectionOverview() {
    return Container(
        height: 74,
        decoration: BoxDecoration(
            border: Border(
                bottom:
                    BorderSide(color: AppColor.whiteColor.withOpacity(0.5)))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "(Học kỳ II Nhóm 1 năm 2020-2021)",
              style: fontInter(13,
                  fontWeight: FontWeight.w500,
                  color: AppColor.whiteColor.withOpacity(0.7)),
            ),
          ],
        ));
  }
}
