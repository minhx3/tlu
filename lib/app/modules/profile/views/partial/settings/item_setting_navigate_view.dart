import 'package:flutter/material.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/modules/profile/views/partial/settings/item_setting_base_view.dart';

class ItemSettingNavigateView extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const ItemSettingNavigateView({Key key, @required this.title, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ItemSettingBaseView(
      onPressed: onPressed,
      title: title,
      trailingChild: Image.asset(Images.arrowRight,
          width: 14, height: 14, color: AppColor.appBarDarkBackground),
    );
  }
}
