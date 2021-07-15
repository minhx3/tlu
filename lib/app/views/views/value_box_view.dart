import 'package:flutter/material.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';

class ValueBoxView extends StatelessWidget {
  final String text;
  final Color colors;
  final double fontSize;
  const ValueBoxView({Key key, @required this.text, this.colors, this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: colors ?? AppColor.errorColor,
          borderRadius: BorderRadius.circular(3)),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      alignment: Alignment.center,
      child: Text(
        text,
        style: fontInter(fontSize ?? 11,
            fontWeight: FontWeight.w600, color: AppColor.whiteColor),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
