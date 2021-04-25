import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
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
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children:
                    List.generate(10, (e) => NotificationItemView()).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
