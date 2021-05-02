import 'package:flutter/material.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';

import 'item_setting_base_view.dart';

class ItemSettingExpandableView extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool isExpanded;
  const ItemSettingExpandableView(
      {Key key, @required this.title, this.onPressed, this.isExpanded = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ItemSettingBaseView(
      onPressed: onPressed,
      title: title,
      trailingChild: Image.asset(
          isExpanded == true ? Images.dropup : Images.dropdown,
          width: 14,
          height: 14,
          color: AppColor.appBarDarkBackground),
    );
  }
}
