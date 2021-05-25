import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thanglong_university/app/modules/home/views/home_content_web_view.dart';
import '../controllers/index_controller.dart';

class IndexContentWebView extends GetView<IndexController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          child: IndexedStack(
            index: controller.rxSideBarIndex(),
            children: [
              SingleChildScrollView(
                child: Row(
                  children: [HomeContentWebView()],
                ),
              ),
              Container()
            ],
          ),
        ));
  }
}
