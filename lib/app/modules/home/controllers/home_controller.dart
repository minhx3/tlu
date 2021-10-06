import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/base/app_controller.dart';
import 'package:thanglong_university/app/model/news_model.dart';
import 'package:thanglong_university/app/model/register_entity.dart';
import 'package:thanglong_university/app/model/schedule_model.dart';
import 'package:thanglong_university/app/modules/home/model/menu_item.dart';
import 'package:thanglong_university/app/service/api/app_client.dart';

class HomeController extends AppController {
  final count = 0.obs;
  final rxCardIndex = 0.obs;
  final rxMenuList = RxList<MenuHomeItem>();
  final rxCalendarList = RxList<ScheduleModel>();
  final rxNewsList = RxList<NewsModel>();
  final rxAlert = Rx<RegisterEntity>();

  @override
  void onInit() {
    super.onInit();
    showLoading();
    getCalendarList();
    getAlertRegister();
    getNewsList();
    rxMenuList.addAll([
      MenuHomeItem(Images.menuGroup, "Nhóm lớp"),
      MenuHomeItem(Images.menuSchedule, "Lịch thi"),
      MenuHomeItem(Images.menuFacebook, "Fanpage"),
      MenuHomeItem(Images.menuSettings, "Cài đặt")
    ]);
  }

  getCalendarList() async {
    DateTime currentDate = DateTime.now();
    final dateFormat = DateFormat("yyyy-MM-dd");
    String fromDate = dateFormat.format(currentDate);
    String toDate = dateFormat.format(currentDate.add(const Duration(days: 7)));

    final result = await Appclient.shared
        .getScheduleList(fromDate: fromDate, toDate: toDate);

    rxCalendarList(result ?? []);
  }

  DateTime getFirstDateOfTheWeek(DateTime dateTime) {
    return dateTime.subtract(Duration(days: dateTime.weekday - 1));
  }

  DateTime getLastDateOfTheWeek(DateTime dateTime) {
    return dateTime
        .add(Duration(days: DateTime.daysPerWeek - dateTime.weekday));
  }

  getNewsList() async {
    final result = await Appclient.shared.getNews();
    rxNewsList(result ?? []);
  }

  getAlertRegister() async {
    final result = await Appclient.shared
        .getAlertRegister()
        .whenComplete(() => hideLoading());
    rxAlert(result);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void setCard(int index) => rxCardIndex(index);
}
