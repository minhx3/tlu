import 'package:flutter/material.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/modules/user_info/views/partial/label_value_info_view.dart';

class ItemInfoView extends StatelessWidget {
  final String label;
  final String value;

  const ItemInfoView({Key key, @required this.label, @required this.value})
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
        LabelValueInfoView(
          label: label ?? '',
          value: value ?? '',
        ),
        SizedBox(
          height: 12,
        ),
        Divider(
          height: 1,
          color: AppColor.lineSectionColor,
        ),
      ],
    );
  }
}
