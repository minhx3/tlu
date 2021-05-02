import 'package:flutter/material.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/utils/screen/screen.dart';

class MessageContentView extends StatelessWidget {
  final Widget child;
  final bool isReply;
  final bool isMyMessage;

  final bool isQuoteMessage;
  const MessageContentView({
    Key key,
    @required this.child,
    this.isReply = false,
    this.isMyMessage = false,
    this.isQuoteMessage = false,
  }) : super(key: key);

  bool _isMyMessage() {
    return isMyMessage == true && isQuoteMessage == false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: Screen.width * 0.6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: _isMyMessage() == true
              ? AppColor.primaryColor
              : Colors.white.withOpacity(isReply == true ? 0.7 : 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(5),
              blurRadius: 12,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ]),
      padding: EdgeInsets.only(
          top: 10, left: 10, right: 10, bottom: isReply == true ? 40 : 10),
      child: child,
    );
  }
}
