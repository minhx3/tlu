import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/constant.dart';
import 'package:thanglong_university/app/configuration/extension/iterable.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/model/test_schedule_model.dart';
import 'package:thanglong_university/app/views/views/app_bar_view.dart';
import 'package:thanglong_university/app/views/views/app_widget.dart';

import '../controllers/test_schedule_controller.dart';

class TestScheduleView extends GetView<TestScheduleController> {
  @override
  Widget build(BuildContext context) {
    List<TestScheduleModel> listTest = Get.arguments;
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
                  timeSchedule(),
                  Container(
                    margin: EdgeInsets.only(top: 15),
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
                        children: listTest.mapIndexed((e, i) {
                          return rowItem(e, i);
                        }).toList()
                          ..add(note()),
                      ),
                    ),
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
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Lưu ý",
            style: fontInter(16,
                fontWeight: FontWeight.w600, color: AppColor.c4d4d4d),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
              "- Những môn vừa thi viết và thi trên máy, sinh viên cần xem lịch thi chung để biết ngày thi trên máy. Sinh viên tự thu xếp thời gian thi vấn đáp và thi trên máy để không bị trùng với môn thi khác trong cùng ngày của mình. \n\n - Những sinh viên bị trùng ca thi của những môn học đi và học lại cần đến bàn 3 Phòng Tiếp Sinh viên đăng ký thi trùng ca trước khi kỳ thi chính thức bắt đầu.\n\n - Đối với môn giáo dục thể chất, Hát nhạc xem lịch thi phân ca thi tại bộ môn.",
              style: fontInter(12,
                  fontWeight: FontWeight.w500,
                  color: AppColor.labelColor,
                  height: 1.5)),
        ],
      ),
      width: Constant.designWidth,
    );
  }

  Container rowItem(TestScheduleModel t, int i) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      padding: EdgeInsets.all(14),
      height: 66,
      decoration: BoxDecoration(
          color: AppColor.whiteColor, borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 20,
            child: Text(
              '${i + 1}.',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: fontInter(14,
                  fontWeight: FontWeight.w600, color: AppColor.c808080),
            ),
          ),
          Container(
            width: 170,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${t.subjectClassName}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: fontInter(14,
                      fontWeight: FontWeight.w600,
                      color: t.status=='ONGOING'?AppColor.c000333: AppColor.c808080),
                ),
                Text(
                  "${t.subjectClassId}",
                  style: fontInter(14,
                      fontWeight: FontWeight.w600, color: AppColor.cbfbfbf),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(height: 36, width: 1, color: AppColor.lineColor),
          ),
          Container(
            width: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${t.getStatus.title}",
                  maxLines: 1,
                  textAlign: TextAlign.end,
                  overflow: TextOverflow.ellipsis,
                  style: fontInter(14,
                      fontWeight: FontWeight.w600, color: t.getStatus.color),
                ),
                Text(
                  t.getTime,
                  textAlign: TextAlign.end,
                  maxLines: 1,
                  style: fontInter(
                    14,
                    fontWeight: FontWeight.w600,
                    color: t.status=='ONGOING'? AppColor.cfc7171: AppColor.cbfbfbf,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container timeSchedule() {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 32, 15, 37),
      color: AppColor.appBarDarkBackground,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "(Học kỳ II Nhóm 1 năm 2020-2021)",
            style: fontInter(13,
                fontWeight: FontWeight.w500,
                color: AppColor.whiteColor.withOpacity(0.7)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Container(height: 1.5, width: 345, color: AppColor.c33355a),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: TextSpan(
                text: 'Sinh viên mang theo ',
                style: fontInter(
                  14,
                  color: AppColor.cb3b4c2,
                  fontWeight: FontWeight.w600,
                ),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Thẻ sinh viên',
                      style: fontInter(14,
                          fontWeight: FontWeight.w600,
                          color: AppColor.cfc7171)),
                  TextSpan(
                      text: ' + ',
                      style: fontInter(14,
                          fontWeight: FontWeight.w600,
                          color: AppColor.cb3b4c2)),
                  TextSpan(
                      text: 'CMND',
                      style: fontInter(14,
                          fontWeight: FontWeight.w600,
                          color: AppColor.cfc7171)),
                ],
              ),
            ),
          ),
          // SizedBox(height: 12,),
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            spacing: 24,
            runSpacing: 8,
            children: [
              richTextSection(1, '07h15 - 08h45'),
              richTextSection(4, '15h30 - 17h00'),
              richTextSection(2, '09h30 - 11h00'),
              richTextSection(5, '17h20 - 18h50'),
              richTextSection(3, '13h15 - 14h45'),
            ],
          )
        ],
      ),
    );
  }

  RichText richTextSection(int i, String time) {
    return RichText(
              text: TextSpan(
                text: 'Ca ${i}: ',
                style: fontInter(13,
                    color: AppColor.cb3b4c2, fontWeight: FontWeight.w600),
                children: <TextSpan>[
                  TextSpan(
                      text: time,
                      style: fontInter(13,
                          color: AppColor.c595C82,
                          fontWeight: FontWeight.w600)),
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
