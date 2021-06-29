import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/modules/profile/controllers/profile_controller.dart';
import 'package:thanglong_university/app/modules/user_info/views/partial/avatar_user_name_view.dart';
import 'package:thanglong_university/app/modules/user_info/views/partial/item_info_view.dart';
import 'package:thanglong_university/app/modules/user_info/views/partial/label_value_info_view.dart';

class HeaderInfoStudentView extends StatelessWidget {
  final bool isAllowEdit;

  const HeaderInfoStudentView({Key key, this.isAllowEdit = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.whiteColor,
      padding: const EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AvatarUserNameView(isAllowEdit: isAllowEdit),
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
    return Obx(() => Column(
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
                  value:
                      "${ProfileController.to.rxUserInfo()?.classInfo?.classInfoId ?? ""}",
                  isHozSeparated: true,
                ),
                LabelValueInfoView(
                  label: 'Số điện thoại:',
                  value: "${ProfileController.to.rxUserInfo()?.mobile ?? ""}",
                  isHozSeparated: true,
                ),
                LabelValueInfoView(
                  label: 'Ngày sinh',
                  value: "${ProfileController.to.rxUserInfo()?.dob ?? ""}",
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
        ));
  }
}

class _EmailInfoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ItemInfoView(
      label: 'Email:',
      value: "${ProfileController.to.rxUserInfo()?.email ?? ""}",
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
              value:
                  "${ProfileController.to.rxUserInfo()?.classInfo?.classInfoId ?? ""}",
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
