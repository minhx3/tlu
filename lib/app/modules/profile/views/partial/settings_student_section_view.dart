import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';
import 'package:thanglong_university/app/enums/notification_type_enum.dart';
import 'package:thanglong_university/app/model/user_setting_model.dart';
import 'package:thanglong_university/app/modules/profile/controllers/profile_controller.dart';
import 'package:thanglong_university/app/modules/profile/views/partial/settings/item_setting_base_view.dart';
import 'package:thanglong_university/app/modules/profile/views/partial/settings/item_setting_checkbox_view.dart';
import 'package:thanglong_university/app/modules/profile/views/partial/settings/item_setting_expandable_view.dart';
import 'package:thanglong_university/app/modules/profile/views/partial/settings/item_setting_navigate_view.dart';
import 'package:thanglong_university/app/modules/profile/views/partial/settings/item_setting_switch_view.dart';
import 'package:thanglong_university/app/routes/app_pages.dart';
import 'package:thanglong_university/app/views/views/expandable_section_view.dart';

// ignore: must_be_immutable
class SettingsProfileSectionView extends StatelessWidget {
  UserSetting userSettings;
  SettingsProfileSectionView({this.userSettings});
  final ProfileController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.cf2f2f2,
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 30, top: 17, bottom: 8),
            child: Text('Cài đặt',
                style: fontInter(
                  14,
                  fontWeight: FontWeight.w600,
                  color: AppColor.textColor,
                )),
          ),
          settingsItemListView(),
        ],
      ),
    );
  }

  Widget settingsItemListView() {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      children: [
        itemDarkModeSettingView(),
        lineBreak(),
        _PushingNotificationView(),
        lineBreak(),
        ItemSettingNavigateView(
          colorTitle: AppColor.c4d4d4d,
          title: 'Câu hỏi thường gặp',
          trailingWidth: 20,
          trailingHeight: 20,
          trailingColor: AppColor.cd9d9d9,
          onPressed: () {},
        ),
        lineBreak(),
        ItemSettingNavigateView(
          colorTitle: AppColor.c4d4d4d,
          trailingWidth: 20,
          trailingHeight: 20,
          trailingColor: AppColor.cd9d9d9,
          title: 'Trợ giúp',
          onPressed: () {},
        ),
        lineBreak(),
        ItemSettingBaseView(
          onPressed: () {
            pushReplaceAllTo(Routes.AUTH);
          },
          colorTitle: AppColor.c4d4d4d,
          title: 'Đăng xuất',
          trailingChild: Image.asset(
            Images.icLogout,
            width: 20,
            height: 20,
          ),
        ),
      ],
    );
  }

  Widget lineBreak() {
    return Divider(
      thickness: 1,
      indent: 15,
      endIndent: 15,
      height: 5,
      color: AppColor.lineColor,
    );
  }

  Widget itemDarkModeSettingView() {
    return ItemSettingsSwitchView(
      fontSizeTitle: 13,
      colorTitle: AppColor.c4d4d4d,
      title: 'Dark mode',
      isChecked: userSettings?.darkMode,
      onChanged: (value) {
        // print(value);
        controller.changeDarkModeSetting();
      },
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
  final ProfileController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return ExpandableSectionView(
      expand: _isExpand,
      header: ItemSettingExpandableView(
        colorTitle: AppColor.c4d4d4d,
        trailingWidth: 20,
        trailingHeight: 10,
        trailingColor: AppColor.cd9d9d9,
        title: 'Bật thông báo đẩy',
        fontSizeTitle: 13,
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
          ...notificationTypeSwitch.map.entries
              .map((e) => ItemSettingsCheckBoxView(
                    fontSizeTitle: 12,
                    fontWeightTitle: FontWeight.w600,
                    colorTitle: AppColor.c8c8c8c,
                    title: e.key,
                    isChecked:
                        controller.rxUserSetting()?.notificationSetting == null
                            ? false
                            : controller
                                    .rxUserSetting()
                                    .notificationSetting
                                    .firstWhere(
                                        (element) =>
                                            element.type ==
                                            notificationTypeValues
                                                .reverse[e.value],
                                        orElse: () => null)
                                    ?.enable ??
                                false,
                    onChanged: () {
                      controller.changeNotificationSetting(e.value);
                    },
                  ))
              .toList(),
        ],
      ),
    );
  }
}
