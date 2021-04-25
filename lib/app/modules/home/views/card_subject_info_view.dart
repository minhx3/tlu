import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';

enum CardSubjectType { pending, inprogress }

class CardSubjectInfoView extends GetView {
  final CardSubjectType cardSubjectType;

  CardSubjectInfoView({this.cardSubjectType = CardSubjectType.pending});
  @override
  Widget build(BuildContext context) {
    return cardContentView();
  }

  Container cardContentView() {
    return Container(
      height: 210,
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      decoration: boxShadow.copyWith(
          color: cardSubjectType == CardSubjectType.pending
              ? AppColor.whiteColor
              : Color(0xffF82D2D),
          borderRadius: BorderRadius.circular(5)),
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Đăng kí học kì 135:",
                        style: fontInter(16,
                            fontWeight: FontWeight.w600,
                            color: cardSubjectType == CardSubjectType.pending
                                ? AppColor.textColor
                                : AppColor.whiteColor),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "Thời gian đăng ký: từ 10h00 - 16/01/2021 đến 10h00 - 16/01/2021",
                        style: fontInter(12,
                            fontWeight: FontWeight.w500,
                            color: (cardSubjectType == CardSubjectType.pending
                                    ? AppColor.appBarDarkBackground
                                    : AppColor.whiteColor)
                                .withOpacity(0.5)),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Image.asset(
                  cardSubjectType == CardSubjectType.pending
                      ? Images.noteIcon
                      : Images.noteIconProgress,
                  height: 54,
                ),
              ],
            ),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: cardSubjectType == CardSubjectType.pending
                            ? AppColor.inputBackground
                            : Color(0xffE42B2B)))),
            padding: EdgeInsets.only(bottom: 20),
          ),
          cardSubjectType == CardSubjectType.pending
              ? Row(
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
                          fontWeight: FontWeight.w600,
                          color: AppColor.errorColor),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                )
              : Text(
                  "01 : 23 : 34 : 54",
                  textAlign: TextAlign.center,
                  style: fontInter(28,
                      fontWeight: FontWeight.w600, color: AppColor.whiteColor),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
          Container(
            decoration: BoxDecoration(
                color: cardSubjectType == CardSubjectType.pending
                    ? AppColor.appBarDarkBackground
                    : Color(0xffE42B2B),
                borderRadius: BorderRadius.circular(5)),
            height: 45,
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: cardSubjectType == CardSubjectType.pending
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Xếp danh sách ngay",
                  style: fontInter(14,
                      fontWeight: FontWeight.w600, color: AppColor.whiteColor),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                cardSubjectType == CardSubjectType.pending
                    ? Expanded(
                        child: SizedBox(),
                      )
                    : SizedBox(
                        width: 5,
                      ),
                Image.asset(
                  Images.arrowRight,
                  height: 14,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
