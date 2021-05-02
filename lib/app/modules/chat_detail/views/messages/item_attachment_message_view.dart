import 'package:flutter/material.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/modules/chat_detail/views/messages/item_base_message_view.dart';
import 'package:thanglong_university/app/modules/chat_detail/views/messages/message_content_view.dart';

class ItemAttachmentMessageView extends StatelessWidget {
  final String senderAvatarUrl;
  final String senderName;
  final String fileName;
  final bool isMyMessage;
  const ItemAttachmentMessageView(
      {Key key,
      @required this.senderName,
      @required this.fileName,
      @required this.senderAvatarUrl,
      this.isMyMessage = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ItemBaseMessageView(
      senderName: senderName ?? '',
      senderAvatarUrl: null,
      isMyMessage: isMyMessage,
      child: MessageContentView(
          isMyMessage: isMyMessage,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.file_download,
                size: 15,
              ),
              SizedBox(
                width: 12,
              ),
              Text(
                fileName ?? '',
                style: fontInter(14,
                    textDecoration: TextDecoration.underline,
                    fontWeight: FontWeight.w500,
                    color: AppColor.sectionTermColor),
              )
            ],
          )),
    );
  }
}
