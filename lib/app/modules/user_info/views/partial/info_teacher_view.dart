import 'package:flutter/material.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/modules/user_info/views/partial/avatar_user_name_view.dart';
import 'package:thanglong_university/app/modules/user_info/views/partial/label_value_info_view.dart';

class InfoTeacherView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      color: AppColor.whiteColor,
      child: ListView(
        children: [
          AvatarUserNameView(),
          _ItemInfoView(
            label: 'Số điện thoại:',
            value: '0342299014',
          ),
          _ItemInfoView(
            label: 'Email:',
            value: 'tsphanhuyphu@tlu.edu.vn',
          ),
          _ItemInfoView(
            label: 'Khoa ngành:',
            value: 'Quản trị dịch vụ Du lịch - Lữ Hành',
          ),
          _ItemInfoView(
            label: 'Môn học giảng dạy:',
            value: 'Thương mại quốc tế, Tài chính quốc tế',
          ),
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
    return Row(children: [
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
    ]);
  }
}

class _ItemInfoView extends StatelessWidget {
  final String label;
  final String value;

  const _ItemInfoView({Key key, @required this.label, @required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 12,
        ),
        LabelValueInfoView(
          label: label ?? '',
          value: value ?? '',
        ),
        SizedBox(
          height: 12,
        ),
        Divider(
          height: 1,
          color: AppColor.lineSectionColor,
        ),
      ],
    );
  }
}
