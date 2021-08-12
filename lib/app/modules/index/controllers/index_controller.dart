import 'package:get/get.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/base/app_controller.dart';
import 'package:thanglong_university/app/modules/index/model/tab_item.dart';
import 'package:thanglong_university/app/routes/app_pages.dart';

class IndexController extends AppController {
  final rxTabIndex = 0.obs;
  List<TabItem> tabsList;
  List<String> sideMenuList = [];
  List<String> sideMenuRoute = [];
  final rxSideBarIndex = 0.obs;
  @override
  void onInit() {
    super.onInit();

    tabsList = [
      TabItem(TabImages.tabHome, TabImages.tabHomeS),
      TabItem(TabImages.tabSchedule, TabImages.tabScheduleS),
      TabItem(TabImages.tabEducation, TabImages.tabEducationS),
      TabItem(TabImages.tabConversation, TabImages.tabConversationS),
      TabItem(TabImages.tabProfile, TabImages.tabProfileS),
    ];

    sideMenuList = ["Home", "Thời khóa biểu", "Đào tạo", "Chat", "Thiết lập"];

    sideMenuRoute = [
      Routes.INDEX,
      Routes.SCHEDULE,
      Routes.EDUCATION,
      Routes.CHAT_DETAIL,
      Routes.PROFILE,
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
