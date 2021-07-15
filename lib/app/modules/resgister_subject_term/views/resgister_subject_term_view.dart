import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';
import 'package:thanglong_university/app/model/register_entity.dart';
import 'package:thanglong_university/app/routes/app_pages.dart';
import 'package:thanglong_university/app/views/views/app_bar_view.dart';
import 'package:thanglong_university/app/views/views/app_widget.dart';

import '../controllers/resgister_subject_term_controller.dart';

class ResgisterSubjectTermView extends GetView<ResgisterSubjectTermController> {
  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: Scaffold(
          backgroundColor: AppColor.whiteColor,
          body: Column(
            children: [
              AppBarView(
                title: "Đăng ký học",
                type: AppBarType.white,
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.all(16),
                  children: [
                    Text(
                      "Danh sách lớp học",
                      style: fontInter(14,
                          color: AppColor.cbfbfbf, fontWeight: FontWeight.w600),
                    ),
                    Obx(() => ListView(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: NeverScrollableScrollPhysics(),
                          children: controller
                              .subjects()
                              .map((element) => viewItem(element))
                              .toList(),
                        ))
                  ],
                ),
              )
            ],
          )),
    );
  }

  Widget viewItem(RegisterEntity item) {
    return InkWell(
      onTap: () {
        pushTo(Routes.SUBJECT_LIST_TERM, arguments: item);
      },
      splashFactory: InkRipple.splashFactory,
      splashColor: AppColor.cfc2626,
      child: Container(
        // foregroundDecoration: BoxDecoration(col),
        decoration: boxShadow.copyWith(
            borderRadius: BorderRadius.circular(3), color: Colors.white),
        padding: EdgeInsets.symmetric(horizontal: 16),
        // height: 108,
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              height: 44,
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                item?.semsterInfo?.name ?? '',
                style: fontInter(16,
                    color: AppColor.c000333, fontWeight: FontWeight.w600),
              ),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 0.5, color: AppColor.cd9d9d9))),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Thời gian đăng kí:",
                  style: fontInter(11,
                      color: AppColor.c808080, fontWeight: FontWeight.w500),
                ).marginOnly(bottom: 2),
                Text(
                  item.getRegisterTime,
                  style: fontInter(14,
                      color: AppColor.c4d4d4d, fontWeight: FontWeight.w600),
                ).marginOnly(bottom: 22),
              ],
            ),
          ],
        ),
      ),
    ).marginOnly(top: 10);
  }
}
