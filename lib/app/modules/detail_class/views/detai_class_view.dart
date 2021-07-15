import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/modules/task/views/teacher_item_view.dart';
import 'package:thanglong_university/app/views/views/app_bar_view.dart';
import 'package:thanglong_university/app/views/views/app_widget.dart';

import '../controllers/detai_class_controller.dart';

class DetaiClassView extends GetView<DetaiClassController> {
  @override
  Widget build(BuildContext context) {
    return AppContainer(
      systemUiOverlayStyle: SystemUiOverlayStyle.light,
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        body: Column(
          children: [
            AppBarView(
              title: "Chi tiết lớp",
              type: AppBarType.white,
              iconLeading: Images.plus,
              iconTintColor: AppColor.primaryColor,
              onAction: () {},
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(16),
                children: [
                  Text(
                    "Kinh tế học về những vấn đề xã hội",
                    style: fontInter(24,
                        fontWeight: FontWeight.w700, color: AppColor.c000333),
                  ),
                  boardTimeLine(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      item("Mã môn:", "PG122"),
                      item("Thời gian:", "T2,T3"),
                      item("Thời gian:", "B503"),
                      item("Số tiết lý thuyết", "45/45 tiết", isLast: true),
                    ],
                  ),
                  lineWidget(),
                  item("Mã lớp:", "KTHVNVDXAHOI1.1", isLast: true),
                  lineWidget(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      item("Hệ số:", "1.2"),
                      item("Số tín chỉ:", "3 tín"),
                      item("Học phí:", "1.2000.000 VNĐ", isLast: true),
                    ],
                  ),
                  lineWidget(),
                  item("Điều kiện thi:", "Không nghỉ quá 3 buổi", isLast: true),
                  lineWidget(),
                  item(
                      "Cách tính điểm:", "Điểm quá trình x 30%, điểm thi x 70%",
                      isLast: true),
                  lineWidget(),
                  item("Học phí:", "1.2000.000 VNĐ", isLast: true),
                  lineWidget(),
                  TeacherItemView(),
                  TeacherItemView(),
                  documentWidget(),
                  documentWidget(),
                  lineWidget(),
                  descriptionWidget()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Column descriptionWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 10),
              child: Text(
                "Tài liệu cần thiết",
                style: fontInter(14,
                    fontWeight: FontWeight.w600, color: AppColor.c4d4d4d),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              child: SizedBox(),
            ),
            Image.asset(
              Images.dropdown,
              height: 9,
            )
          ],
        ),
        SizedBox(
          height: 2,
        ),
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: AppColor.cfafafa, borderRadius: BorderRadius.circular(3)),
          child: Expanded(
            child: Text(
              "Học phần cung cấp những kiến thức thuộc phạm vi tài chính quốc tế, cả ở góc độ vi mô và vĩ mô.\n\nỞ góc độ vi mô, nội dung chính của học phần tập trung vào tác động của tỷ giá hối đoái lên hoạt động của các công ty và các chiến lược phòng ngừa rủi ro tỷ giá hối đoái cũng như quản trị vốn luân chuyển, đầu tư quốc tế của công ty đa quốc gia.\n\nBên cạnh đó, học phần cũng cung cấp những tình huống cụ thể trong thực tế nhằm trang bị cho sinh viên kỹ năng tư duy, phân tích và giải quyết các vấn đề thực tiễn trong quản trị tài chính quốc tế của công ty. ",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: fontInter(12,
                  fontWeight: FontWeight.w400, color: AppColor.black),
            ),
          ),
        ),
      ],
    );
  }

  Column documentWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 10),
          child: Text(
            "Tài liệu cần thiết",
            style: fontInter(14,
                fontWeight: FontWeight.w600, color: AppColor.c4d4d4d),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(
          height: 2,
        ),
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: AppColor.cfafafa, borderRadius: BorderRadius.circular(3)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Giáo trình Tài chính quốc tế",
                style: fontInter(14,
                    fontWeight: FontWeight.w600, color: AppColor.black),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                "GS.TS. Vũ Văn Hóa, PGS.TS. Lê Văn Hưng",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: fontInter(11,
                    fontWeight: FontWeight.w500, color: AppColor.c808080),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column boardTimeLine() {
    return Column(
      children: [
        Container(
          color: AppColor.cfafafa,
          alignment: Alignment.center,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: controller.columnList
                .map(
                  (e) => Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          height: 30,
                          child: Text(
                            e,
                            style: fontInter(11,
                                color: AppColor.c808080,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                              controller.data[controller.columnList.indexOf(e)]
                                  .map(
                                    (i) => Container(
                                        alignment: Alignment.centerLeft,
                                        height: 30,
                                        child: Text(
                                          i,
                                          style: fontInter(12,
                                              color: controller.columnList
                                                          .indexOf(e) ==
                                                      0
                                                  ? AppColor.c000333
                                                      .withOpacity(0.3)
                                                  : AppColor.c4d4d4d,
                                              fontWeight: FontWeight.w600),
                                        )),
                                  )
                                  .toList(),
                        )
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        lineWidget(),
      ],
    );
  }

  Container lineWidget() {
    return Container(
      margin: EdgeInsets.only(top: 12),
      height: 1,
      color: AppColor.cd9d9d9,
    );
  }

  Widget item(String title, String subTitle, {bool isLast = false}) {
    return Container(
      padding: EdgeInsets.only(top: 16),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: fontInter(11,
                    fontWeight: FontWeight.w500, color: AppColor.c808080),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 2,
              ),
              Text(
                subTitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: fontInter(14,
                    fontWeight: FontWeight.w600, color: AppColor.c000333),
              ),
            ],
          ),
          isLast == true
              ? SizedBox()
              : Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  width: 1,
                  height: 35,
                  color: AppColor.cd9d9d9,
                ),
        ],
      ),
    );
  }
}
