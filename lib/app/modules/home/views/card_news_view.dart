import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';
import 'package:thanglong_university/app/modules/home/controllers/home_controller.dart';
import 'package:thanglong_university/app/routes/app_pages.dart';
import 'package:thanglong_university/app/views/views/image_view.dart';

class CardNewsView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text("Tin tức - Sự kiện",
                style: fontInter(12,
                    fontWeight: FontWeight.w600, color: AppColor.textColor)),
          ),
          Container(
            height: 255,
            child: Swiper(
              controller: SwiperController(),
              onIndexChanged: controller.setCard,
              onTap: (index) {
                pushTo(Routes.DETAIL_NEW);
              },
              itemBuilder: (BuildContext context, int index) {
                return cardContentView();
              },
              viewportFraction: 0.8,
              containerWidth: double.maxFinite,
              scale: 1,
              itemCount: 3,
            ),
          ),
        ],
      ),
    );
  }

  Container cardContentView() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      decoration: boxShadow.copyWith(
          boxShadow: [BoxShadow(color: AppColor.subTextColor.withOpacity(0.8))],
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 152,
            child: ImageView(
              "https://vinades.vn/uploads/news/2019_12/chi-nhai-tran-ceo-beauty-dental-chup-anh-voi-sinh-vien-tlu.jpg",
              height: 152,
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Tin nổi bật".toUpperCase(),
                      style: fontInter(11,
                          fontWeight: FontWeight.w600,
                          color: AppColor.errorColor),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 24,
                      child: Container(
                        height: 15,
                        width: 1,
                        color: AppColor.appBarDarkBackground.withOpacity(0.3),
                      ),
                    ),
                    Text(
                      "16/01/2021",
                      style: fontInter(11,
                          fontWeight: FontWeight.w600,
                          color:
                              AppColor.appBarDarkBackground.withOpacity(0.3)),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Text(
                    "1988: Thêm một đêm đại nhạc hội thành công của Đại học Thăng Long",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: fontInter(14,
                        fontWeight: FontWeight.w600,
                        color: AppColor.textColor)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
