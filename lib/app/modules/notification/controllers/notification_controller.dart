import 'package:get/get.dart';
import 'package:thanglong_university/app/configuration/base/app_controller.dart';
import 'package:thanglong_university/app/enums/notification_status_enum.dart';
import 'package:thanglong_university/app/enums/notification_type_enum.dart';
import 'package:thanglong_university/app/model/notification_model.dart';
import 'package:thanglong_university/app/service/api/app_client.dart';

class NotificationController extends AppController {
  final RxList<NotificationModel> rxNotifications =
      new RxList<NotificationModel>();

  @override
  void onInit() {
    super.onInit();
    getNotificationList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  getNotificationList() async {
    showLoading();
    List<NotificationModel> notifications = await Appclient.shared
        .getNotificationList(NotificationTypeEnum.ALL)
        .whenComplete(() => hideLoading());
    rxNotifications(notifications);
  }

  readAll() async {
    bool request = await Appclient.shared.readAllNotification();
    if (!request) return;
    for (var i = 0; i < rxNotifications.length; i++) {
      rxNotifications[i].status = NotificationStatusEnum.READ;
    }
    rxNotifications.refresh();
  }

  readOne(String id) async {
    bool request = await Appclient.shared.readOneNotification(id);
    if (!request) return;
    int _index = rxNotifications().indexWhere((element) => element.id == id);
    if (_index < 0) return;
    rxNotifications[_index].status = NotificationStatusEnum.READ;
    rxNotifications.refresh();
  }
}
