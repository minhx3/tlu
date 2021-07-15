import 'package:get/get.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/base/app_controller.dart';
import 'package:thanglong_university/app/modules/index/model/tab_item.dart';

class IndexController extends AppController {
  //TODO: Implement IndexController

  final rxTabIndex = 3.obs;
  List<TabItem> tabsList;
  List<String> sideMenuList = [];
  final rxSideBarIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();

    tabsList = [
      TabItem(TabImages.tabHome, TabImages.tabHomeS),
      TabItem(TabImages.tabSchedule, TabImages.tabScheduleS),
      TabItem(TabImages.tabEducation, TabImages.tabEducationS),
      TabItem(TabImages.tabConversation, TabImages.tabConversationS),
      TabItem(TabImages.tabHome, TabImages.tabHomeS),
    ];

    sideMenuList = [
      "Home",
      "Thời khóa biểu",
      "Đào tạo",
      "Tin tức và sự kiện",
      "Thiết lập"
    ];
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void setTab(int index) => rxTabIndex(index);
  setSideBar(int index) => rxSideBarIndex(index);
}
