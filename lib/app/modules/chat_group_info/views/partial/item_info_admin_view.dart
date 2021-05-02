import 'package:flutter/material.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/views/views/image_view.dart';
import 'package:thanglong_university/app/views/views/pressable_view.dart';

///
/// Item Quản trị: role Sinh viên
///
class ItemAdminView extends StatelessWidget {
  final VoidCallback onPressed;
  final VoidCallback onChatPressed;

  final bool isTeacher;

  final String title;
  final String name;

  const ItemAdminView(
      {Key key,
      @required this.onPressed,
      @required this.onChatPressed,
      @required this.title,
      @required this.name,
      this.isTeacher = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PressableView(
      colorBackground: Colors.transparent,
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
                  Text(
                    title ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: fontInter(11,
                        color: AppColor.descriptionTextColor,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    name ?? 'Ngô Tiên Tiến',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: fontInter(14,
                        color: AppColor.textColor, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            _renderTrailingIconButton()
          ],
        ),
      ),
    );
  }

  Widget _renderTrailingIconButton() {
    if (isTeacher == true) {
      return GestureDetector(
        onTap: onChatPressed,
        child: ImageView(
          Images.icChat,
          type: Type.assets,
          width: 25,
          height: 25,
        ),
      );
    } else {
      return Icon(
        Icons.chevron_right,
        color: AppColor.trailingIconItemColor,
        size: 40,
      );
    }
  }
}
