import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/model/user_info_model.dart';
import 'package:thanglong_university/app/modules/chat/views/chat_view.dart';
import 'package:thanglong_university/app/modules/education/views/education_view.dart';
import 'package:thanglong_university/app/modules/home/views/home_view.dart';
import 'package:thanglong_university/app/modules/index/views/index_content_web_view.dart';
import 'package:thanglong_university/app/modules/index/views/side_bar_web_view.dart';
import 'package:thanglong_university/app/modules/profile/controllers/profile_controller.dart';
import 'package:thanglong_university/app/modules/schedule/views/schedule_view.dart';
import 'package:thanglong_university/app/modules/profile/views/profile_view.dart';
import 'package:thanglong_university/app/views/views/app_widget.dart';
import 'package:thanglong_university/app/views/views/image_view.dart';

import '../controllers/index_controller.dart';

class IndexView extends GetView<IndexController> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, info) {
      // Check the sizing information here and return your UI
      if (info.deviceScreenType == DeviceScreenType.desktop) {
        return Scaffold(
          body: Row(
            children: [SideBarWebView(), IndexContentWebView()],
          ),
        );
      } else {
        return Obx(
          () {
            UserInfo _profile = ProfileController.to.rxUserInfo();
            return AppContainer(
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
                    selectedFontSize: 0,
                    iconSize: 0,
                    onTap: controller.setTab,
                    type: BottomNavigationBarType.fixed,
                    items: controller.tabsList.map((e) {
                      final index = controller.tabsList.indexOf(e);

                      // replace profile tab by avatar image
                      if (index == 4 && _profile?.avatar != null) {
                        return BottomNavigationBarItem(
                            icon: CircleAvatar(
                              radius: 15,
                              backgroundColor: AppColor.iconTabSelected,
                              child: CircleAvatar(
                                radius: index == controller.rxTabIndex()
                                    ? 13.5
                                    : 15,
                                backgroundColor: Colors.white,
                                backgroundImage: NetworkImage(_profile.avatar),
                              ),
                            ),
                            label: "");
                      }

                      return BottomNavigationBarItem(
                          icon: ImageView(
                            index == controller.rxTabIndex()
                                ? e.iconSelected
                                : e.icon,
                            type: e.type ?? Type.assets,
                            fit: BoxFit.contain,
                            width: 25,
                            height: 25,
                            color: index == controller.rxTabIndex()
                                ? AppColor.iconTabSelected
                                : AppColor.iconTabUnSelected,
                          ),
                          label: "");
                    }).toList(),
                  )),
            );
          },
        );
      }
    });
  }
}
