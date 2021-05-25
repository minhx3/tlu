import 'package:flutter/material.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';

class SectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      child: Text(
        "Thứ 2 01/02/2021",
        style:
            fontInter(16, color: AppColor.c666666, fontWeight: FontWeight.w600),
      ),
    );
  }
}
