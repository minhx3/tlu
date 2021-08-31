import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/modules/schedule/controllers/schedule_controller.dart';

class SectionView extends GetView<ScheduleController> {
  final DateTime d;
  SectionView(this.d);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 16, bottom: 5),
      alignment: Alignment.center,
      child: Text(
        controller.getSectionDay(d),
        style:
            fontInter(14, color: AppColor.c666666, fontWeight: FontWeight.w600),
      ),
    );
  }
}
