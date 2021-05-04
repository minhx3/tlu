import 'package:flutter/material.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';
import 'package:thanglong_university/app/routes/app_pages.dart';
import 'package:thanglong_university/app/views/views/pressable_view.dart';
import 'package:thanglong_university/app/views/views/value_box_view.dart';

///
/// Nhóm sinh viên: role chung
///
class StudentGroupView extends StatelessWidget {
  final String groupName;

  const StudentGroupView({Key key, @required this.groupName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            groupName ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: fontInter(16,
                color: AppColor.labelColor, fontWeight: FontWeight.w600),
          ),
        ),
        Divider(
          color: AppColor.labelColor,
          thickness: 1.5,
          indent: 12,
          endIndent: 12,
        ),
        SizedBox(
          height: 8,
        ),
        ListView.separated(
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (c, index) {
            return _ItemStudentView(
              onPressed: () {
                pushTo(Routes.USER_INFO);
              },
            );
          },
          itemCount: 5,
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              thickness: 1,
              indent: 12,
              endIndent: 12,
              color: AppColor.lineColor,
            );
          },
        )
      ],
    );
  }
}

///
/// Sinh viên : role chung
///
class _ItemStudentView extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isClassPresident;
  const _ItemStudentView(
      {Key key, @required this.onPressed, this.isClassPresident = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PressableView(
      backgroundColor: Colors.transparent,
      onPressed: onPressed,
      child: Container(
        height: 74,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: AppColor.subjectBackgroundColor,
              child: Text(
                'TM',
                style: fontInter(14, color: AppColor.whiteColor),
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      ValueBoxView(
                        text: '18050342',
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Visibility(
                        visible: isClassPresident,
                        child: ValueBoxView(
                          colors: AppColor.textColor,
                          text: 'Lớp trưởng',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Ngô Tiên Tiến',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: fontInter(14,
                        color: AppColor.textColor, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: AppColor.trailingIconItemColor,
              size: 40,
            ),
          ],
        ),
      ),
    );
  }
}