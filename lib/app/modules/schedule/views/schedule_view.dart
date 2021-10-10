import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/modules/index/controllers/index_controller.dart';
import 'package:thanglong_university/app/modules/schedule/views/header_view.dart';
import 'package:thanglong_university/app/modules/schedule/views/month_view.dart';
import 'package:thanglong_university/app/modules/schedule/views/schedule_item_view.dart';
import 'package:thanglong_university/app/modules/schedule/views/section_view.dart';
import 'package:thanglong_university/app/modules/schedule/views/week_time_view.dart';
import 'package:thanglong_university/app/views/views/app_bar_view.dart';
import 'package:thanglong_university/app/views/views/app_widget.dart';

import '../controllers/schedule_controller.dart';

// ignore: must_be_immutable
class ScheduleView extends GetView<ScheduleController> {
  IndexController indexController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() => AppContainer(
          viewState: controller.rxViewState(),
          systemUiOverlayStyle: SystemUiOverlayStyle.light,
          child: Scaffold(
            backgroundColor: AppColor.cf2f2f2,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Obx(() => AppBarView(
                      type: AppBarType.button,
                      title: "Thời khóa biểu",
                      iconLeading: Images.iconStar,
                      onAction: () => controller.switchFilter(),
                      onBack: () {
                        indexController.setTab(0);
                      },
                      iconTintColor: controller.isFilter.isTrue
                          ? AppColor.cffb359
                          : Colors.white,
                    )),
                HeaderView(),
                Obx(() => Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: ListView(
                          padding: EdgeInsets.zero,
                          children: [
                            controller.tagIndex() == 0
                                ? SizedBox()
                                : WeekTimeView(
                                    timeViewType: controller.tagIndex() == 1
                                        ? TimeViewType.week
                                        : TimeViewType.month),
                            controller.tagIndex() == 2
                                ? MonthView()
                                : SizedBox(),
                            Column(
                              children:
                                  controller.listScheduleGroupByDate.entries
                                      .map((e) => Column(children: [
                                            SectionView(DateTime.parse(e.key)),
                                            ...e.value
                                                .map((f) => ScheduleItemView(
                                                      f,
                                                      toggleFavourite: () =>
                                                          controller
                                                              .toggleFavourite(
                                                                  f.taskId,
                                                                  !f.favourite),
                                                    ))
                                                .toList()
                                          ]))
                                      .toList(),
                            )
                          ],
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}
