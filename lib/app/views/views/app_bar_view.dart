import 'package:flutter/material.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:get/get.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';
import 'package:thanglong_university/app/modules/notification/controllers/notification_controller.dart';
import 'package:thanglong_university/app/routes/app_pages.dart';
import 'package:thanglong_university/app/views/views/link_view.dart';

enum AppBarType {
  info,
  navigator,
  tab,
  chat,
  notfication,
  white,
  button,
  icon,
  detail
}

class AppBarView extends StatelessWidget {
  final AppBarType type;
  final String title;
  final String subTitle;
  final Function onBack;
  final String buttonTitle;
  final String iconLeading;
  final Color iconTintColor;
  final bool automaticallyImplyLeading;
  final Function onAction;
  final List<Widget> actions;
  final Color titleColor;
  final Color backgroundColor;
  final double iconSize;

  const AppBarView(
      {Key key,
      this.type,
      this.title,
      this.onBack,
      this.automaticallyImplyLeading = true,
      this.subTitle,
      this.buttonTitle,
      this.onAction,
      this.iconTintColor = AppColor.whiteColor,
      this.iconLeading,
      this.actions,
      this.titleColor,
      this.backgroundColor,
      this.iconSize = 20})
      : super(key: key);

  Widget lineLight() => Container(
      color: AppColor.cf2f2f2,
      width: 1,
      height: 26,
      margin: EdgeInsets.only(left: 15, right: 10));

  Widget lineDark() => Container(
      color: AppColor.c33355a,
      width: 1,
      height: 26,
      margin: EdgeInsets.only(left: 15, right: 10));

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60 + context.mediaQueryPadding.top,
      padding: EdgeInsets.only(top: context.mediaQueryPadding.top),
      decoration: boxShadow.copyWith(
        boxShadow: [
          BoxShadow(
            blurRadius: 12,
            spreadRadius: 6,
            color: Colors.black.withOpacity(0.1),
          )
        ],
        color: backgroundColor ?? getColor(),
      ),
      child: Builder(builder: (context) {
        switch (type) {
          case AppBarType.info:
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
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
                                color: AppColor.c000333)),
                        Text(
                          "Ngô Tiên Tiến",
                          style: fontInter(18,
                              fontWeight: FontWeight.w600,
                              color: AppColor.cfc2626),
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
                        onPressed: () {
                          pushTo(Routes.NOTIFICATION);
                        },
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: EdgeInsets.only(bottom: 20, left: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.cfc2626),
                          height: 10,
                          width: 10,
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
            break;
          case AppBarType.tab:
            return Container(
                padding: const EdgeInsets.only(
                    left: 20, top: 22, right: 15, bottom: 17),
                height: 60,
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    automaticallyImplyLeading == false
                        ? SizedBox()
                        : SizedBox(
                            width: 14,
                            child: InkWell(
                              onTap: () {
                                pop();
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: AppColor.textColor,
                                size: 18,
                              ),
                            ),
                          ),
                    automaticallyImplyLeading ? lineLight() : SizedBox(),
                    Expanded(
                      child: Text(title,
                          style: fontInter(16,
                              fontWeight: FontWeight.w600,
                              color: AppColor.textColor)),
                    ),
                  ],
                ));
            break;
          case AppBarType.chat:
            return _ChatAppBar();
          case AppBarType.navigator:
            return Container(
                padding: const EdgeInsets.only(
                    left: 20, top: 22, right: 15, bottom: 17),
                height: 60,
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    SizedBox(
                      width: 14,
                      child: InkWell(
                        onTap: () {
                          onBack != null ? onBack() : pop();
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: AppColor.whiteColor,
                          size: 18,
                        ),
                      ),
                    ),
                    lineDark(),
                    Expanded(
                      child: Text(title ?? "Tin tức - Sự kiện",
                          style: fontInter(16,
                              fontWeight: FontWeight.w600,
                              color: AppColor.whiteColor)),
                    ),
                  ],
                ));
            break;
          case AppBarType.notfication:
            NotificationController notificationController =
                Get.find<NotificationController>();
            return Container(
                padding:
                    EdgeInsets.only(left: 20, top: 22, right: 15, bottom: 17),
                height: 60,
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    SizedBox(
                      width: 14,
                      child: InkWell(
                        onTap: () {
                          pop();
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: AppColor.textColor,
                          size: 18,
                        ),
                      ),
                    ),
                    lineLight(),
                    Expanded(
                      child: Text("Thông báo",
                          style: fontInter(16,
                              fontWeight: FontWeight.w600,
                              color: AppColor.textColor)),
                    ),
                    LinkView(
                      "Đánh dấu đã đọc hết",
                      textColor: AppColor.c666666,
                      onTap: () => notificationController.readAll(),
                    ),
                  ],
                ));
            break;
          case AppBarType.white:
            return Container(
                padding:
                    EdgeInsets.only(left: 20, top: 22, right: 15, bottom: 17),
                height: 60,
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    SizedBox(
                      width: 14,
                      child: InkWell(
                        onTap: () {
                          pop();
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: AppColor.textColor,
                          size: 18,
                        ),
                      ),
                    ),
                    lineLight(),
                    Expanded(
                      child: Text(title,
                          style: fontInter(16,
                              height: 1,
                              fontWeight: FontWeight.w600,
                              color: AppColor.textColor)),
                    ),
                    iconLeading != null
                        ? IconButton(
                            icon: Image.asset(
                              iconLeading,
                              width: iconSize,
                              height: iconSize,
                              color: iconTintColor,
                            ),
                            onPressed: () {
                              onAction();
                            },
                          )
                        : SizedBox(),
                  ],
                ));
            break;
          case AppBarType.button:
            return Container(
                padding:
                    EdgeInsets.only(left: 20, top: 22, right: 15, bottom: 17),
                height: 60,
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    automaticallyImplyLeading
                        ? SizedBox(
                            height: 14,
                            child: InkWell(
                              child: Icon(Icons.arrow_back_ios,
                                  color: iconTintColor ?? AppColor.whiteColor,
                                  size: 18),
                              onTap: () {
                                pop();
                              },
                            ),
                          )
                        : SizedBox(),
                    automaticallyImplyLeading ? lineDark() : SizedBox(),
                    Expanded(
                      child: Text(title ?? "",
                          style: fontInter(16,
                              fontWeight: FontWeight.w600,
                              color: titleColor ?? AppColor.whiteColor)),
                    ),
                    iconLeading != null
                        ? IconButton(
                            icon: Image.asset(
                              iconLeading,
                              width: 20,
                              height: 20,
                              color: iconTintColor,
                            ),
                            onPressed: () {
                              if (this.onAction != null) {
                                return this.onAction();
                              }
                              pushTo(Routes.NOTIFICATION);
                            },
                          )
                        : SizedBox(),
                  ],
                ));
          case AppBarType.icon:
            return Container(
              padding: const EdgeInsets.only(
                  left: 20, top: 22, right: 15, bottom: 17),
              height: 60,
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  InkWell(
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: AppColor.textColor,
                      size: 18,
                    ),
                    onTap: () {
                      pop();
                    },
                  ),
                  lineLight(),
                  Expanded(
                    child: Text(title ?? "",
                        style: fontInter(16,
                            fontWeight: FontWeight.w600,
                            color: AppColor.textColor)),
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      IconButton(
                        icon: Image.asset(
                          iconLeading,
                          width: 20,
                          height: 20,
                        ),
                        onPressed: () {
                          onAction();
                        },
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: EdgeInsets.only(bottom: 20, left: 20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.errorColor),
                          height: 10,
                          width: 10,
                        ),
                      )
                    ],
                  )
                ],
              ),
            );

            break;
          case AppBarType.detail:
            return Container(
              padding: const EdgeInsets.only(
                  left: 20, top: 22, right: 15, bottom: 17),
              height: 60,
              color: AppColor.whiteColor,
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  automaticallyImplyLeading == false
                      ? SizedBox()
                      : SizedBox(
                          width: 14,
                          child: InkWell(
                            onTap: () {
                              pop();
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: AppColor.textColor,
                              size: 18,
                            ),
                          ),
                        ),
                  lineLight(),
                  Expanded(
                    child: Text(title,
                        style: fontInter(16,
                            fontWeight: FontWeight.w600,
                            color: AppColor.textColor)),
                  ),
                  actions != null
                      ? Stack(
                          alignment: Alignment.center,
                          children: [...actions],
                        )
                      : SizedBox.shrink()
                ],
              ),
            );
        }

        return Container(
            padding:
                const EdgeInsets.only(left: 20, top: 22, right: 15, bottom: 17),
            height: 60,
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                SizedBox(
                  width: 14,
                  child: InkWell(
                    onTap: () {
                      pop();
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: AppColor.textColor,
                      size: 18,
                    ),
                  ),
                ),
                lineLight(),
                Expanded(
                  child: Text(title.toString(),
                      style: fontInter(16,
                          fontWeight: FontWeight.w600,
                          color: AppColor.textColor)),
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
                    child: Text(title ?? "Xem điểm",
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

  Color getColor() {
    switch (type) {
      case AppBarType.info:
        return AppColor.appBarWhiteBackground;
      case AppBarType.navigator:
        return AppColor.appBarDarkBackground;
      case AppBarType.tab:
        return AppColor.appBarWhiteBackground;
      case AppBarType.chat:
        return AppColor.appBarWhiteBackground;
      case AppBarType.notfication:
        return AppColor.appBarWhiteBackground;
      case AppBarType.button:
        return AppColor.appBarDarkBackground;
      case AppBarType.icon:
        return AppColor.appBarWhiteBackground;
      case AppBarType.detail:
        return AppColor.appBarWhiteBackground;
      case AppBarType.white:
        return AppColor.whiteColor;
        break;
    }
    return AppColor.appBarDarkBackground;
  }
}

class _ChatAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      height: 60,
      color: AppColor.whiteColor,
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Expanded(
            child: Text("Chat",
                style: fontInter(16,
                    fontWeight: FontWeight.w600, color: AppColor.textColor)),
          ),
        ],
      ),
    );
  }
}
