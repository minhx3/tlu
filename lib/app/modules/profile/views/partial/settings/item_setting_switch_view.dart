import 'package:flutter/material.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';

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
    return Material(
      color: Colors.transparent,
      child: SizedBox(
        height: 50,
        child: InkWell(
          onTap: () => onChanged(!isChecked),
          splashColor: AppColor.primaryColor,
          highlightColor: AppColor.primaryColor.withOpacity(0.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  title ?? '',
                  style: fontInter(fontSizeTitle,
                      color: colorTitle, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Switch(
                  activeTrackColor: AppColor.cd9d9d9,
                  inactiveTrackColor: AppColor.cd9d9d9,
                  inactiveThumbColor: AppColor.c8c8c8c,
                  value: isChecked,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onChanged: (value) => onChanged(value),
                  activeColor: AppColor.primaryColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
