import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/modules/chat/views/chat_view.dart';
import 'package:thanglong_university/app/modules/education/views/education_view.dart';
import 'package:thanglong_university/app/modules/home/views/home_view.dart';
import 'package:thanglong_university/app/modules/schedule/views/schedule_view.dart';
import 'package:thanglong_university/app/modules/profile/views/profile_view.dart';
import 'package:thanglong_university/app/views/views/app_widget.dart';
import 'package:thanglong_university/app/views/views/image_view.dart';

import '../controllers/index_controller.dart';

class IndexView extends GetView<IndexController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => AppContainer(
          viewState: controller.rxViewState(),
          child: Scaffold(
              body: IndexedStack(
                index: controller.rxTabIndex(),
                children: [
                  HomeView(),
                  ScheduleView(),
                  EducationView(),
                  ChatView(),
                  ProfileView()
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                onTap: controller.setTab,
                type: BottomNavigationBarType.fixed,
                items: controller.tabsList.map((e) {
                  final index = controller.tabsList.indexOf(e);

                  return BottomNavigationBarItem(
                      icon: ImageView(
                        index == controller.rxTabIndex()
                            ? e.iconSelected
                            : e.icon,
                        type: index == 4 ? Type.assets : Type.assets,
                        width: 24,
                        height: 24,
                        color: index == controller.rxTabIndex()
                            ? AppColor.iconTabSelected
                            : AppColor.iconTabUnSelected,
                      ),
                      title: SizedBox());
                }).toList(),
              )),
        ));
  }
}
