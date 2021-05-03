import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/app/views/views/app_bar_view.dart';
import 'package:thanglong_university/app/views/views/app_widget.dart';

import '../controllers/detai_class_controller.dart';

class DetaiClassView extends GetView<DetaiClassController> {
  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: Scaffold(
        body: Column(
          children: [
            AppBarView(
              type: AppBarType.button,
              title: "Chi tiết task",
              buttonTitle: "Thêm note",
            ),
            Expanded(
              child: ListView(
                children: [],
              ),
            )
          ],
        ),
      ),
    );
  }
}
