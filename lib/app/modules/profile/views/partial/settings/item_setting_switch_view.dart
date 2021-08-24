import 'package:flutter/material.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/modules/profile/views/partial/settings/item_setting_base_view.dart';

class ItemSettingsSwitchView extends StatelessWidget {
  final String title;
  final bool isChecked;
  final Function onChanged;
  final double fontSizeTitle;
  final Color colorTitle;

  const ItemSettingsSwitchView(
      {Key key,
      @required this.title,
      this.isChecked = false,
      this.onChanged,
      this.fontSizeTitle,
      this.colorTitle})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ItemSettingBaseView(
      onPressed: () => onChanged(!isChecked),
      title: title,
      colorTitle: colorTitle,
      fontSizeTitle: fontSizeTitle,
      trailingChild: MediaQuery.removePadding(
          context: context,
          child: Switch(
            activeTrackColor: AppColor.cd9d9d9,
            inactiveTrackColor: AppColor.cd9d9d9,
            inactiveThumbColor: AppColor.c8c8c8c,
            value: isChecked,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onChanged: (value) => onChanged(value),
            activeColor: AppColor.primaryColor,
          )),
    );
  }
}
