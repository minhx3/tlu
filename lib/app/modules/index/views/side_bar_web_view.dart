import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Images/resources.dart';
import '../../../configuration/constant/color.dart';
import '../../../configuration/constant/font_style.dart';
import '../controllers/index_controller.dart';

class SideBarWebView extends GetView<IndexController> {
  @override
  Widget build(BuildContext context) {
    double barWidth = Get.width * 0.15;
    return Container(
      width: barWidth,
      padding: EdgeInsets.symmetric(
          horizontal: barWidth * 30 / barWidth, vertical: 30),
      height: 1080,
      decoration: BoxDecoration(
          color: AppColor.whiteColor,
          border:
              Border(right: BorderSide(width: 1.5, color: AppColor.ce6e6e6))),
      child: Column(
        children: [
          Image.network(
            Images.logoWeb,
            fit: BoxFit.contain,
            width: 190,
            height: 100,
          ),
          Obx(() => ListView(
                shrinkWrap: true,
                children: controller.sideMenuList
                    .map((e) => menuItem(e, controller.sideMenuList.indexOf(e)))
                    .toList(),
              )),
          Expanded(child: SizedBox()),
          Container(
            height: 90,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(44),
                  child: Image.network(
                    "https://avatars.githubusercontent.com/u/20571021?v=4",
                    height: 44,
                    width: 44,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 17),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 62,
                          decoration: BoxDecoration(
                              color: AppColor.cfc7171,
                              borderRadius: BorderRadius.circular(5)),
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                          alignment: Alignment.center,
                          child: Text(
                            "18050342",
                            style: fontInter(10,
                                fontWeight: FontWeight.w600,
                                color: AppColor.whiteColor),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          "Ngô Tiên Tiến",
                          style: fontInter(16,
                              fontWeight: FontWeight.w600,
                              color: AppColor.c000333),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget menuItem(String title, int index) => InkWell(
        onTap: () {
          controller.setSideBar(index);
        },
        child: Container(
          height: 57,
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: fontInter(14,
                fontWeight: FontWeight.w600,
                color: index == controller.rxSideBarIndex()
                    ? AppColor.c000333
                    : AppColor.c808080),
          ),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 2, color: AppColor.cf2f2f2))),
        ),
      );
}
