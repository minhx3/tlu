import 'package:flutter/material.dart';
import 'package:thanglong_university/app/modules/profile/views/partial/settings/item_setting_base_view.dart';

class ItemSettingsCheckBoxView extends StatelessWidget {
  final String title;
  final bool isChecked;
  final VoidCallback onPressed;

  final Color colorTitle;
  final double fontSizeTitle;
  final FontWeight fontWeightTitle;

  const ItemSettingsCheckBoxView(
      {Key key,
      @required this.title,
      this.isChecked = true,
      this.onPressed,
      this.fontSizeTitle,
      this.fontWeightTitle,
      this.colorTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ItemSettingBaseView(
      onPressed: onPressed,
      colorTitle: colorTitle,
      fontSizeTitle: fontSizeTitle,
      fontWeightTitle: fontWeightTitle,
      title: title,
      trailingChild: Checkbox(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        value: isChecked,
        onChanged: (value) {},
        activeColor: Colors.grey,
      ),
    );
  }
}
