import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/configuration/constant/view_state.dart';
import 'package:thanglong_university/app/model/chat/group_chat_model.dart';
import 'package:thanglong_university/app/model/schedule_model.dart';
import 'package:thanglong_university/app/modules/chat/controllers/chat_cotroller.dart';
import 'package:thanglong_university/app/modules/chat/views/item_group_chat_by_subject_view.dart';
import 'package:thanglong_university/app/modules/home/views/card_news_view.dart';
import 'package:thanglong_university/app/modules/home/views/card_subject_info_view.dart';
import 'package:thanglong_university/app/modules/home/views/card_subject_view.dart';
import 'package:thanglong_university/app/modules/home/views/menu_view.dart';
import 'package:thanglong_university/app/service/storage/storage.dart';
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
                  isTeacher
                      ? _TeacherDashboardView(
                          viewState: controller.rxViewState(),
                          calendarList: controller.rxCalendarList(),
                        )
                      : studentDashboardView(),
                ],
              )),
        ));
  }

  Widget studentDashboardView() {
    return Expanded(
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
                MenuView().marginOnly(bottom: 7, right: 18, left: 18),
                Divider(
                    thickness: 1,
                    color: AppColor.ce6e6e6,
                    height: 24,
                    indent: 15,
                    endIndent: 15),
                controller.rxAlert() != null
                    ? CardSubjectInfoView(
                        controller.rxAlert(),
                        cardSubjectType:
                            controller.rxAlert().getIsOpenReigsterTime()
                                ? CardSubjectType.inprogress
                                : CardSubjectType.pending,
                      ).marginOnly(bottom: 20)
                    : SizedBox(),
                CardNewsView(controller.rxNewsList())
              ],
            ),
    );
  }
}

// ignore: must_be_immutable
class _TeacherDashboardView extends StatelessWidget {
  final ViewState viewState;
  final List<ScheduleModel> calendarList;

  _TeacherDashboardView({Key key, this.viewState, this.calendarList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: viewState == ViewState.loading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GetX<ChatController>(
              init: ChatController(),
              // initState: (_) {},
              builder: (controller) {
                return ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    calendarList.length > 0
                        ? CardSubjectView(calendarList)
                        : SizedBox(),
                    Text(
                      "Bạn có ${controller.getGroupWithBadge.length} tin nhắn mới",
                      style: fontInter(12,
                          color: AppColor.c000333, fontWeight: FontWeight.w600),
                    )
                        .paddingSymmetric(vertical: 16, horizontal: 20)
                        .marginOnly(left: 25),
                    Divider(
                      thickness: 1,
                      height: 10,
                      indent: 25,
                      endIndent: 25,
                      color: AppColor.lineColor,
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (c, index) {
                        GroupChatModel g =
                            controller.getGroupWithBadge[index];
                        return ItemGroupChatBySubjectView(
                          item: g,
                        );
                      },
                      itemCount: controller.getGroupWithBadge.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return Divider(
                          thickness: 1,
                          indent: 10,
                          endIndent: 10,
                          color: AppColor.lineColor,
                        );
                      },
                    ).paddingSymmetric(horizontal: 15),
                  ],
                );
              },
            ),
    );
  }
}
