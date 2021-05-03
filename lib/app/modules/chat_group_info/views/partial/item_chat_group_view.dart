import 'package:flutter/material.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/views/views/image_view.dart';
import 'package:thanglong_university/app/views/views/pressable_view.dart';

///
/// Item Nhóm chat: Role giảng viên
///
class ItemChatGroupView extends StatelessWidget {
  final VoidCallback onPressed;
  final String groupName;

  const ItemChatGroupView(
      {Key key, @required this.groupName, @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _ItemChatGroupBaseView(
        onPressed: onPressed,
        child: Text(
          groupName ?? '',
          style: fontInter(13,
              fontWeight: FontWeight.w600, color: Color(0xFF333333)),
        ));
  }
}

class ItemAddNewChatGroupView extends StatelessWidget {
  final VoidCallback onPressed;

  const ItemAddNewChatGroupView({Key key, @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _ItemChatGroupBaseView(
        onPressed: onPressed,
        child: ImageView(
          Images.icAdd,
          type: Type.assets,
          width: 15,
          height: 15,
        ));
  }
}

class _ItemChatGroupBaseView extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const _ItemChatGroupBaseView(
      {Key key, @required this.onPressed, @required this.child})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PressableView(
      borderRadius: 3,
      backgroundColor: AppColor.whiteColor,
      onPressed: onPressed,
      child: Container(
        alignment: Alignment.center,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(3), boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(5),
            blurRadius: 12,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ]),
        padding: EdgeInsets.all(10),
        child: child,
      ),
    );
  }
}
