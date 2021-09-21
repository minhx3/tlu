import 'package:flutter/material.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';
import 'package:thanglong_university/app/model/chat/base_model.dart';
import 'package:thanglong_university/app/modules/user_info/views/partial/avatar_user_name_view.dart';
import 'package:thanglong_university/app/modules/user_info/views/partial/item_info_view.dart';
import 'package:thanglong_university/app/modules/user_info/views/partial/label_value_info_view.dart';
import 'package:thanglong_university/app/configuration/extension/string.dart';

class HeaderInfoStudentView extends StatelessWidget {
  final bool isAllowEdit;
  final UserModel user;

  const HeaderInfoStudentView({Key key, this.isAllowEdit = false, this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 12),
      decoration: boxShadow,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AvatarUserNameView(isAllowEdit: isAllowEdit, user: user),
          _CommonInfoView(
            user: user,
          ),
          _EmailInfoView(
            email: user?.email,
          ),
          _BranchView(user: user)
        ],
      ),
    );
  }
}

class _CommonInfoView extends StatelessWidget {
  final UserModel user;

  const _CommonInfoView({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 26,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              LabelValueInfoView(
                label: 'Khoá:',
                value: "${user?.schoolYear ?? ""}",
                isHozSeparated: true,
              ),
              LabelValueInfoView(
                label: 'Số điện thoại:',
                value: "${user?.mobile ?? ""}",
                isHozSeparated: true,
              ),
              LabelValueInfoView(
                label: 'Ngày sinh',
                value: "${user?.dob?.dateFormat() ?? ""}",
              ),
            ],
          ),
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
  final String email;

  const _EmailInfoView({Key key, this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ItemInfoView(
      label: 'Email:',
      value: email ?? '',
    );
  }
}

class _BranchView extends StatelessWidget {
  final UserModel user;

  const _BranchView({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            children: [
              LabelValueInfoView(
                label: 'Khoa ngành:',
                value: user?.faculty ?? user?.majors ?? '',
                isHozSeparated: true,
              ),
              SizedBox(
                width: 12,
              ),
              LabelValueInfoView(
                label: 'Lớp:',
                value: user?.className ?? '',
              ),
            ],
          ),
        ),
        SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
