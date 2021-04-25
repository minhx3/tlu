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
      height: 170,
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Swiper(
        controller: controller.swiperController,
        onIndexChanged: controller.setCard,
        onTap: (index) {
          // controller.swiperController.move(index);
          pushTo(Routes.TASK);
        },
        itemBuilder: (BuildContext context, int index) {
          return Opacity(
            child: cardContentView(),
            opacity: controller.rxCardIndex() == index ? 1 : 0.2,
          );
        },
        viewportFraction: 0.8,
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
          color: AppColor.appBarDarkBackground,
          borderRadius: BorderRadius.circular(5)),
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  "Tài chính quốc tế \nTỉ giá hối đoái (P.1) ",
                  style: fontInter(16,
                      fontWeight: FontWeight.w600, color: AppColor.whiteColor),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Image.asset(
                Images.cardNotify,
                height: 16,
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                "Bài tập trắc nghiệm lấy điểm chuyên cần.Thời gian thực hiện: 8 phút",
                style: fontInter(12,
                    fontWeight: FontWeight.w500, color: AppColor.subTextColor),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: AppColor.subTextColor))),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                Images.timeClock,
                height: 20,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "10h00 - 16/01/2021",
                style: fontInter(14,
                    fontWeight: FontWeight.w600, color: AppColor.errorColor),
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
