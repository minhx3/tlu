import 'package:flutter/material.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';

class ItemBaseMessageView extends StatelessWidget {
  final String senderAvatarUrl;
  final String senderName;
  final Widget child;

  final bool isMyMessage;
  const ItemBaseMessageView({
    Key key,
    @required this.senderName,
    @required this.child,
    @required this.senderAvatarUrl,
    this.isMyMessage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isMyMessage == true
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 50,
            ),
            Expanded(
              child: Text(
                senderName ?? '',
                maxLines: 1,
                textAlign:
                    isMyMessage == true ? TextAlign.right : TextAlign.left,
                overflow: TextOverflow.ellipsis,
                style: fontInter(12,
                    fontWeight: FontWeight.w600,
                    color: AppColor.labelMessageTextColor),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_renderAvatar(), child],
        ),
        SizedBox(
          height: 12,
        ),
      ],
    );
  }

  Widget _renderAvatar() {
    return Builder(
      builder: (c) {
        if (isMyMessage == true) {
          return SizedBox.shrink();
        }

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.blue,
              child: Text('PT'),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        );
      },
    );
  }
}
