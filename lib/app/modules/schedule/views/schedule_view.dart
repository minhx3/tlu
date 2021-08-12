import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/modules/schedule/views/header_view.dart';
import 'package:thanglong_university/app/modules/schedule/views/month_view.dart';
import 'package:thanglong_university/app/modules/schedule/views/schedule_item_view.dart';
import 'package:thanglong_university/app/modules/schedule/views/section_view.dart';
import 'package:thanglong_university/app/modules/schedule/views/week_time_view.dart';
import 'package:thanglong_university/app/views/views/app_bar_view.dart';
import 'package:thanglong_university/app/views/views/app_widget.dart';

import '../controllers/schedule_controller.dart';

class ScheduleView extends GetView<ScheduleController> {
  @override
  Widget build(BuildContext context) {
    return AppContainer(
      viewState: controller.rxViewState(),
      systemUiOverlayStyle: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColor.cf2f2f2,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppBarView(
              automaticallyImplyLeading: false,
              type: AppBarType.button,
              title: "Lịch trình",
              iconLeading: Images.iconStar,
              iconTintColor: AppColor.cffb359,
            ),
            HeaderView(),
            Obx(() => Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: ListView(
                      padding: EdgeInsets.zero,
                      children: [
                        controller.tagIndex() == 0
                            ? SizedBox()
                            : WeekTimeView(
                                timeViewType: controller.tagIndex() == 1
                                    ? TimeViewType.week
                                    : TimeViewType.month),
                        controller.tagIndex() == 2 ? MonthView() : SizedBox(),
                        Column(
                          children: [
                            controller.tagIndex() == 0
                                ? SizedBox()
                                : SectionView(),
                            Column(
                                children: controller
                                    .rxScheduleList()
                                    .map((e) => ScheduleItemView(e))
                                    .toList()),
                          ],
                        )
                      ],
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
