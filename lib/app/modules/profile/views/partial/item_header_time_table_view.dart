import 'package:flutter/material.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';

class HeaderTimeTableView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: AppColor.textColor, borderRadius: BorderRadius.circular(3)),
      child: Row(
        children: [
          Expanded(
              flex: 4,
              child: Text('Lớp kì 2 - 2020-2021',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: fontInter(13,
                      color: AppColor.whiteColor,
                      fontWeight: FontWeight.w600))),
          Expanded(
            flex: 2,
            child: _LabelWithValueRichText(
              label: 'Môn: ',
              text: '2',
            ),
          ),
          VerticalDivider(
            color: AppColor.lineColor,
            indent: 12,
            endIndent: 12,
            width: 12,
            thickness: 1,
          ),
          Expanded(
            flex: 2,
            child: _LabelWithValueRichText(
              label: 'Tổng lớp: ',
              text: '5',
            ),
          )
        ],
      ),
    );
  }
}

class _LabelWithValueRichText extends StatelessWidget {
  final String label;
  final String text;

  const _LabelWithValueRichText(
      {Key key, @required this.label, @required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
        maxLines: 1,
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
            text: label ?? '',
            style: fontInter(13,
                color: AppColor.labelColor, fontWeight: FontWeight.w600),
            children: [
              TextSpan(
                text: text ?? '',
                style: fontInter(13,
                    color: AppColor.whiteColor, fontWeight: FontWeight.w600),
              )
            ]));
  }
}
