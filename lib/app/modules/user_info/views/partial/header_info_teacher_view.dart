import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/modules/profile/controllers/profile_controller.dart';
import 'package:thanglong_university/app/modules/user_info/views/partial/avatar_user_name_view.dart';
import 'package:thanglong_university/app/modules/user_info/views/partial/item_info_view.dart';

class HeaderInfoTeacherView extends StatelessWidget {
  final bool isAllowEdit;

  const HeaderInfoTeacherView({Key key, this.isAllowEdit = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          color: AppColor.whiteColor,
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              AvatarUserNameView(isAllowEdit: isAllowEdit),
              ItemInfoView(
                label: 'Số điện thoại:',
                value: "${ProfileController.to.rxUserInfo()?.mobile ?? ""}",
              ),
              ItemInfoView(
                label: 'Email:',
                value: "${ProfileController.to.rxUserInfo()?.email ?? ""}",
              ),
              ItemInfoView(
                label: 'Khoa ngành:',
                value: 'Quản trị dịch vụ Du lịch - Lữ Hành',
              ),
              ItemInfoView(
                label: 'Môn học giảng dạy:',
                value: 'Thương mại quốc tế, Tài chính quốc tế',
              ),
            ],
          ),
        ));
  }
}
