import 'package:flutter/material.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';

import 'item_setting_base_view.dart';

class ItemSettingExpandableView extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool isExpanded;
  final double trailingWidth;
  final double trailingHeight;
  final double fontSizeTitle;
  final Color trailingColor;
  final Color colorTitle;
  const ItemSettingExpandableView(
      {Key key,
      @required this.title,
      this.onPressed,
      this.isExpanded = false,
      this.trailingWidth,
      this.trailingHeight,
      this.trailingColor,
      this.colorTitle,
      this.fontSizeTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ItemSettingBaseView(
      fontSizeTitle: fontSizeTitle,
      colorTitle: colorTitle,
      onPressed: onPressed,
      title: title,
      trailingChild: Image.asset(
          isExpanded == true ? Images.dropup : Images.dropdown,
          width: trailingWidth ?? 14,
          height: trailingHeight ?? 14,
          color: trailingColor ?? AppColor.appBarDarkBackground),
    );
  }
}
