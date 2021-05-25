import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/modules/task/views/teacher_item_view.dart';
import 'package:thanglong_university/app/views/views/app_bar_view.dart';
import 'package:thanglong_university/app/views/views/app_widget.dart';
import 'package:thanglong_university/app/views/views/button_view.dart';

import '../controllers/task_controller.dart';

class TaskView extends GetView<TaskController> {
  @override
  Widget build(BuildContext context) {
    return AppContainer(
      systemUiOverlayStyle: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        body: Column(
          children: [
            AppBarView(
              type: AppBarType.button,
              title: "Chi tiết task",
              iconLeading: Images.addNoteIcon,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(16),
                children: [
                  headerView(),
                  TeacherItemView(),
                  documentWidget(),
                  noteWidget(),
                  ButtonView(
                    title: "Chi tiết lớp học",
                    verticalSpacing: 20,
                    type: ButtonType.outline,
                    onTap: () {},
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Column headerView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: AppColor.cfc7171,
                  borderRadius: BorderRadius.circular(5)),
              height: 18,
              padding: EdgeInsets.symmetric(horizontal: 4),
              alignment: Alignment.center,
              child: Text(
                "PG122",
                style: fontInter(10,
                    fontWeight: FontWeight.w600, color: AppColor.whiteColor),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              child: SizedBox(),
            )
          ],
        ),
        Text(
          "Tài chính quốc tế \nTỉ giá hối đoái (P.1) ",
          textAlign: TextAlign.left,
          style: fontInter(24,
              fontWeight: FontWeight.w700, color: AppColor.c000333),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          color: AppColor.cfafafa,
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Lớp:",
                    style: fontInter(11,
                        fontWeight: FontWeight.w600, color: AppColor.c808080),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Text(
                    "TCQUOCTE1.1",
                    style: fontInter(12,
                        fontWeight: FontWeight.w600, color: AppColor.c4d4d4d),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 7),
                height: 1,
                color: AppColor.cf2f2f2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(Images.timeClock,
                      height: 15, color: AppColor.cfc7171),
                  SizedBox(
                    width: 7,
                  ),
                  Text(
                    "10h00 - 16/01/2021",
                    style: fontInter(12,
                        fontWeight: FontWeight.w600, color: AppColor.cfc7171),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              SizedBox(
                height: 7,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(Images.location,
                      height: 15, fit: BoxFit.contain, color: AppColor.c000333),
                  SizedBox(
                    width: 7,
                  ),
                  Text(
                    "Phòng 605",
                    style: fontInter(12,
                        fontWeight: FontWeight.w600, color: AppColor.c000333),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column documentWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 10),
          child: Text(
            "Mô tả task",
            style: fontInter(14,
                fontWeight: FontWeight.w600, color: AppColor.c4d4d4d),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(
          height: 2,
        ),
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: AppColor.cfafafa, borderRadius: BorderRadius.circular(3)),
          child: Text(
            "Bài tập trắc nghiệm lấy điểm chuyên cần.\nThời gian thực hiện: 8 phút\nCả lớp đọc qua tài liều để chuẩn bị kĩ hơn.",
            overflow: TextOverflow.ellipsis,
            style: fontInter(12,
                fontWeight: FontWeight.w500, color: AppColor.c808080),
          ),
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: AppColor.cfafafa, borderRadius: BorderRadius.circular(3)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: "Giáo trình Tài chính quốc tế",
                    style: fontInter(12,
                        textDecoration: TextDecoration.underline,
                        color: AppColor.c000333,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500),
                  )),
              Image.asset(
                Images.shareIcon,
                width: 20,
                height: 20,
              )
            ],
          ),
        ),
      ],
    );
  }

  Column noteWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 10),
          child: Text(
            "Note",
            style: fontInter(14,
                fontWeight: FontWeight.w600, color: AppColor.c4d4d4d),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(
          height: 2,
        ),
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: AppColor.cfafafa, borderRadius: BorderRadius.circular(3)),
          child: Text(
            "Chuẩn bị slide thuyết trình\nCâu hỏi phản biện các nhóm khác",
            overflow: TextOverflow.ellipsis,
            style: fontInter(12,
                fontWeight: FontWeight.w500, color: AppColor.c808080),
          ),
        ),
      ],
    );
  }
}
