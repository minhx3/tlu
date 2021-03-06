import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/style.dart';
import 'package:get/get.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/configuration/constant/view_state.dart';
import 'package:thanglong_university/app/modules/detail_new/controllers/detail_new_controller.dart';
import 'package:thanglong_university/app/views/views/app_bar_view.dart';
import 'package:thanglong_university/app/views/views/app_widget.dart';
import 'package:thanglong_university/app/configuration/extension/datetime.dart';

import 'package:flutter_html/flutter_html.dart';

class DetailNewView extends GetView<DetailNewController> {
  @override
  Widget build(BuildContext context) {
    return AppContainer(
      systemUiOverlayStyle: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Column(
          children: [
            AppBarView(
              type: AppBarType.dark,
              title: "Tin tức - sự kiện",
            ),
            Expanded(
              child: Obx(
                () => controller.rxViewState() == ViewState.loading
                    ? Center(child: CircularProgressIndicator()).marginAll(30)
                    : ListView(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 12),
                        children: [
                            Text(
                              controller.rxNews().title,
                              style: fontInter(24, fontWeight: FontWeight.bold),
                            )
                                .paddingSymmetric(horizontal: 8)
                                .marginOnly(bottom: 15),
                            IntrinsicHeight(
                              child: Row(
                                children: [
                                  Text(
                                    controller.rxNews().type,
                                    style: fontInter(12,
                                        fontWeight: FontWeight.w600,
                                        color: AppColor.errorColor),
                                  ),
                                  VerticalDivider(
                                    width: 20,
                                    thickness: 1,
                                    color: AppColor.cb3b4c2,
                                  ),
                                  Text(
                                    controller.rxNews().createdAt.format(),
                                    style: fontInter(12,
                                        fontWeight: FontWeight.w600,
                                        color: AppColor.cb3b4c2),
                                  ),
                                ],
                              )
                                  .paddingSymmetric(horizontal: 8)
                                  .marginOnly(bottom: 10),
                            ),
                            Html(
                              data: controller.rxNews().htmlContent,
                              style: {
                                "html": Style(
                                    fontFamily: "Inter",
                                    lineHeight: 1.5,
                                    fontSize: FontSize(16)),
                                "p": Style(lineHeight: 1.5),
                                "h4": Style(
                                    fontSize: FontSize(16), lineHeight: 1.5),
                                "strong": Style(
                                  fontSize: FontSize(16),
                                  lineHeight: 1.5,
                                ),
                                "caption": Style(
                                    fontSize: FontSize(12),
                                    color: AppColor.c666666,
                                    fontStyle: FontStyle.italic),
                              },
                              customRender: {
                                // "p": (RenderContext context, Widget child,
                                //     attributes, _) {
                                //   return SelectableText(child.toString());
                                // },
                              },
                            ),
                          ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
