import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';
import 'package:thanglong_university/app/modules/chat_detail/controllers/chat_detail_controller.dart';
import 'package:thanglong_university/app/modules/chat_detail/views/messages/item_attachment_message_view.dart';
import 'package:thanglong_university/app/modules/chat_detail/views/messages/item_raw_message_view.dart';
import 'package:thanglong_university/app/modules/chat_detail/views/messages/item_reply_message_view.dart';
import 'package:thanglong_university/app/routes/app_pages.dart';
import 'package:thanglong_university/app/utils/screen/screen.dart';
import 'package:thanglong_university/app/views/views/app_bar_view.dart';
import 'package:thanglong_university/app/views/views/pressable_view.dart';

class ChatDetailView extends GetView<ChatDetailController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: _AppBarView(
          title: 'Thương mại quốc tế',
        ),
        backgroundColor: AppColor.chatBackground,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(child: _ContentChatListView()),
              _BottomChatView()
            ],
          ),
        ),
      ),
    );
  }
}

class _AppBarView extends StatelessWidget with PreferredSizeWidget {
  final String title;

  const _AppBarView({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColor.lineColor))),
      child: AppBarView(
        type: AppBarType.detail,
        title: title ?? '',
        actions: [
          IconButton(
            icon: Image.asset(
              Images.icPeople,
              width: 25,
              height: 25,
            ),
            onPressed: () {
              pushTo(Routes.CHAT_GROUP_INFO);
            },
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.0);
}

class _BottomChatView extends GetView<ChatDetailController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 60, maxHeight: 120),
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      decoration: BoxDecoration(
          border: Border(top: BorderSide(color: AppColor.lineColor))),
      child: Row(
        children: [
          KeyboardVisibilityBuilder(
            builder: (c, isVisible) {
              return AnimatedContainer(
                width: isVisible ? 0 : Get.width * 0.5,
                duration: Duration(milliseconds: 200),
                child: _CommonAttachmentView(),
              );
            },
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                    child: _InputChatView(
                  controller: controller.inputChatController,
                )),
                IconButton(
                  icon: Image.asset(
                    Images.icSendMessage,
                    width: 20,
                    height: 20,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _CommonAttachmentView extends StatelessWidget {
  const _CommonAttachmentView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: Wrap(
        alignment: WrapAlignment.center,
        runAlignment: WrapAlignment.center,
        spacing: 8,
        //mainAxisAlignment: MainAxisAlignment.spaceAround,
        //crossAxisAlignment: CrossAxisAlignment.center,
        //mainAxisSize: MainAxisSize.min,
        children: [
          _IconAttachmentView(
            imageAsset: Images.icOtherComponent,
            onPressed: () {},
          ),
          _IconAttachmentView(
            imageAsset: Images.icCapture,
            onPressed: () {},
          ),
          _IconAttachmentView(
            imageAsset: Images.icGallary,
            onPressed: () {},
          ),
          _IconAttachmentView(
            imageAsset: Images.icVoice,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _InputChatView extends StatelessWidget {
  final TextEditingController controller;

  const _InputChatView({
    Key key,
    @required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12),
      decoration: BoxDecoration(
          color: AppColor.inputChatBackground,
          borderRadius: BorderRadius.circular(3)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: KeyboardVisibilityBuilder(
              builder: (context, isKeyboardVisible) {
                return TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    fillColor: Colors.transparent,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(vertical: 6),
                    isDense: true,
                    filled: true,
                  ),
                  enableSuggestions: false,
                  autocorrect: false,
                  minLines: 1,
                  //maxLengthEnforced: true,
                  maxLines: isKeyboardVisible ? null : 1,
                  textInputAction: TextInputAction.send,
                  keyboardType: TextInputType.text,
                  style: fontInter(14),
                );
              },
            ),
          ),
          IconButton(
              icon: Image.asset(
                Images.icEmoj,
                width: 20,
                height: 20,
                color: Color(0xFFBFBFBF),
                fit: BoxFit.fill,
              ),
              onPressed: () {})
        ],
      ),
    );
  }
}

class _ContentChatListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.blockEducationBackground,
      child: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          ItemRawMessageView(
            senderName: 'TS. Đàm Thị Phương Thảo',
            text:
                '''Chào cả lớp, để phục vụ việc cho điểm thuyết trình, đề nghị tất cả các nhóm gửi bản đánh giá mức độ hoàn thành công việc của thành viên (0-100%) cho cô nhé. Cảm ơn các em!
Cô Thảo''',
          ),
          ItemRawMessageView(
            isMyMessage: true,
            senderName: '',
            text: "Vâng ạ.",
          ),
          ItemAttachmentMessageView(
            isMyMessage: false,
            senderName: 'TS. Đàm Thị Phương Thảo',
            fileName: 'diem_thuyet_trinh.docx',
            senderAvatarUrl: null,
          ),
          ItemReplyMessageView(
            isMyMessage: false,
            originalMessage:
                '''Chào cả lớp, để phục vụ việc cho điểm thuyết trình, đề nghị tất cả các nhóm gửi bản đánh giá mức độ hoàn thành công việc của thành viên (0-100%) cho cô nhé. Cảm ơn các em!
Cô Thảo''',
            senderAvatarUrl: null,
            text: 'Hả :(',
            userReply: '18050324 - Trần Huỳnh Đức đã trả lời tin nhắn...',
          ),
          ItemReplyMessageView(
            isMyMessage: true,
            originalMessage: '''Tệp đính kèm''',
            senderAvatarUrl: null,
            text: 'Không tải được a e à :(',
            userReply: 'Bạn đã trả lời tin nhắn của TS. Đàm Thị Phươnng Thảo',
          ),
          ItemRawMessageView(
            senderName: 'Nguyễn Tiến Lùi',
            text: "Có ai tải được file không?",
          ),
          ItemRawMessageView(
            senderName: 'Nguyễn Tiến Lùi',
            text: "App lỗi, không tải được. Vote 1*",
          ),
          ItemReplyMessageView(
            isMyMessage: true,
            originalMessage: '''App lỗi, không tải được. Vote 1*''',
            senderAvatarUrl: null,
            text: 'Không xài thì xoá app đi.',
            userReply: 'Bạn đã trả lời tin nhắn của Nguyễn Tiến Lùi',
          ),
          ItemRawMessageView(
            senderName: 'Nguyễn Tiến Lùi',
            text: "Ok bạn ơi",
          ),
          ItemRawMessageView(
            senderName: 'TS. Đàm Thị Phương Thảo',
            text: "Các em tải lại file nhé.",
          ),
          ItemAttachmentMessageView(
            isMyMessage: false,
            senderName: 'TS. Đàm Thị Phương Thảo',
            fileName: 'diem_thuyet_trinh_v2.docx',
            senderAvatarUrl: null,
          ),
          ItemReplyMessageView(
            originalMessage: '''Các em tải lại file nhé.''',
            senderAvatarUrl: null,
            text: 'Vâng ạ :((((',
            userReply:
                'Nguyễn Tiến Lùi đã trả lời tin nhắn của TS. Đàm Thị Phương Thảo',
          ),
          ItemRawMessageView(
            isMyMessage: true,
            senderName: '',
            text: "Tải được rồi đó a e.",
          ),
        ],
        //itemCount: 20,
      ),
    );
  }
}

class _IconAttachmentView extends StatelessWidget {
  final VoidCallback onPressed;
  final String imageAsset;

  const _IconAttachmentView({Key key, this.onPressed, this.imageAsset})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PressableView(
      borderRadius: 4,
      backgroundColor: Colors.transparent,
      onPressed: onPressed,
      child: Container(
        constraints: BoxConstraints(maxHeight: 40),
        padding: const EdgeInsets.all(8),
        child: Image.asset(
          imageAsset,
          width: 20,
          height: 20,
        ),
      ),
    );
  }
}
