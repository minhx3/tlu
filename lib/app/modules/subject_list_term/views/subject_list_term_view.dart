import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';
import 'package:thanglong_university/app/modules/subject_list_term/views/subject_filter_view.dart';
import 'package:thanglong_university/app/modules/subject_list_term/views/subject_item_view.dart';
import 'package:thanglong_university/app/modules/transcript/views/transcript_filter_view.dart';
import 'package:thanglong_university/app/routes/app_pages.dart';
import 'package:thanglong_university/app/views/views/app_bar_view.dart';
import 'package:thanglong_university/app/views/views/app_widget.dart';
import 'package:thanglong_university/app/views/views/button_view.dart';

import '../controllers/subject_list_term_controller.dart';

class SubjectListTermView extends GetView<SubjectListTermController> {
  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: Scaffold(
          backgroundColor: AppColor.cf2f2f2,
          body: Column(
            children: [
              AppBarView(
                title: controller.semester?.semsterInfo?.name ?? '',
                type: AppBarType.white,
                iconLeading: Images.iconFilter,
                iconTintColor: AppColor.c808080,
                onAction: () {
                  pushTo(Routes.TRANSCRIPT);
                },
              ),
              Container(
                height: 40,
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Image.asset(
                      Images.icSearch,
                      height: 16,
                      width: 16,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Tìm kiếm",
                          isDense: true,
                          hintStyle: fontInter(12, color: AppColor.cb3b3b3)),
                    ))
                  ],
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppColor.cd9d9d9)),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    Text(
                      "Danh sách lớp học",
                      style: fontInter(14,
                          color: AppColor.cbfbfbf, fontWeight: FontWeight.w600),
                    ),
                    Obx(() => ListView(
                        shrinkWrap: true,
                        padding: EdgeInsets.only(top: 10),
                        physics: NeverScrollableScrollPhysics(),
                        children: controller.registerSubjects
                            .map((element) => SubjectItemView(
                                  subject: element,
                                ))
                            .toList()))
                  ],
                ),
              ),
              Container(
                height: 70 + context.mediaQueryPadding.bottom,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(
                    bottom: context.mediaQueryPadding.bottom,
                    left: 16,
                    right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    blockItem("Số tín chỉ:", "9 tín"),
                    SizedBox(
                      width: 25,
                    ),
                    blockItem("Học phí dự tính:", "3,000,000 VNĐ"),
                    Expanded(
                      child: SizedBox(),
                    ),
                    SizedBox(
                      width: 108,
                      child: ButtonView(
                        verticalSpacing: 0,
                        title: "Danh sách",
                        horizontalSpacing: 10,
                        onTap: () {
                          pushTo(Routes.SUBJECT_LIST_CART);
                        },
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    color: AppColor.c000333,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
              )
            ],
          )),
    );
  }

  Widget blockItem(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: fontInter(11,
              fontWeight: FontWeight.w500, color: AppColor.c808080),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          content,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: fontInter(14,
              fontWeight: FontWeight.w600, color: AppColor.whiteColor),
        ),
      ],
    );
  }
}
