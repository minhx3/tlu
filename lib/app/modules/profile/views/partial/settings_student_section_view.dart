import 'package:flutter/material.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/modules/profile/views/partial/settings/item_setting_base_view.dart';
import 'package:thanglong_university/app/modules/profile/views/partial/settings/item_setting_checkbox_view.dart';
import 'package:thanglong_university/app/modules/profile/views/partial/settings/item_setting_expandable_view.dart';
import 'package:thanglong_university/app/modules/profile/views/partial/settings/item_setting_navigate_view.dart';
import 'package:thanglong_university/app/modules/profile/views/partial/settings/item_setting_switch_view.dart';
import 'package:thanglong_university/app/views/views/expandable_section_view.dart';

class SettingsStudentSectionView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.blockEducationBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 30, top: 12, bottom: 8),
            child: Text('Cài đặt',
                style: fontInter(
                  14,
                  fontWeight: FontWeight.w600,
                  color: AppColor.textColor,
                )),
          ),
          _SettingsItemListView(),
        ],
      ),
    );
  }
}

class _SettingsItemListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      children: [
        _ItemDarkModeSettingView(),
        _PushingNotificationView(),
        ItemSettingNavigateView(
          title: 'Câu hỏi thường gặp',
          onPressed: () {},
        ),
        ItemSettingNavigateView(
          title: 'Trợ giúp',
          onPressed: () {},
        ),
        _ItemLogoutSettingView()
      ],
    );
  }
}

class _PushingNotificationView extends StatefulWidget {
  @override
  _PushingNotificationViewState createState() =>
      _PushingNotificationViewState();
}

class _PushingNotificationViewState extends State<_PushingNotificationView> {
  bool _isExpand = false;

  @override
  Widget build(BuildContext context) {
    return ExpandableSectionView(
      expand: _isExpand,
      header: ItemSettingExpandableView(
        title: 'Bật thông báo đẩy',
        isExpanded: _isExpand,
        onPressed: () {
          setState(() {
            _isExpand = !_isExpand;
          });
        },
      ),
      child: ListView(
        padding: const EdgeInsets.only(left: 8),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          _ItemSettingsCheckBoxView(
            title: "Quản lý lịch",
          ),
          _ItemSettingsCheckBoxView(
            title: "Đăng kí học",
            isChecked: false,
          ),
          _ItemSettingsCheckBoxView(
            title: "Liên lạc",
          ),
          _ItemSettingsCheckBoxView(
            title: "Đào tạo",
            isChecked: false,
          ),
          _ItemSettingsCheckBoxView(
            title: "Hỗ trợ",
          ),
          _ItemSettingsCheckBoxView(
            title: "Khác",
            isChecked: false,
          ),
        ],
      ),
    );
  }
}

class _ItemDarkModeSettingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ItemSettingsSwitchView(
          title: 'Dark mode',
          isChecked: false,
        ),
        Divider(
          thickness: 1,
          indent: 15,
          endIndent: 15,
          height: 5,
          color: AppColor.lineColor,
        )
      ],
    );
  }
}

class _ItemLogoutSettingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ItemSettingBaseView(
      onPressed: () {},
      title: 'Đăng xuất',
      trailingChild: Image.asset(
        Images.icLogout,
        width: 20,
        height: 20,
      ),
    );
  }
}

class _ItemSettingsCheckBoxView extends StatelessWidget {
  final String title;
  final bool isChecked;
  final VoidCallback onPressed;

  const _ItemSettingsCheckBoxView(
      {Key key, @required this.title, this.isChecked = true, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ItemSettingsCheckBoxView(
          title: title,
          isChecked: isChecked,
          onPressed: onPressed,
          fontSizeTitle: 12,
          fontWeightTitle: FontWeight.w600,
          colorTitle: AppColor.labelColor,
        ),
        Divider(
          thickness: 1,
          indent: 15,
          endIndent: 15,
          height: 5,
          color: AppColor.lineColor,
        )
      ],
    );
  }
}
