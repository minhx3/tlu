import 'package:flutter/material.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:get/get.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';
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
      this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60 + context.mediaQueryPadding.top,
      padding: EdgeInsets.only(top: context.mediaQueryPadding.top),
      decoration: boxShadow.copyWith(
        color: backgroundColor ?? getColor(),
      ),
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
            // TODO: Handle this case.
            return Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 60,
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    automaticallyImplyLeading == false
                        ? SizedBox()
                        : InkWell(
                            onTap: () {
                              pop();
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: AppColor.textColor,
                            ),
                          ),
                    Expanded(
                      child: Text(title,
                          style: fontInter(16,
                              fontWeight: FontWeight.w600,
                              color: AppColor.textColor)),
                    ),
                    // SizedBox(
                    //   height: 35,
                    //   child: Row(
                    //     children: [
                    //       Container(
                    //         height: 33,
                    //         padding: EdgeInsets.symmetric(horizontal: 8),
                    //         decoration: BoxDecoration(
                    //             color: AppColor.tabUnSelectedColor,
                    //             borderRadius: BorderRadius.circular(3)),
                    //         alignment: Alignment.center,
                    //         child: Text("Ngành 1",
                    //             style: fontInter(12,
                    //                 fontWeight: FontWeight.w600,
                    //                 color: AppColor.subTextColor)),
                    //       ),
                    //       Container(
                    //         alignment: Alignment.center,
                    //         decoration: BoxDecoration(
                    //             color: AppColor.errorColor,
                    //             borderRadius: BorderRadius.circular(3)),
                    //         padding: EdgeInsets.symmetric(horizontal: 8),
                    //         height: 35,
                    //         child: Text("Ngành 2",
                    //             style: fontInter(12,
                    //                 fontWeight: FontWeight.w600,
                    //                 color: AppColor.whiteColor)),
                    //       )
                    //     ],
                    //   ),
                    // )
                  ],
                ));
            break;
          case AppBarType.chat:
            return _ChatAppBar();
          case AppBarType.navigator:
            return Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 60,
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        onBack != null ? onBack() : pop();
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: AppColor.whiteColor,
                      ),
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
                    InkWell(
                      onTap: () {
                        pop();
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: AppColor.textColor,
                      ),
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
          case AppBarType.white:
            return Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 60,
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        pop();
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: AppColor.textColor,
                      ),
                    ),
                    Expanded(
                      child: Text(title,
                          style: fontInter(16,
                              fontWeight: FontWeight.w600,
                              color: AppColor.textColor)),
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
                              onAction();
                            },
                          )
                        : SizedBox(),
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
                    automaticallyImplyLeading == true
                        ? InkWell(
                            child: Icon(Icons.arrow_back_ios,
                                color: iconTintColor ?? AppColor.whiteColor),
                            onTap: () {
                              pop();
                            },
                          )
                        : SizedBox(),
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
                              pushTo(Routes.NOTIFICATION);
                            },
                          )
                        : SizedBox(),
                  ],
                ));
          case AppBarType.icon:
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              height: 60,
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  InkWell(
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: AppColor.textColor,
                    ),
                    onTap: () {
                      pop();
                    },
                  ),
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
              padding: EdgeInsets.symmetric(horizontal: 15),
              height: 60,
              color: AppColor.whiteColor,
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  automaticallyImplyLeading == false
                      ? SizedBox()
                      : InkWell(
                          onTap: () {
                            pop();
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: AppColor.textColor,
                          ),
                        ),
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

  Color getColor() {
    switch (type) {
      case AppBarType.info:
        // TODO: Handle this case.
        return AppColor.appBarWhiteBackground;
      case AppBarType.navigator:
        // TODO: Handle this case.
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
          // Stack(
          //   alignment: Alignment.center,
          //   children: [
          //     IconButton(
          //       icon: Image.asset(
          //         Images.icEdit,
          //         width: 20,
          //         height: 20,
          //       ),
          //       onPressed: () {},
          //     ),
          //   ],
          // )
        ],
      ),
    );
  }
}
