import 'package:flutter/material.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/views/views/pressable_view.dart';

class ChildItemGroupChatBySubjectView extends StatelessWidget {
  final VoidCallback onPressed;

  const ChildItemGroupChatBySubjectView({Key key, this.onPressed}) : super(key: key);

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
                      Container(
                        decoration: BoxDecoration(
                            color: AppColor.errorColor,
                            borderRadius: BorderRadius.circular(3)),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 3),
                        alignment: Alignment.center,
                        child: Text(
                          "T2, 1-3",
                          style: fontInter(10,
                              fontWeight: FontWeight.w600,
                              color: AppColor.whiteColor),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Expanded(
                        child: Text(
                          'Thương mại quốc tế',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: fontInter(14, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    'Bạn: Các em chèck slide trước khi đến...',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: fontInter(12,
                        color: AppColor.descriptionTextColor,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            _ExpandableIcon()
          ],
        ),
      ),
    );
  }
}

class _ExpandableIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      child: Stack(
        children: [
          Icon(
            Icons.expand_more,
            color: AppColor.textColor,
            size: 40,
          ),
          Positioned(
              top: 10,
              right: 5,
              child: CircleAvatar(
                radius: 5,
                backgroundColor: AppColor.primaryColor,
              ))
        ],
      ),
    );
  }
}
