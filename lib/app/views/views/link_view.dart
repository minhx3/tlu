import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';

class LinkView extends GetView {
  final String title;
  final Function onTap;
  final TextDecoration textDecoration;
  final Color textColor;
  final TextAlign textAlign;
  LinkView(
    this.title, {
    this.textColor = AppColor.labelColor,
    this.onTap,
    this.textAlign = TextAlign.start,
    this.textDecoration = TextDecoration.underline,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: RichText(
          textAlign: TextAlign.start,
          text: TextSpan(
            text: title,
            style: fontInter(12,
                textDecoration: textDecoration,
                color: textColor,
                fontWeight: FontWeight.w600),
          )),
    );
  }
}
