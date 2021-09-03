import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/configuration/constant/view_state.dart';
import 'package:thanglong_university/app/modules/notification/views/notification_item_view.dart';
import 'package:thanglong_university/app/views/views/app_bar_view.dart';
import 'package:thanglong_university/app/views/views/app_widget.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: Scaffold(
        backgroundColor: AppColor.homeBackground,
        body: Column(
          children: [
            AppBarView(
              type: AppBarType.notfication,
            ),
            Obx(
              () => Expanded(
                child: controller.rxViewState() == ViewState.loading
                    ? Center(child: CircularProgressIndicator()).marginAll(30)
                    : (controller.rxNotifications().length == 0
                        ? Text(
                            "Chưa có thông báo nào dành cho bạn.",
                            style: fontInter(12,
                                fontStyle: FontStyle.italic,
                                color: AppColor.cbfbfbf),
                          ).paddingAll(30)
                        : ListView(
                            padding: EdgeInsets.zero,
                            children: (controller.rxNotifications() ?? [])
                                .map((notification) => NotificationItemView(
                                      notification: notification,
                                    ))
                                .toList())),
              ),
            )
          ],
        ),
      ),
    );
  }
}
