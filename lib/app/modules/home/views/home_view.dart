import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/modules/home/views/card_news_view.dart';
import 'package:thanglong_university/app/modules/home/views/card_subject_info_view.dart';
import 'package:thanglong_university/app/modules/home/views/card_subject_view.dart';
import 'package:thanglong_university/app/modules/home/views/menu_view.dart';
import 'package:thanglong_university/app/views/views/app_bar_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColor.cf6f6f6,
        child: Column(
          children: [
            AppBarView(
              type: AppBarType.info,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  CardSubjectView(),
                  MenuView(),
                  CardSubjectInfoView(
                    cardSubjectType: CardSubjectType.pending,
                  ),
                  CardSubjectInfoView(
                    cardSubjectType: CardSubjectType.inprogress,
                  ),
                  CardNewsView()
                ],
              ),
            )
          ],
        ));
  }
}
