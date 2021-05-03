import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/modules/schedule/views/filter_view.dart';
import 'package:thanglong_university/app/modules/schedule/views/header_view.dart';
import 'package:thanglong_university/app/modules/schedule/views/month_view.dart';
import 'package:thanglong_university/app/modules/schedule/views/schedule_item_view.dart';
import 'package:thanglong_university/app/modules/schedule/views/week_time_view.dart';
import 'package:thanglong_university/app/views/views/app_bar_view.dart';
import 'package:thanglong_university/app/views/views/app_widget.dart';

import '../controllers/schedule_controller.dart';

class ScheduleView extends GetView<ScheduleController> {
  @override
  Widget build(BuildContext context) {
    return AppContainer(
      systemUiOverlayStyle: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColor.homeBackground,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppBarView(
              automaticallyImplyLeading: false,
              type: AppBarType.button,
              title: "Lịch trình",
            ),
            HeaderView(),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    WeekTimeView(),
                    MonthView(),
                    FilterView(),
                    ScheduleItemView()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
