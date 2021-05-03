import 'package:flutter/material.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';

class TimeTableUserView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Lịch tuần của sinh viên',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: fontInter(14,
                color: AppColor.subTextColor, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 12,
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (c, index) {
              return _ItemTimeTableView(
                index: index,
                subjectName: 'Thương mại quốc tế',
                time: 'T2, 1-3',
              );
            },
            itemCount: 10,
          ),
        ],
      ),
    );
  }
}

class _ItemTimeTableView extends StatelessWidget {
  final int index;
  final String subjectName;
  final String time;

  const _ItemTimeTableView(
      {Key key,
      @required this.index,
      @required this.subjectName,
      @required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
          color: AppColor.whiteColor,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 2),
                blurRadius: 12,
                color: Colors.black.withAlpha(5))
          ],
          borderRadius: BorderRadius.circular(3)),
      child: Row(
        children: [
          SizedBox(
            width: 25,
            child: Text(
              "${index.toString()}." ?? '',
              style: fontInter(14,
                  color: AppColor.descriptionTextColor,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Expanded(
            child: Text(
              subjectName ?? '',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: fontInter(14,
                  color: AppColor.textColor, fontWeight: FontWeight.w600),
            ),
          ),
          VerticalDivider(
            width: 1,
            thickness: 1,
            color: AppColor.lineColor,
          ),
          SizedBox(
            width: 25,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Thời gian:',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: fontInter(11,
                    color: AppColor.descriptionTextColor,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                time ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: fontInter(12,
                    color: AppColor.textColor, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ],
      ),
    );
  }
}
