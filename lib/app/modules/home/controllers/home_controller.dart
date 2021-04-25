import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/modules/home/model/menu_item.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  final rxCardIndex = 0.obs;
  SwiperController swiperController = SwiperController();
  final rxMenuList = RxList<MenuHomeItem>();
  @override
  void onInit() {
    super.onInit();

    rxMenuList.addAll([
      MenuHomeItem(Images.menuGroup, "Nhóm lớp"),
      MenuHomeItem(Images.menuSchedule, "Lịch thi"),
      MenuHomeItem(Images.menuFacebook, "Fanpage"),
      MenuHomeItem(Images.menuSettings, "Cài đặt")
    ]);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void setCard(int index) => rxCardIndex(index);
}
