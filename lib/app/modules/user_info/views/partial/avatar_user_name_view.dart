import 'package:flutter/material.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/views/views/value_box_view.dart';

class AvatarUserNameView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 35,
          backgroundColor: AppColor.primaryColor,
          child: Text('AVT'),
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ValueBoxView(
              text: '18050342',
            ),
            Text(
              '''Vương Quốc
Bình Minh''',
              style: fontInter(18, fontWeight: FontWeight.w600),
            )
          ],
        )
      ],
    );
  }
}
