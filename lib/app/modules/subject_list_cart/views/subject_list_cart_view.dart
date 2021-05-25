import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/modules/subject_list_cart/controllers/subject_list_cart_controller.dart';
import 'package:thanglong_university/app/views/views/app_bar_view.dart';
import 'package:thanglong_university/app/views/views/app_widget.dart';
import 'package:thanglong_university/app/views/views/button_view.dart';

class SubjectListCartView extends GetView<SubjectListCartController> {
  @override
  Widget build(BuildContext context) {
    return AppContainer(
      child: Scaffold(
          backgroundColor: AppColor.cf2f2f2,
          body: Column(
            children: [
              AppBarView(
                title: "Danh sách đã chọn",
                type: AppBarType.white,
              ),
              blockView(context),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        children: [
                          Text(
                            "Danh sách môn đăng kí",
                            style: fontInter(14,
                                color: AppColor.cbfbfbf,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    ListView(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      children: List.generate(6, (e) => subjectItem()).toList(),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }

  Container subjectItem() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: AppColor.whiteColor, borderRadius: BorderRadius.circular(3)),
      padding: EdgeInsets.symmetric(horizontal: 16),
      height: 65,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "1.",
            style: fontInter(14,
                color: AppColor.c808080, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Text(
              "Kinh tế phát triển chuyên sâu",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: fontInter(14,
                  color: AppColor.c000333, fontWeight: FontWeight.w600),
            ),
          ),
          item("Thời gian", "T2,1-3"),
          Image.asset(
            Images.plusButtonIcon,
            width: 20,
            height: 20,
          )
        ],
      ),
    );
  }

  Widget item(String title, String subTitle, {bool isLast = false}) {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            width: 1,
            height: 35,
            color: AppColor.lineColor,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: fontInter(11,
                    fontWeight: FontWeight.w500, color: AppColor.c808080),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                subTitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: fontInter(12,
                    fontWeight: FontWeight.w600, color: AppColor.c000333),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            width: 1,
            height: 35,
            color: AppColor.lineColor,
          ),
        ],
      ),
    );
  }

  Container blockView(BuildContext context) {
    return Container(
      height: 70,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(left: 16, right: 16),
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
              title: "List môn",
              horizontalSpacing: 10,
            ),
          )
        ],
      ),
      color: AppColor.c000333,
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
