import 'package:flutter/material.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/views/views/pressable_view.dart';

class ItemSettingBaseView extends StatelessWidget {
  final String title;
  final Widget trailingChild;
  final VoidCallback onPressed;

  final Color colorTitle;
  final double fontSizeTitle;
  final FontWeight fontWeightTitle;

  const ItemSettingBaseView(
      {Key key,
      @required this.title,
      @required this.trailingChild,
      this.onPressed,
      this.fontSizeTitle = 13.0,
      this.fontWeightTitle = FontWeight.w600,
      this.colorTitle = AppColor.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PressableView(
      onPressed: onPressed,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: 50,
        child: Row(
          children: [
            Expanded(
              child: Text(
                title ?? '',
                style: fontInter(fontSizeTitle,
                    color: colorTitle, fontWeight: fontWeightTitle),
              ),
            ),
            trailingChild
          ],
        ),
      ),
    );
  }
}
