import 'package:flutter/material.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/modules/user_info/views/partial/header_info_teacher_view.dart';

class InfoTeacherView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 12, bottom: 20),
      color: AppColor.whiteColor,
      child: ListView(
        children: [
          HeaderInfoTeacherView(),
          SizedBox(
            height: 20,
          ),
          _ConnectTeacherView()
        ],
      ),
    );
  }
}

class _ConnectTeacherView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: [
        Expanded(
            child: FlatButton(
          height: 50,
          onPressed: () {},
          color: AppColor.whiteColor,
          shape: OutlineInputBorder(),
          child: Text(
            'Đặt câu hỏi',
            style: fontInter(14,
                color: AppColor.textColor, fontWeight: FontWeight.w600),
          ),
        )),
        SizedBox(
          width: 20,
        ),
        Expanded(
            child: FlatButton(
          height: 50,
          onPressed: () {},
          color: AppColor.textColor,
          shape: OutlineInputBorder(),
          child: Text(
            'Chat với giáo viên',
            style: fontInter(14,
                color: AppColor.whiteColor, fontWeight: FontWeight.w600),
          ),
        ))
      ]),
    );
  }
}
