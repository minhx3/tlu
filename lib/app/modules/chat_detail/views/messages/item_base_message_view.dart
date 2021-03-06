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

  bool _isVisibleSenderName() {
    return senderName != null && senderName.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isMyMessage == true
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Visibility(
          visible: _isVisibleSenderName(),
          child: Row(
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
        ),
        SizedBox(
          height: 5,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _renderAvatar(isMyMessage, senderAvatarUrl, senderName),
            child
          ],
        ),
        SizedBox(
          height: 12,
        ),
      ],
    );
  }

  // Widget _renderAvatar() {
  //   return Builder(
  //     builder: (c) {
  //       if (isMyMessage == true) {
  //         return SizedBox.shrink();
  //       }
  //
  //       return Row(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           CircleAvatar(
  //             radius: 20,
  //             backgroundColor: Colors.blue,
  //             child: Text('PT'),
  //           ),
  //           SizedBox(
  //             width: 10,
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  _renderAvatar(bool isMyMessage, String avatar, String name) {
    NetworkImage _backgroundImage;
    Widget _child = SizedBox();

    if (isMyMessage) {
      return SizedBox.shrink();
    }

    if (avatar != null && avatar.isNotEmpty) {
      _backgroundImage = NetworkImage(avatar);
    } else {
      _child = Text(
        name != null ? name[0].toUpperCase() : "",
        style: TextStyle(
            color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
      );
    }

    return CircleAvatar(
      radius: 20,
      backgroundColor: AppColor.primaryColor,
      backgroundImage: _backgroundImage,
      child: _child,
    );
  }
}
