import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/base/app_controller.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';
import 'package:thanglong_university/app/model/alert_model.dart';
import 'package:thanglong_university/app/model/calendar_model.dart';
import 'package:thanglong_university/app/model/news_model.dart';
import 'package:thanglong_university/app/model/subject_model.dart';
import 'package:thanglong_university/app/modules/home/model/menu_item.dart';
import 'package:thanglong_university/app/service/api/app_client.dart';
import 'package:thanglong_university/app/utils/otp_countdown.dart';

class HomeController extends AppController {
  //TODO: Implement HomeController

  final count = 0.obs;
  final rxCardIndex = 0.obs;
  SwiperController swiperController = SwiperController();
  final rxMenuList = RxList<MenuHomeItem>();
  final rxCalendarList = RxList<CalendarModel>();
  final rxNewsList = RxList<NewsModel>();
  final rxAlert = Rx<AlertModel>();

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
    final result = await Appclient.shared.getCalendarList();
    rxCalendarList(result ?? []);
  }

  getNewsList() async {
    final result = await Appclient.shared.getNews();
    rxNewsList(result ?? []);
    hideLoading();
  }

  getAlertRegister() async {
    final result = await Appclient.shared.getAlertRegister();
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
