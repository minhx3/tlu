import 'package:flutter/material.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';

class LabelValueInfoView extends StatelessWidget {
  final String label;
  final String value;
  final bool isHozSeparated;

  const LabelValueInfoView(
      {Key key,
      @required this.label,
      @required this.value,
      this.isHozSeparated = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34,
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: fontInter(12,
                    color: AppColor.descriptionTextColor,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                value ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: fontInter(14,
                    color: AppColor.c4d4d4d, fontWeight: FontWeight.w600),
              )
            ],
          ),
          SizedBox(
            width: 15,
          ),
          VerticalDivider(
            width: 1,
            thickness: 1,
            color: isHozSeparated ? AppColor.lineColor : Colors.transparent,
          )
        ],
      ),
    );
  }
}
