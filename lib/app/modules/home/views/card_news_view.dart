import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';
import 'package:thanglong_university/app/model/news_model.dart';
import 'package:thanglong_university/app/modules/home/controllers/home_controller.dart';
import 'package:thanglong_university/app/routes/app_pages.dart';
import 'package:thanglong_university/app/views/views/image_view.dart';

class CardNewsView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text("Tin tức - Sự kiện",
                    style: fontInter(12,
                        fontWeight: FontWeight.w600,
                        color: AppColor.textColor)),
              ),
              Container(
                height: 255,
                child: PageView.builder(
                  onPageChanged: (index) {
                    controller.setCard(index);
                  },
                  controller: PageController(
                    viewportFraction: 0.8,
                    initialPage: 0,
                  ),
                  // onTap: (index) {
                  //   pushTo(Routes.DETAIL_NEW);
                  // },
                  itemBuilder: (BuildContext context, int index) {
                    return cardContentView(
                        controller.rxNewsList()[index], index);
                  },

                  itemCount: controller.rxNewsList().length,
                ),
              ),
            ],
          ),
        ));
  }

  Container cardContentView(NewsModel item, int index) {
    final f = new DateFormat('dd-MM-yyyy');
    if (item.thumb == null) {
      if (item.imageDescription?.contains("http") == false)
        controller.rxNewsList()[index].thumb = base64Decode(
            item.imageDescription.replaceAll("data:image/jpeg;base64,", ""));
    }
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
            child: item?.imageDescription != null &&
                    item.imageDescription.contains("http")
                ? Image.network(
                    item?.imageDescription,
                    height: 152,
                    fit: BoxFit.fitWidth,
                  )
                : Image.memory(
                    item.thumb,
                    height: 152,
                    fit: BoxFit.fitWidth,
                  ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${item.type == "EVENT" ? "SỰ KIỆN" : "TIN NỔI BẬT"}"
                          .toUpperCase(),
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
                      "${f.format(item.publishingTime)}",
                      style: fontInter(11,
                          fontWeight: FontWeight.w600,
                          color:
                              AppColor.appBarDarkBackground.withOpacity(0.3)),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Text("${item.title ?? ""}",
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
