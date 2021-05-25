import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';
import 'package:thanglong_university/app/routes/app_pages.dart';

enum CardSubjectType { pending, inprogress }

class CardSubjectInfoView extends GetView {
  final CardSubjectType cardSubjectType;

  CardSubjectInfoView({this.cardSubjectType = CardSubjectType.pending});
  @override
  Widget build(BuildContext context) {
    return cardContentView();
  }

  Widget cardContentView() {
    return InkWell(
      onTap: () {
        if (cardSubjectType == CardSubjectType.pending) {
          pushTo(Routes.RESGISTER_SUBJECT_TERM);
        } else {
          pushTo(Routes.RESGISTER_SUBJECT_TERM);
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
        decoration: cardSubjectType == CardSubjectType.pending
            ? null
            : boxShadow.copyWith(
                color: cardSubjectType == CardSubjectType.pending
                    ? Colors.transparent
                    : AppColor.whiteColor,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 6,
                    spreadRadius: 2,
                    color: Colors.black.withOpacity(0.05),
                  ),
                ],
                borderRadius: BorderRadius.circular(5)),
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: cardSubjectType == CardSubjectType.pending
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                "Đăng kí học kì 135:",
                                style: fontInter(16,
                                    fontWeight: FontWeight.w600,
                                    color: cardSubjectType ==
                                            CardSubjectType.pending
                                        ? AppColor.c000333
                                        : AppColor.whiteColor),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "Cổng đăng kí học sắp được mở. Hiện đã có thể sắp lịch trước",
                                style: fontInter(12,
                                    fontWeight: FontWeight.w500,
                                    color: (cardSubjectType ==
                                                CardSubjectType.pending
                                            ? AppColor.c000333.withOpacity(0.5)
                                            : AppColor.whiteColor)
                                        .withOpacity(0.5)),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              Images.timeClock,
                              height: 17,
                              color: AppColor.cfc2626,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "10h00\n16/01/2021",
                              style: fontInter(
                                12,
                                fontWeight: FontWeight.w600,
                                color: AppColor.cfc2626,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        )
                      ],
                    )
                  : Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: AppColor.c000333,
                              borderRadius: BorderRadius.circular(5)),
                          height: 53,
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Đăng ký học kì 135",
                                style: fontInter(16,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.whiteColor),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Image.asset(
                                Images.arrowRight,
                                height: 14,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "01 : 23 : 34 : 54",
                          textAlign: TextAlign.center,
                          style: fontInter(28,
                              fontWeight: FontWeight.w700,
                              color: AppColor.c404040),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: AppColor.ce6e6e6))),
              padding: EdgeInsets.only(bottom: 15),
            ),
            cardSubjectType == CardSubjectType.pending
                ? Container(
                    decoration: BoxDecoration(
                        color: AppColor.c000333,
                        borderRadius: BorderRadius.circular(5)),
                    height: 45,
                    margin: EdgeInsets.only(top: 11),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment:
                          cardSubjectType == CardSubjectType.pending
                              ? MainAxisAlignment.start
                              : MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Xếp danh sách ngay",
                          style: fontInter(14,
                              fontWeight: FontWeight.w600,
                              color: AppColor.whiteColor),
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
                          Images.noteIcon,
                          height: 40,
                          fit: BoxFit.cover,
                        )
                      ],
                    ),
                  )
                : Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Thời gian đăng ký:",
                        style: fontInter(12,
                            fontWeight: FontWeight.w500,
                            color: AppColor.c808080),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "từ 10h00 - 16/01/2021\nđến 10h00 - 16/01/2021",
                        textAlign: TextAlign.center,
                        style: fontInter(12,
                            fontWeight: FontWeight.w500,
                            color: AppColor.c4d4d4d),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}
