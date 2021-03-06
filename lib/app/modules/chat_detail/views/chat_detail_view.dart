import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';
import 'package:thanglong_university/app/model/chat/chat.dart';
import 'package:thanglong_university/app/model/chat/group_chat_model.dart';
import 'package:thanglong_university/app/model/chat/user.dart';
import 'package:thanglong_university/app/modules/chat_detail/controllers/chat_detail_controller.dart';
import 'package:thanglong_university/app/modules/chat_detail/views/tile.dart';
import 'package:thanglong_university/app/modules/emoij/src/chooser.dart';
import 'package:thanglong_university/app/routes/app_pages.dart';
import 'package:thanglong_university/app/service/storage/storage.dart';
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
          title: controller.subjectClassId,
        ),
        backgroundColor: AppColor.chatBackground,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(child: _ContentChatListView()),
              BottomChatView(),
              Obx(() => controller.showEmoij.isTrue
                  ? EmojiChooser(
                      rows: 2,
                      onSelected: (emoji) {
                        controller.tec.value = TextEditingValue(
                            text: controller.tec.text + emoji.char,
                            selection: TextSelection.fromPosition(TextPosition(
                                offset: controller.tec.text.length + 2)));
                      },
                    )
                  : SizedBox.shrink()),
            ],
          ),
        ),
      ),
    );
  }
}

class _AppBarView extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final GroupChatModel cg;

  const _AppBarView({Key key, @required this.title, this.cg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: AppColor.lineColor))),
      child: AppBarView(
          type: AppBarType.icon,
          title: title ?? '',
          iconLeading: Images.icPeople,
          iconSize: 23,
          iconTintColor: AppColor.textColor,
          onAction: () {
            pushTo(Routes.CHAT_GROUP_INFO, arguments: title);
          }),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.0);
}

class BottomChatView extends GetView<ChatDetailController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 60, maxHeight: 80),
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
          border: Border(top: BorderSide(color: AppColor.lineColor))),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() => controller.messageReply()?.text != null
              ? Row(
                  children: [
                    Text(controller.messageReply().text),
                    IconButton(
                      onPressed: () => controller.cleanMessage(),
                      icon: Icon(Icons.close),
                    )
                  ],
                )
              : SizedBox.shrink()),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _CommonAttachmentView(),
              SizedBox(
                width: 6,
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                        child: _InputChatView(
                      controller: controller.tec,
                      focusNode: controller.focusNode,
                      toogleEmoij: () => controller.showEmoij.toggle(),
                    )),
                    IconButton(
                      icon: Image.asset(
                        Images.icSendMessage,
                        width: 20,
                        height: 20,
                      ),
                      onPressed: () {
                        controller.sendMessage();
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class _CommonAttachmentView extends GetView<ChatDetailController> {
  const _CommonAttachmentView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: Obx(() => AnimatedSwitcher(
            duration: 250.milliseconds,
            child: controller.showAttachment() == true
                ? Wrap(
                    alignment: WrapAlignment.center,
                    runAlignment: WrapAlignment.center,
                    spacing: 0,
                    children: [
                      _IconAttachmentView(
                        imageAsset: Images.icUpload,
                        onPressed: () {
                          controller.sendFile();
                        },
                      ),
                      _IconAttachmentView(
                        imageAsset: Images.icGallary,
                        onPressed: () {
                          controller.sendImg(ImageSource.gallery);
                        },
                      ),
                    ],
                  )
                : IconButton(
                    onPressed: () {
                      controller.showAttachment.toggle();
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: AppColor.subTextColor,
                    ),
                  ),
          )),
    );
  }
}

class _InputChatView extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final Function toogleEmoij;

  const _InputChatView(
      {Key key, @required this.controller, this.focusNode, this.toogleEmoij})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12),
      height: 40,
      decoration: BoxDecoration(
          color: AppColor.inputChatBackground,
          borderRadius: BorderRadius.circular(22)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
              child: TextField(
            focusNode: focusNode,
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
            maxLines: 1,
            textInputAction: TextInputAction.send,
            keyboardType: TextInputType.text,
            style: fontInter(14),
          )),
          IconButton(
              icon: Image.asset(
                Images.icEmoj,
                width: 20,
                height: 20,
                color: Color(0xFFBFBFBF),
                fit: BoxFit.fill,
              ),
              onPressed: () {
                toogleEmoij();
              })
        ],
      ),
    );
  }
}

class _ContentChatListView extends GetView<ChatDetailController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          color: AppColor.blockEducationBackground,
          child: ListView.builder(
            reverse: true,
            controller: controller.scrollController,
            itemCount: controller.list.length,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              final Chat data = controller.list[index];
              final UserModel _user = null;
              String _photoUrl = _user?.photoURL;
              String _userName = _user?.displayName;
              bool _isMe = data.uidFrom == getUserId;
              return ChatTile(
                message: data,
                isMe: _isMe,
                imageURL: _photoUrl,
                name: _userName ?? '',
              );
            },
          ),
        ));
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
