import 'package:flutter/material.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/modules/chat_detail/views/messages/item_base_message_view.dart';
import 'package:thanglong_university/app/modules/chat_detail/views/messages/message_content_view.dart';

class ItemRawMessageView extends StatelessWidget {
  final String senderAvatarUrl;
  final String senderName;
  final String text;
  final bool isReply;
  final bool isMyMessage;
  final bool isQuoteMessage;

  const ItemRawMessageView(
      {Key key,
      @required this.senderName,
      @required this.text,
      this.isReply = false,
      this.senderAvatarUrl,
      this.isQuoteMessage = false,
      this.isMyMessage = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ItemBaseMessageView(
      senderName: senderName,
      senderAvatarUrl: senderAvatarUrl,
      isMyMessage: isMyMessage,
      child: MessageContentView(
        isMyMessage: isMyMessage,
        isQuoteMessage: isQuoteMessage,
        isReply: isReply,
        child: Text(
          text,
          style: fontInter(14, color: _getTextColor()),
        ),
      ),
    );
  }

  Color _getTextColor() {
    if (isReply == true) {
      return AppColor.labelMessageTextColor;
    } else {
      if (isMyMessage == true) {
        return AppColor.whiteColor;
      } else {
        return AppColor.textColor;
      }
    }
  }
}
