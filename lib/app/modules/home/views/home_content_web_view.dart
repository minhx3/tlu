import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thanglong_university/app/modules/home/views/home_schedule_item_view.dart';

import '../../../configuration/constant/color.dart';
import '../../../configuration/constant/font_style.dart';
import '../../../configuration/constant/global.dart';
import '../../schedule/views/month_view.dart';
import '../../schedule/views/schedule_item_view.dart';
import '../../schedule/views/schedule_item_view.dart';
import '../../schedule/views/week_time_view.dart';

class HomeContentWebView extends GetView {
  @override
  Widget build(BuildContext context) {
    double width = Get.width * 0.65;
    return Container(
      width: width,
      height: 1080,
      decoration: BoxDecoration(
          color: AppColor.whiteColor,
          border:
              Border(right: BorderSide(width: 1.5, color: AppColor.ce6e6e6))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
              top: 58,
            ),
            width: width * 0.4,
            padding: EdgeInsets.only(left: 75, right: 32),
            decoration: BoxDecoration(
                color: AppColor.whiteColor,
                border: Border(
                    right: BorderSide(width: 1.5, color: AppColor.ce6e6e6))),
            child: Column(
              children: [
                Container(
                  height: 90,
                  decoration: BoxDecoration(
                      color: AppColor.whiteColor,
                      border: Border(
                          bottom:
                              BorderSide(width: 1.5, color: AppColor.ce9e9e9))),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(81),
                        child: Image.network(
                          "https://avatars.githubusercontent.com/u/20571021?v=4",
                          height: 81,
                          width: 81,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 17),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Chào buổi sáng",
                                style: fontInter(
                                  16,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.cfc7171,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "Ngô Tiên Tiến",
                                style: fontInter(24,
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
                ),
                Container(
                  margin: EdgeInsets.only(top: 60),
                  decoration: boxShadow.copyWith(
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      WeekTimeView(),
                      MonthView(
                        height: 433,
                        showLine: false,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  margin: EdgeInsets.symmetric(vertical: 25),
                  color: AppColor.ce9e9e9,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Text("Tin tức - Sự kiện",
                          style: fontInter(16,
                              fontWeight: FontWeight.w600,
                              color: AppColor.c000333)),
                    ),
                    cardContentView(),
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                top: 58,
              ),
              padding: EdgeInsets.symmetric(horizontal: 45),
              child: Column(
                children: [
                  Container(
                    height: 90,
                    decoration: BoxDecoration(
                        color: AppColor.whiteColor,
                        border: Border(
                            bottom: BorderSide(
                                width: 1.5, color: AppColor.ce9e9e9))),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            "Thứ 2 01/02/2021",
                            style: fontInter(
                              16,
                              fontWeight: FontWeight.w600,
                              color: AppColor.c666666,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children:
                            List.generate(20, (index) => HomeScheduleItemView())
                                .toList()),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget cardContentView() {
    return Container(
      decoration: boxShadow.copyWith(
          boxShadow: [BoxShadow(color: AppColor.subTextColor.withOpacity(0.8))],
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          Container(
            height: 120,
            width: 113,
            child: Image.network(
                "https://image.exam24h.com/public/exam24h-wiki/university/3a1ed3ed61ab5122374faa140ad084c9.JPEG",
                height: 120,
                width: 144,
                fit: BoxFit.cover),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Tin nổi bật".toUpperCase(),
                        style: fontInter(12,
                            fontWeight: FontWeight.w600,
                            color: AppColor.cfc7171),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 6),
                        height: 15,
                        width: 1,
                        color: AppColor.c000333.withOpacity(0.3),
                      ),
                      Text(
                        "16/01/2021",
                        style: fontInter(12,
                            fontWeight: FontWeight.w600,
                            color: AppColor.c000333.withOpacity(0.3)),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Text(
                      "1988: Thêm một đêm đại nhạc hội thành công của Đại học Thăng Long",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: fontInter(16,
                          fontWeight: FontWeight.w600,
                          color: AppColor.c000333)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
