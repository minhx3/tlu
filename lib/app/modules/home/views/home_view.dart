import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/view_state.dart';
import 'package:thanglong_university/app/modules/home/views/card_news_view.dart';
import 'package:thanglong_university/app/modules/home/views/card_subject_info_view.dart';
import 'package:thanglong_university/app/modules/home/views/card_subject_view.dart';
import 'package:thanglong_university/app/modules/home/views/menu_view.dart';
import 'package:thanglong_university/app/views/views/app_bar_view.dart';
import 'package:thanglong_university/app/views/views/app_widget.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => AppContainer(
          child: Container(
              color: AppColor.cf6f6f6,
              child: Column(
                children: [
                  AppBarView(
                    type: AppBarType.info,
                  ),
                  Expanded(
                    child: controller.rxViewState() == ViewState.loading
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView(
                            padding: EdgeInsets.zero,
                            children: [
                              controller.rxCalendarList().length > 0
                                  ? CardSubjectView(controller.rxCalendarList())
                                  : SizedBox(),
                              MenuView()
                                  .marginOnly(bottom: 7, right: 18, left: 18),
                              Divider(
                                  thickness: 1,
                                  color: AppColor.ce6e6e6,
                                  height: 24,
                                  indent: 15,
                                  endIndent: 15),
                              controller.rxAlert() != null
                                  ? CardSubjectInfoView(
                                      controller.rxAlert(),
                                      cardSubjectType: controller
                                              .rxAlert()
                                              .getIsOpenReigsterTime()
                                          ? CardSubjectType.inprogress
                                          : CardSubjectType.pending,
                                    ).marginOnly(bottom: 20)
                                  : SizedBox(),
                              CardNewsView(controller.rxNewsList())
                            ],
                          ),
                  )
                ],
              )),
        ));
  }
}
