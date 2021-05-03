import 'package:flutter/material.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/modules/user_info/views/partial/avatar_user_name_view.dart';
import 'package:thanglong_university/app/modules/user_info/views/partial/item_info_view.dart';
import 'package:thanglong_university/app/modules/user_info/views/partial/label_value_info_view.dart';

class HeaderInfoStudentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.whiteColor,
      padding: const EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AvatarUserNameView(),
          _CommonInfoView(),
          _EmailInfoView(),
          _BranchView()
        ],
      ),
    );
  }
}

class _CommonInfoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 26,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            LabelValueInfoView(
              label: 'Khoá:',
              value: 'QH-E-2018',
              isHozSeparated: true,
            ),
            LabelValueInfoView(
              label: 'Số điện thoại:',
              value: '0342299014',
              isHozSeparated: true,
            ),
            LabelValueInfoView(
              label: 'Ngày sinh',
              value: '25/04/2000',
            ),
          ],
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

class _EmailInfoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ItemInfoView(
      label: 'Email:',
      value: 'ngotienpro123@gmail.com',
    );
  }
}

class _BranchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 12,
        ),
        Row(
          children: [
            LabelValueInfoView(
              label: 'Khoa ngành:',
              value: 'Quản trị dịch vụ Du lịch - Lữ Hành',
              isHozSeparated: true,
            ),
            SizedBox(
              width: 12,
            ),
            LabelValueInfoView(
              label: 'Lớp:',
              value: 'CLC 2',
            ),
          ],
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
