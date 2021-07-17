import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/model/chat/user_entity.dart';
import 'package:thanglong_university/app/modules/profile/controllers/profile_controller.dart';
import 'package:thanglong_university/app/modules/user_info/views/partial/avatar_user_name_view.dart';
import 'package:thanglong_university/app/modules/user_info/views/partial/item_info_view.dart';

class HeaderInfoTeacherView extends StatelessWidget {
  final bool isAllowEdit;
  final UserEntity user;

  const HeaderInfoTeacherView({Key key, this.isAllowEdit = false, this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.whiteColor,
      padding: const EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          AvatarUserNameView(
            isAllowEdit: isAllowEdit,
            user: user,
          ),
          ItemInfoView(
            label: 'Số điện thoại:',
            value: "${user?.mobile ?? ""}",
          ),
          ItemInfoView(
            label: 'Email:',
            value: "${user?.email ?? ""}",
          ),
          ItemInfoView(
            label: 'Khoa ngành:',
            value: user?.faculty ?? '',
          ),
          ItemInfoView(
            label: 'Môn học giảng dạy:',
            value: user?.getTeaching ?? '',
          ),
        ],
      ),
    );
  }
}
