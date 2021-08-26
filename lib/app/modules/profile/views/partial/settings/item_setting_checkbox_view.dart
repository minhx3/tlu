import 'package:flutter/material.dart';
import 'package:thanglong_university/app/modules/profile/views/partial/settings/item_setting_base_view.dart';
import 'package:thanglong_university/app/views/views/partials/custom_checkbox.dart';

class ItemSettingsCheckBoxView extends StatelessWidget {
  final String title;
  final bool isChecked;
  final Function onChanged;

  final Color colorTitle;
  final double fontSizeTitle;
  final FontWeight fontWeightTitle;

  const ItemSettingsCheckBoxView(
      {Key key,
      @required this.title,
      this.isChecked = true,
      this.onChanged,
      this.fontSizeTitle,
      this.fontWeightTitle,
      this.colorTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ItemSettingBaseView(
      onPressed: onChanged,
      colorTitle: colorTitle,
      fontSizeTitle: fontSizeTitle,
      fontWeightTitle: fontWeightTitle,
      title: title,
      trailingChild: SizedBox(
        width: 18,
        height: 18,
        child: CustomCheckbox(
          checked: isChecked,
          onChanged: (value) {
            onChanged();
          },
        ),
      ),
    );
  }
}
