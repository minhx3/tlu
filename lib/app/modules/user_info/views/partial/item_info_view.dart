import 'package:flutter/material.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/modules/user_info/views/partial/label_value_info_view.dart';

class ItemInfoView extends StatelessWidget {
  final String label;
  final String value;
  final bool lineBreak;

  const ItemInfoView(
      {Key key,
      @required this.label,
      @required this.value,
      this.lineBreak = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: LabelValueInfoView(
            label: label ?? '',
            value: value ?? '',
          ),
        ),
        SizedBox(
          height: 12,
        ),
        this.lineBreak
            ? Divider(
                height: 1,
                color: AppColor.lineSectionColor,
              )
            : SizedBox(),
      ],
    );
  }
}
