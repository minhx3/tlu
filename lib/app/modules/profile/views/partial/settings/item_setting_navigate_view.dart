import 'package:flutter/material.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/modules/profile/views/partial/settings/item_setting_base_view.dart';

class ItemSettingNavigateView extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double trailingWidth;
  final double trailingHeight;
  final Color trailingColor;
  final Color colorTitle;
  const ItemSettingNavigateView(
      {Key key,
      @required this.title,
      this.onPressed,
      this.trailingWidth,
      this.trailingHeight,
      this.trailingColor,
      this.colorTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ItemSettingBaseView(
      colorTitle: colorTitle,
      onPressed: onPressed,
      title: title,
      trailingChild: Image.asset(Images.arrowRight,
          width: trailingWidth ?? 14,
          height: trailingHeight ?? 14,
          color: trailingColor ?? AppColor.appBarDarkBackground),
    );
  }
}
