import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/modules/home/controllers/home_controller.dart';
import 'package:thanglong_university/app/modules/home/model/menu_item.dart';

class MenuView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      height: 100,
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
        bottom: BorderSide(color: AppColor.ce6e6e6),
      )),
    );
  }

  Column menuItem(MenuHomeItem item) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 54,
          width: 54,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 3),
                  blurRadius: 5,
                  spreadRadius: 3,
                  color: AppColor.c010A58.withOpacity(0.1),
                ),
              ],
              color: AppColor.cfc2626),
          padding: EdgeInsets.all(16),
          child: Image.asset(
            item.icon,
            fit: BoxFit.contain,
            color: AppColor.whiteColor,
          ),
          margin: EdgeInsets.only(bottom: 8),
        ),
        Text(
          item.title,
          style: fontInter(11,
              fontWeight: FontWeight.w600, color: AppColor.c595C82),
        )
      ],
    );
  }
}
