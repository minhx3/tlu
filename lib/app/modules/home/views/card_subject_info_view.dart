import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';
import 'package:thanglong_university/app/model/register_entity.dart';
import 'package:thanglong_university/app/routes/app_pages.dart';
import 'package:thanglong_university/app/configuration/extension/int.dart';

enum CardSubjectType { pending, inprogress }

class CardSubjectInfoView extends StatelessWidget {
  final CardSubjectType cardSubjectType;
  final RegisterEntity alert;

  CardSubjectInfoView(this.alert,
      {this.cardSubjectType = CardSubjectType.pending});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => pushTo(Routes.RESGISTER_SUBJECT_TERM),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 30),
        decoration: boxShadow.copyWith(
            color: AppColor.whiteColor,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 2),
                blurRadius: 12,
                color: Colors.black.withOpacity(0.05),
              ),
            ],
            borderRadius: BorderRadius.circular(5)),
        padding: EdgeInsets.all(15),
        child: cardSubjectType == CardSubjectType.pending
            ? pendingSubject()
            : progressSubject(),
      ),
    );
  }

  Widget pendingSubject() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "${alert?.semsterInfo?.name ?? ""}",
                    style: fontInter(16,
                        fontWeight: FontWeight.w600,
                        color: cardSubjectType == CardSubjectType.pending
                            ? AppColor.c000333
                            : AppColor.whiteColor),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ).marginOnly(bottom: 2),
                  Text(
                    "Cổng đăng kí học sắp được mở. Hiện đã có thể sắp lịch trước",
                    style: fontInter(12,
                        height: 1.4,
                        fontWeight: FontWeight.w500,
                        color: AppColor.c595C82),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Image.asset(
                  Images.timeClock,
                  width: 17,
                  height: 17,
                  color: AppColor.cfc2626,
                ).marginOnly(bottom: 5),
                Text(
                  "${alert.startTime.dateFormat("hh:mm\ndd/MM/yyyy")}",
                  textAlign: TextAlign.end,
                  style: fontInter(
                    12,
                    fontWeight: FontWeight.w600,
                    color: AppColor.cfc2626,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ).marginOnly(left: 30)
          ],
        ),
        Divider(height: 22, thickness: 1, color: AppColor.ce6e6e6)
            .marginOnly(top: 3),
        Container(
          decoration: BoxDecoration(
              color: AppColor.c000333, borderRadius: BorderRadius.circular(5)),
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
                Images.noteIcon,
                height: 40,
                fit: BoxFit.cover,
              )
            ],
          ),
        )
      ],
    );
  }

  Widget progressSubject() {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: AppColor.cfc2626, borderRadius: BorderRadius.circular(5)),
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 13),
          margin: EdgeInsets.symmetric(horizontal: 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  "${alert?.semsterInfo?.name ?? ""}",
                  style: fontInter(16,
                      fontWeight: FontWeight.w600, color: AppColor.whiteColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Image.asset(
                Images.arrowRight,
                height: 12,
              ).marginOnly(left: 15)
            ],
          ),
        ),
        alert?.getCountDownTime() != null
            ? CountdownTimer(
                endTime: alert.getCountDownTime(),
                widgetBuilder: (_, CurrentRemainingTime time) {
                  final second = (time?.sec ?? 0) < 10
                      ? "0${time?.sec ?? 0}"
                      : "${time?.sec ?? 0}";
                  final minute = (time?.min ?? 0) < 10
                      ? "0${time?.min ?? 0}"
                      : "${time?.min ?? 0}";
                  final hours = (time?.hours ?? 0) < 10
                      ? "0${time?.hours ?? 0}"
                      : "${time?.hours ?? 0}";
                  return Text(
                    "${time?.days != null && time.days > 1 ? "${time.days} ngày " : ""}$hours : $minute : $second",
                    textAlign: TextAlign.center,
                    style: fontInter(28,
                        fontWeight: FontWeight.bold, color: AppColor.c4d4d4d),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  );
                },
              ).marginOnly(top: 8)
            : SizedBox(),
        Divider(
          thickness: 1,
          height: 20,
          color: AppColor.ce6e6e6,
        ),
        Column(
          children: [
            Text(
              "Thời gian đăng ký:",
              style: fontInter(12,
                  fontWeight: FontWeight.w500, color: AppColor.c808080),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "từ ${alert.startTime.dateFormat('HH:mm - dd/MM/yyyy')}\nđến ${alert.endTime.dateFormat('HH:mm - dd/MM/yyyy')}",
              textAlign: TextAlign.center,
              style: fontInter(12,
                  fontWeight: FontWeight.w500, color: AppColor.c4d4d4d),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ],
    );
  }
}
