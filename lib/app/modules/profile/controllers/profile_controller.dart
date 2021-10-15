import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
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

  // ignore: missing_return
  Future<PickedFile> pickFile(
      {ImageSource source = ImageSource.gallery,
      double maxWidth = 600,
      double maxHeight = 600,
      int quality = 70}) async {
    try {
      final ImagePicker _picker = ImagePicker();
      if (source == ImageSource.camera) {
        return _picker.getImage(source: source);
      } else {
        return _picker.getImage(
          source: source,
          maxWidth: maxWidth,
          maxHeight: maxHeight,
          imageQuality: quality,
        );
      }
    } catch (e) {
      print(e);
    }
  }

  sendImg(source) async {
    try {
      // ignore: unused_local_variable
      PickedFile file = await pickFile(source: source);
    } on Exception catch (e) {
      print(e);
    }
  }

  sendFile() async {
    try {
      FilePickerResult file = await FilePicker.platform.pickFiles();
      if (file != null) {
      } else {
        // User canceled the picker
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
