import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/modules/schedule/controllers/schedule_controller.dart';

class SectionView extends GetView<ScheduleController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      child: Text(
        controller.getSectionDay(DateTime.now()),
        style:
            fontInter(16, color: AppColor.c666666, fontWeight: FontWeight.w600),
      ),
    );
  }
}
