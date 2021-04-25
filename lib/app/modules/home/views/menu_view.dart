import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/modules/home/controllers/home_controller.dart';
import 'package:thanglong_university/app/modules/home/model/menu_item.dart';

class MenuView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      height: 107,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: controller.rxMenuList().map((e) => menuItem(e)).toList(),
          )
        ],
      ),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: AppColor.inputBackground),
              top: BorderSide(color: AppColor.inputBackground))),
    );
  }

  Column menuItem(MenuHomeItem item) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          item.icon,
          height: 70,
          width: 70,
          fit: BoxFit.contain,
        ),
        Text(
          item.title,
          style: fontInter(11,
              fontWeight: FontWeight.w600,
              color: AppColor.appBarDarkBackground.withOpacity(0.3)),
        )
      ],
    );
  }
}
