import 'package:flutter/material.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/views/views/pressable_view.dart';

@deprecated
class ItemGroupTimeTableBySubjectView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          child: Text(
            'Thương mại quốc tế',
            style: fontInter(14, fontWeight: FontWeight.w600),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return _ItemSubjectTimeTableView(
              text: 'Thương mại quốc tế',
              backgroundColor: index % 2 == 0
                  ? AppColor.userInfoBackground
                  : AppColor.whiteColor,
              onPressed: () {},
            );
          },
          itemCount: 3,
        )
      ],
    );
  }
}

class _ItemSubjectTimeTableView extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final VoidCallback onPressed;

  const _ItemSubjectTimeTableView(
      {Key key,
      @required this.text,
      this.onPressed,
      this.backgroundColor = AppColor.whiteColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PressableView(
      onPressed: onPressed,
      backgroundColor: backgroundColor,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: 50,
        child: Row(
          children: [
            Expanded(
              child: Text(text ?? ''),
            ),
            Image.asset(Images.arrowRight,
                width: 14, height: 14, color: AppColor.appBarDarkBackground)
          ],
        ),
      ),
    );
  }
}
