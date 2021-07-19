import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thanglong_university/app/model/chat/chat.dart';
import 'package:thanglong_university/app/modules/chat_detail/controllers/chat_detail_controller.dart';
import 'package:thanglong_university/app/modules/chat_detail/views/messages/item_attachment_message_view.dart';
import 'package:thanglong_university/app/modules/chat_detail/views/messages/item_raw_message_view.dart';
import 'package:thanglong_university/app/modules/chat_detail/views/messages/item_reply_message_view.dart';

enum ChatType { raw, attachment, reply }

class ChatTile extends GetView<ChatDetailController> {
  const ChatTile({
    Key key,
    @required this.type,
    @required this.name,
    @required this.isMe,
    @required this.sent,
    @required this.imageURL,
    @required this.message,
  }) : super(key: key);
  final Chat message;
  final ChatType type;
  final String name;
  final String sent;
  final String imageURL;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    Widget tile = ItemRawMessageView(text: 'null', senderName: null);
    switch (type) {
      case ChatType.raw:
        tile = ItemRawMessageView(
          onTap: () => controller.selectMessage(message),
          isMyMessage: isMe,
          text: message.text,
          senderName: null,
        );
        break;
      case ChatType.attachment:
        tile = ItemAttachmentMessageView(
          isMyMessage: isMe,
          senderName: null,
          senderAvatarUrl: null,
          fileName: null,
        );
        break;
      case ChatType.reply:
        tile = ItemReplyMessageView(
          isMyMessage: isMe,
          text: 'message',
          senderAvatarUrl: null,
          originalMessage: 'originalMessage',
          userReply: 'Tao đã trả lời',
        );
        break;
      default:
    }

    return tile;
  }
}
