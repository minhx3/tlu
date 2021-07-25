import 'package:flutter/material.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/modules/chat_detail/views/messages/item_raw_message_view.dart';
import 'package:thanglong_university/app/modules/chat_detail/views/messages/message_content_view.dart';

class ItemReplyMessageView extends StatelessWidget {
  final String senderAvatarUrl;
  final String userReply;
  final String senderName;
  final String originalMessage;
  final String text;
  final bool isMyMessage;

  const ItemReplyMessageView(
      {Key key,
      this.isMyMessage = false,
      @required this.senderAvatarUrl,
      @required this.userReply,
      @required this.originalMessage,
      @required this.text, this.senderName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isMyMessage == true
          ? CrossAxisAlignment.end
          : CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ItemRawMessageView(
              senderAvatarUrl: senderAvatarUrl,
              isMyMessage: isMyMessage,
              isReply: true,
              isQuoteMessage: true,
              senderName: userReply,
              text: originalMessage,
            ),
            Positioned(
              left: isMyMessage == true ? null : 60,
              right: isMyMessage == true ? 10 : null,
              bottom: 0,
              child: MessageContentView(
                isMyMessage: isMyMessage,
                child: Text(
                  text,
                  style: fontInter(14),
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 12,
        ),
      ],
    );
  }

}
