import 'package:flutter/material.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/modules/chat_detail/views/messages/item_base_message_view.dart';
import 'package:thanglong_university/app/modules/chat_detail/views/messages/message_content_view.dart';
import 'package:thanglong_university/app/views/views/image_view.dart';

class ItemRawMessageView extends StatelessWidget {
  final String senderAvatarUrl;
  final String senderName;
  final String text;
  final String img;
  final bool isReply;
  final bool isMyMessage;
  final bool isQuoteMessage;
  final Function onTap;

  const ItemRawMessageView(
      {Key key,
      @required this.senderName,
      @required this.text,
      this.isReply = false,
      this.senderAvatarUrl,
      this.isQuoteMessage = false,
      this.isMyMessage = false,
      this.onTap,
      this.img})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ItemBaseMessageView(
      senderName: senderName,
      senderAvatarUrl: senderAvatarUrl,
      isMyMessage: isMyMessage,
      child: MessageContentView(
        onTap: onTap,
        isMyMessage: isMyMessage,
        isQuoteMessage: isQuoteMessage,
        isReply: isReply,
        child: img != null
            ? ImageView(
                img,
                height: 240,
                width: 135,
              )
            : Text(
                text ?? '',
                style: fontInter(14,
                    color: isReply ? Color(0xff4D4D4D).withAlpha(70) : null),
              ),
      ),
    );
  }
}
