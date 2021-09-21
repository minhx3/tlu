import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';
import 'package:thanglong_university/app/enums/subject_group_status_enum.dart';
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
                    "Danh sách đăng kí",
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
        ),
        // bottomNavigationBar: getBottomBar(),
      ),
    );
  }

  Widget viewItem(RegisterEntity item) {
    Color textColor1 = AppColor.c000333;
    Color textColor2 = AppColor.c808080;
    Color textColor3 = AppColor.c4d4d4d;
    Color backgroundColor = Colors.white;
    Color borderColor = AppColor.cd9d9d9;
    if (item.status == SujectGroupStatusEnum.OPEN ||
        item.status == SujectGroupStatusEnum.RE_OPEN) {
      textColor1 = textColor2 = textColor3 = Colors.white;
      backgroundColor = AppColor.cfc2626;
      Color borderColor = AppColor.cfc7171;
    }
    return InkWell(
      onTap: () {
        pushTo(Routes.SUBJECT_LIST_TERM, arguments: item);
      },
      splashFactory: InkRipple.splashFactory,
      splashColor: AppColor.cfc2626,
      child: Container(
        decoration: boxShadow.copyWith(
            borderRadius: BorderRadius.circular(3), color: backgroundColor),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(bottom: 6),
              margin: EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      item?.semsterInfo?.name ?? '',
                      style: fontInter(16,
                          color: textColor1, fontWeight: FontWeight.w600),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(child: statusWidget(item.status))
                      .paddingOnly(left: 8)
                      .marginOnly(bottom: 5),
                ],
              ),
              decoration: BoxDecoration(
                  border:
                      Border(bottom: BorderSide(width: 1, color: borderColor))),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Thời gian đăng kí:",
                  style: fontInter(11,
                      color: textColor2, fontWeight: FontWeight.w500),
                ).marginOnly(bottom: 2),
                Text(
                  item.getRegisterTime,
                  style: fontInter(14,
                      color: textColor3, fontWeight: FontWeight.w600),
                ),
              ],
            ).marginOnly(bottom: 10),
          ],
        ),
      ),
    ).marginOnly(top: 10);
  }

  Widget statusWidget(SujectGroupStatusEnum status) {
    Color color;
    switch (status) {
      case SujectGroupStatusEnum.CLOSE:
        color = AppColor.cb3b4c2;
        break;
      case SujectGroupStatusEnum.PENDING:
        color = AppColor.c000333;
        break;
      default:
        color = AppColor.cfc7171;
        break;
    }
    return Container(
        height: 26,
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        child: Text(subjectGroupStatusSwitch.reverse[status],
            style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3), color: color));
  }
}
