import 'package:flutter/material.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:get/get.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';
import 'package:thanglong_university/app/views/views/link_view.dart';

enum AppBarType { info, navigator, tab, chat, notfication, button }

class AppBarView extends StatelessWidget {
  final AppBarType type;
  final String title;
  final String subTitle;
  const AppBarView({Key key, this.type, this.title, this.subTitle})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60 + context.mediaQueryPadding.top,
      padding: EdgeInsets.only(top: context.mediaQueryPadding.top),
      color: getColor(),
      child: Builder(builder: (context) {
        switch (type) {
          case AppBarType.info:
            // TODO: Handle this case.
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              height: 60,
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Chào buổi sáng",
                            style: fontInter(14,
                                fontWeight: FontWeight.w600,
                                color: AppColor.textColor)),
                        Text(
                          "Ngô Tiên Tiến",
                          style: fontInter(18,
                              fontWeight: FontWeight.w600,
                              color: AppColor.errorColor),
                        )
                      ],
                    ),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      IconButton(
                        icon: Image.asset(
                          Images.notification,
                          width: 20,
                          height: 20,
                        ),
                        onPressed: () {},
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 20, left: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.errorColor),
                        height: 10,
                        width: 10,
                      )
                    ],
                  )
                ],
              ),
            );
            break;

          case AppBarType.tab:
            // TODO: Handle this case.
            return Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 60,
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: AppColor.textColor,
                    ),
                    Expanded(
                      child: Text("Tin tức & sự kiện",
                          style: fontInter(16,
                              fontWeight: FontWeight.w600,
                              color: AppColor.textColor)),
                    ),
                    SizedBox(
                      height: 35,
                      child: Row(
                        children: [
                          Container(
                            height: 33,
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                                color: AppColor.tabUnSelectedColor,
                                borderRadius: BorderRadius.circular(3)),
                            alignment: Alignment.center,
                            child: Text("Ngành 1",
                                style: fontInter(12,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.subTextColor)),
                          ),
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: AppColor.errorColor,
                                borderRadius: BorderRadius.circular(3)),
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            height: 35,
                            child: Text("Ngành 2",
                                style: fontInter(12,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.whiteColor)),
                          )
                        ],
                      ),
                    )
                  ],
                ));
            break;
          case AppBarType.chat:
            // TODO: Handle this case.
            break;
          case AppBarType.navigator:
            return Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 60,
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: AppColor.whiteColor,
                    ),
                    Text("Tin tức & sự kiện",
                        style: fontInter(16,
                            fontWeight: FontWeight.w600,
                            color: AppColor.whiteColor)),
                  ],
                ));
            break;
          case AppBarType.notfication:
            return Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 60,
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      color: AppColor.textColor,
                    ),
                    Expanded(
                      child: Text("Tin tức & sự kiện",
                          style: fontInter(16,
                              fontWeight: FontWeight.w600,
                              color: AppColor.textColor)),
                    ),
                    LinkView(
                      "Đánh đâu đã đọc hết",
                      onTap: () {},
                    ),
                  ],
                ));
            break;
          case AppBarType.button:
            return Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 60,
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Icon(Icons.arrow_back_ios, color: AppColor.whiteColor),
                    Expanded(
                      child: Text("Tin tức & sự kiện",
                          style: fontInter(16,
                              fontWeight: FontWeight.w600,
                              color: AppColor.whiteColor)),
                    ),
                    SizedBox(
                      height: 35,
                      width: 95,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: AppColor.errorColor,
                            borderRadius: BorderRadius.circular(3)),
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        height: 35,
                        child: Text("Xem điểm",
                            style: fontInter(12,
                                fontWeight: FontWeight.w600,
                                color: AppColor.whiteColor)),
                      ),
                    )
                  ],
                ));
            break;
        }

        return Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 60,
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios, color: AppColor.whiteColor),
                Expanded(
                  child: Text("Tin tức & sự kiện",
                      style: fontInter(16,
                          fontWeight: FontWeight.w600,
                          color: AppColor.whiteColor)),
                ),
                SizedBox(
                  height: 35,
                  width: 95,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: AppColor.errorColor,
                        borderRadius: BorderRadius.circular(3)),
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    height: 35,
                    child: Text("Xem điểm",
                        style: fontInter(12,
                            fontWeight: FontWeight.w600,
                            color: AppColor.whiteColor)),
                  ),
                )
              ],
            ));
      }),
    );
  }

  getColor() {
    switch (type) {
      case AppBarType.info:
        // TODO: Handle this case.
        return AppColor.appBarWhiteBackground;
        break;

      case AppBarType.navigator:
        // TODO: Handle this case.
        return AppColor.appBarDarkBackground;

        break;
      case AppBarType.tab:
        return AppColor.appBarWhiteBackground;

        break;
      case AppBarType.chat:
        // TODO: Handle this case.
        break;
      case AppBarType.notfication:
        return AppColor.appBarWhiteBackground;
        break;
      case AppBarType.button:
        return AppColor.appBarDarkBackground;
        break;
    }
    return AppColor.appBarDarkBackground;
  }
}
