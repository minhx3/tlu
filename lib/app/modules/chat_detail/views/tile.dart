import 'package:flutter/material.dart';
import 'package:thanglong_university/app/modules/chat_detail/views/messages/item_attachment_message_view.dart';
import 'package:thanglong_university/app/modules/chat_detail/views/messages/item_raw_message_view.dart';
import 'package:thanglong_university/app/modules/chat_detail/views/messages/item_reply_message_view.dart';

enum ChatType { raw, attachment, reply }

class ChatTile extends StatelessWidget {
  const ChatTile({
    Key key,
    @required this.type,
    @required this.name,
    @required this.isMe,
    @required this.sent,
    @required this.imageURL,
    @required this.message,
    @required this.id,
  }) : super(key: key);
  final ChatType type;
  final String name;
  final String sent;
  final String imageURL;
  final String message;
  final String id;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    Widget title = ItemRawMessageView(text: 'null', senderName: null);
    switch (type) {
      case ChatType.raw:
        title = ItemRawMessageView(
          isMyMessage: isMe,
          text: message,
          senderName: null,
        );
        break;
      case ChatType.attachment:
        title = ItemAttachmentMessageView(
          isMyMessage: isMe,
          senderName: null,
          senderAvatarUrl: null,
          fileName: null,
        );
        break;
      case ChatType.reply:
        title = ItemReplyMessageView(
          isMyMessage: isMe,
          text: message,
          senderAvatarUrl: null,
          originalMessage: null,
          userReply: null,
        );
        break;
      default:
    }

    return title;
  }
}
