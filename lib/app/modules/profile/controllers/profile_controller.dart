import 'package:get/get.dart';
import 'package:thanglong_university/app/configuration/base/app_controller.dart';
import 'package:thanglong_university/app/enums/notification_type_enum.dart';
import 'package:thanglong_university/app/model/user_info_model.dart';
import 'package:thanglong_university/app/model/user_setting_model.dart';
import 'package:thanglong_university/app/service/api/app_client.dart';

class ProfileController extends AppController {
  final count = 0.obs;
  final rxUserInfo = Rx<UserInfo>();
  final rxUserSetting = Rx<UserSetting>();

  static ProfileController get to => Get.find();

  String get myUserId => rxUserInfo().id;

  @override
  void onInit() {
    super.onInit();
    getUserInfo();
    getUserSettings();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => count.value++;

  getUserInfo() async {
    showLoading();
    final result = await Appclient.shared.getUserInfo();
    if (result != null) {
      1.delay(() {
        hideLoading();
        rxUserInfo(result);
      });
    }
  }

  getUserSettings() async {
    showLoading();
    final result = await Appclient.shared
        .getUserSettings()
        .whenComplete(() => hideLoading());
    if (result != null) {
      rxUserSetting(result);
    }
  }

  changeDarkModeSetting() async {
    rxUserSetting.value.darkMode = !rxUserSetting.value.darkMode;
    changeSettings(rxUserSetting.value);
  }

  changeNotificationSetting(NotificationTypeEnum type) async {
    int _indexItem = rxUserSetting.value.notificationSetting.indexWhere(
        (element) => notificationTypeValues.reverse[type] == element.type);
    if (_indexItem < 0) return;
    rxUserSetting.value.notificationSetting[_indexItem].enable =
        !rxUserSetting.value.notificationSetting[_indexItem].enable;
    changeSettings(rxUserSetting.value);
  }

  changeSettings(UserSetting settings) async {
    showLoading();
    await Appclient.shared
        .changeUserSettings(data: settings.toJson())
        .then((response) {
      if (response != null) rxUserSetting.refresh();
      return response;
    }).whenComplete(() {
      hideLoading();
    });
  }
}
