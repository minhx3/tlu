import 'package:flutter/material.dart';
import 'package:thanglong_university/app/utils/screen/screen.dart';

class MessageContentView extends StatelessWidget {
  final Widget child;
  final bool isReply;
  final bool isMyMessage;
  final Function onTap;
  final bool isQuoteMessage;

  const MessageContentView({
    Key key,
    @required this.child,
    this.onTap,
    this.isReply = false,
    this.isMyMessage = false,
    this.isQuoteMessage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        constraints: BoxConstraints(maxWidth: Screen.width * 0.7),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: Colors.white70.withOpacity(isReply == true ? 0.7 : 1),
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
      ),
    );
  }
}
