import 'package:flutter/material.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/modules/profile/views/partial/settings/item_setting_base_view.dart';

class ItemSettingsSwitchView extends StatelessWidget {
  final String title;
  final bool isChecked;
  final VoidCallback onPressed;

  const ItemSettingsSwitchView(
      {Key key, @required this.title, this.isChecked = false, this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ItemSettingBaseView(
      onPressed: onPressed,
      title: title,
      trailingChild: MediaQuery.removePadding(
          context: context,
          child: Switch(
            value: isChecked,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onChanged: (value) {},
            activeColor: AppColor.primaryColor,
          )),
    );
  }
}
