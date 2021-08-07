import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/modules/chat_detail/controllers/chat_detail_controller.dart';
import 'package:thanglong_university/app/modules/chat_group_info/views/partial/info_student_group.dart';
import 'package:thanglong_university/app/modules/chat_group_info/views/partial/item_chat_group_view.dart';
import 'package:thanglong_university/app/modules/chat_group_info/views/partial/item_info_admin_view.dart';
import 'package:thanglong_university/app/views/views/app_bar_view.dart';
import 'package:thanglong_university/app/views/views/image_view.dart';
import 'package:thanglong_university/app/views/views/pressable_view.dart';

class ChatGroupInfoView extends GetView<ChatDetailController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColor.whiteColor,
        appBar: _AppBarView(),
        body: Container(
            color: AppColor.chatBackground, child: _ListContentView()),
      ),
    );
  }
}

class _AppBarView extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBarView(
      type: AppBarType.detail,
      title: 'Danh sách lớp',
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);
}

class _ListContentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        // _EnterChatView(),
        _SearchBoxView(),
        // _ChatGroupView(),
        // _AdminListView(),
        StudentGroupView(
          groupName: 'Danh sách lớp',
        )
      ],
    );
  }
}

///
/// Back lại màn hình chat
/// Nếu có tin nhắn mới sẽ đổi màu đỏ
/// Role: Sinh viên
///
class _EnterChatView extends StatelessWidget {
  final bool hasNewMessage;

  const _EnterChatView({Key key, this.hasNewMessage = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
      child: PressableView(
        borderRadius: 3,
        onPressed: () {},
        child: Container(
          alignment: Alignment.center,
          height: 50,
          decoration: BoxDecoration(
              color: hasNewMessage == true
                  ? AppColor.primaryColor
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(3),
              border: Border.all(
                  width: 1.5,
                  color: hasNewMessage == true
                      ? AppColor.primaryColor
                      : AppColor.textColor)),
          child: Text(
            'Chat nhóm 1',
            style: fontInter(14,
                color: hasNewMessage == true
                    ? AppColor.whiteColor
                    : AppColor.textColor,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}

///
/// Tìm kiếm
/// Role: Giảng viên
///
class _SearchBoxView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
          color: AppColor.searchInputBackground,
          border: Border.all(color: AppColor.lineColor)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ImageView(
            Images.icSearch,
            type: Type.assets,
            width: 15,
            height: 15,
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
              child: TextField(
            maxLines: 1,
            style: fontInter(12, fontWeight: FontWeight.w500),
            decoration: InputDecoration(
                fillColor: Colors.transparent,
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                isDense: true,
                hintText: 'Tìm kiếm',
                hintStyle: fontInter(12, fontWeight: FontWeight.w500)),
          )),
        ],
      ),
    );
  }
}

///
/// Nhóm chat
/// Role Giảng viên
///
class _ChatGroupView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Text(
          'Chat',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: fontInter(16,
              color: AppColor.labelColor, fontWeight: FontWeight.w600),
        ),
      ),
      SizedBox(
        height: 8,
      ),
      GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 165 / 40,
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15),
        itemBuilder: (context, index) {
          if (index == 5) {
            return ItemAddNewChatGroupView(
              onPressed: () {},
            );
          }
          return ItemChatGroupView(
            groupName: "Nhóm ${index + 1}",
            onPressed: () {},
          );
        },
        itemCount: 6,
      )
    ]);
  }
}

///
/// Quản trị
/// Role: Sinh viên
///
class _AdminListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 12),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (c, index) {
        return ItemAdminView(
          isTeacher: true,
          name: 'PGS. TS. Nguyễn An Thịnh',
          title: 'Giảng viên:',
          onPressed: () {},
          onChatPressed: () {},
        );
      },
      itemCount: 2,
    );
  }
}

///
/// DS Sinh viên: Chung
///
class _StudentListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (c, index) {
        return StudentGroupView(
          groupName: 'Nhóm ${index + 1}',
        );
      },
      itemCount: 4,
    );
  }
}
