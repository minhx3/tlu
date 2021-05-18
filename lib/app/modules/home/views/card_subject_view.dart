import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';
import 'package:thanglong_university/app/modules/home/controllers/home_controller.dart';
import 'package:thanglong_university/app/routes/app_pages.dart';

class CardSubjectView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Swiper(
        controller: controller.swiperController,
        onIndexChanged: controller.setCard,
        onTap: (index) {
          // controller.swiperController.move(index);
          pushTo(Routes.TASK);
        },
        itemBuilder: (BuildContext context, int index) {
          return cardContentView();
        },
        viewportFraction: 0.85,
        containerWidth: double.maxFinite,
        scale: 1,
        itemCount: 3,
      ),
    );
  }

  Container cardContentView() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: boxShadow.copyWith(
          color: AppColor.c000333, borderRadius: BorderRadius.circular(5)),
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  "Kinh tế học về những vấn đề xã hội",
                  style: fontInter(16,
                      fontWeight: FontWeight.w600, color: AppColor.cfafafa),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 40),
                decoration: BoxDecoration(
                    color: AppColor.errorColor,
                    borderRadius: BorderRadius.circular(5)),
                height: 18,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                child: Text(
                  "PG122",
                  style: fontInter(10,
                      fontWeight: FontWeight.w600, color: AppColor.whiteColor),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Container(
            height: 1.5,
            color: AppColor.c14174B,
            margin: EdgeInsets.only(top: 16, bottom: 8),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(Images.timeClock,
                  height: 13, color: AppColor.cfc7171),
              SizedBox(
                width: 10,
              ),
              Text(
                "10h00 - 16/01/2021",
                style: fontInter(12,
                    fontWeight: FontWeight.w600, color: AppColor.cfc7171),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                Images.place,
                height: 13,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Phòng B605",
                style: fontInter(12,
                    fontWeight: FontWeight.w600, color: AppColor.cd9d9d9),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
