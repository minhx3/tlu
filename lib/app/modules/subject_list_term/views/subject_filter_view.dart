import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/constant.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/modules/subject_list_term/controllers/subject_list_term_controller.dart';
import 'package:thanglong_university/app/views/views/button_view.dart';
import 'package:thanglong_university/app/views/views/link_view.dart';

class SubjectFilterView extends GetView<SubjectListTermController> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: null,
      //elevation: 5,
      style: TextStyle(color: Colors.black),
      dropdownColor: Colors.red,
      underline: SizedBox(),

      items: <String>[
        'Android',
        'IOS',
        'Flutter',
        'Node',
        'Java',
        'Python',
        'PHP',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      hint: Text(
        "Khối học phần",
        style: TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600),
      ),
      onChanged: (String value) {},
    );
  }

  Widget blockFilter() {
    return Container(
      color: AppColor.appBarDarkBackground,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DropdownButton<String>(
            value: '_chosenValue',
            //elevation: 5,
            style: TextStyle(color: Colors.black),

            items: <String>[
              'Android',
              'IOS',
              'Flutter',
              'Node',
              'Java',
              'Python',
              'PHP',
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            hint: Text(
              "Please choose a langauage",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
            ),
            onChanged: (String value) {
              // setState(() {
              //   _chosenValue = value;
              // });
            },
          ),
          dropdown("Khối học phần", isExpanded: true),
          SizedBox(
            height: 40,
            child: Row(
              children: [
                Expanded(
                    child: dropdown(
                  "Số tín chỉ",
                )),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: dropdown(
                  "Điểm",
                )),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: SizedBox(),
              ),
              Container(
                  alignment: Alignment.center,
                  width: 100,
                  height: 40,
                  child: LinkView(
                    "Huỷ lọc",
                    textColor: AppColor.whiteColor,
                    textDecoration: TextDecoration.none,
                  )),
              SizedBox(
                width: 100,
                height: 40,
                child: ButtonView(
                  title: "Lọc",
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Container dropdown(String title, {double top = 10, bool isExpanded = true}) {
    return Container(
      padding: EdgeInsets.only(top: top),
      child: Column(
        children: [
          blockSubject(),
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: fontInter(14,
                      color: AppColor.whiteColor, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Image.asset(
                  Images.dropdown,
                  height: 8,
                ),
              )
            ],
          ),
          isExpanded == true ? blockSubject() : SizedBox(height: 50),
        ],
      ),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: AppColor.whiteColor.withOpacity(0.3), width: 1.5))),
    );
  }

  Container blockSubject() {
    return Container(
        width: Get.width,
        child: Stack(
          children: [
            Wrap(
              children: List.generate(4, (index) {
                return itemSelectBox(index);
              }),
            ),
            Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 40, left: 10, right: 10),
                height: 1,
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          color: AppColor.whiteColor.withOpacity(0.3),
                          width: 1)),
                )),
          ],
        ));
  }

  Container itemSelectBox(
    int index,
  ) {
    return Container(
      height: 30,
      padding: EdgeInsets.only(
        left: index % 2 == 0 ? 0 : 16,
      ),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: index % 2 != 0
          ? BoxDecoration(
              border: Border(
                  left: BorderSide(
                      color: AppColor.whiteColor.withOpacity(0.3), width: 1)))
          : null,
      width: (Constant.designWidth - 72) / 2,
      child: Row(
        children: [
          Expanded(
            child: Text(
              "Khối học phần",
              style: fontInter(12,
                  color: AppColor.whiteColor.withOpacity(.5),
                  fontWeight: FontWeight.w500),
            ),
          ),
          Image.asset(
            Images.tick,
            height: 18,
            width: 18,
          )
        ],
      ),
    );
  }
}
