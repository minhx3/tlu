import 'package:flutter/material.dart';
import 'package:thanglong_university/app/resources/font.dart';

TextStyle fontInter(double fontSize,
    {Color color = Colors.black,
    TextDecoration textDecoration = TextDecoration.none,
    FontWeight fontWeight = FontWeight.normal,
    FontStyle fontStyle = FontStyle.normal}) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: Font.inter,
      color: color,
      fontStyle: fontStyle,
      fontWeight: fontWeight,
      decoration: textDecoration);
}
