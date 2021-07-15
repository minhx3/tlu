import 'package:get/get.dart';
import 'package:thanglong_university/app/modules/auth/bindings/auth_binding.dart';
import 'package:thanglong_university/app/modules/auth/views/auth_view.dart';
import 'package:thanglong_university/app/modules/auth/views/web/forgot_web_page.dart';
import 'package:thanglong_university/app/modules/chat_detail/bindings/chat_detail_binding.dart';
import 'package:thanglong_university/app/modules/chat_detail/views/chat_detail_view.dart';
import 'package:thanglong_university/app/modules/chat_group_info/bindings/chat_group_info_binding.dart';
import 'package:thanglong_university/app/modules/chat_group_info/views/chat_group_info_view.dart';
import 'package:thanglong_university/app/modules/detail_class/bindings/detai_class_binding.dart';
import 'package:thanglong_university/app/modules/detail_class/views/detai_class_view.dart';
import 'package:thanglong_university/app/modules/detail_new/bindings/detail_new_binding.dart';
import 'package:thanglong_university/app/modules/detail_new/views/detail_new_view.dart';
import 'package:thanglong_university/app/modules/education/bindings/education_binding.dart';
import 'package:thanglong_university/app/modules/education/views/education_view.dart';
import 'package:thanglong_university/app/modules/home/bindings/home_binding.dart';
import 'package:thanglong_university/app/modules/home/views/home_view.dart';
import 'package:thanglong_university/app/modules/index/bindings/index_binding.dart';
import 'package:thanglong_university/app/modules/index/views/index_view.dart';
import 'package:thanglong_university/app/modules/notification/bindings/notification_binding.dart';
import 'package:thanglong_university/app/modules/notification/views/notification_view.dart';
import 'package:thanglong_university/app/modules/profile/bindings/profile_binding.dart';
import 'package:thanglong_university/app/modules/profile/views/profile_view.dart';
import 'package:thanglong_university/app/modules/resgister_subject_term/bindings/resgister_subject_term_binding.dart';
import 'package:thanglong_university/app/modules/resgister_subject_term/views/resgister_subject_term_view.dart';
import 'package:thanglong_university/app/modules/schedule/bindings/schedule_binding.dart';
import 'package:thanglong_university/app/modules/schedule/views/schedule_view.dart';
import 'package:thanglong_university/app/modules/subject_list_cart/bindings/subject_list_cart_binding.dart';
import 'package:thanglong_university/app/modules/subject_list_cart/views/subject_list_cart_view.dart';
import 'package:thanglong_university/app/modules/subject_list_term/bindings/subject_list_term_binding.dart';
import 'package:thanglong_university/app/modules/subject_list_term/views/subject_list_term_view.dart';
import 'package:thanglong_university/app/modules/task/bindings/task_binding.dart';
import 'package:thanglong_university/app/modules/task/views/task_view.dart';
import 'package:thanglong_university/app/modules/test_schedule/bindings/test_schedule_binding.dart';
import 'package:thanglong_university/app/modules/test_schedule/views/test_schedule_view.dart';
import 'package:thanglong_university/app/modules/transcript/bindings/transcript_binding.dart';
import 'package:thanglong_university/app/modules/transcript/views/transcript_view.dart';
import 'package:thanglong_university/app/modules/user_info/bindings/user_info_binding.dart';
import 'package:thanglong_university/app/modules/user_info/views/user_info_view.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.AUTH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.AUTH_FORGOT,
      page: () => ForgotWebPage(),
      binding: AuthBinding(),
    ),
    GetPage(
        name: _Paths.INDEX,
        page: () => IndexView(),
        binding: IndexBinding(),
        transition: Transition.noTransition),
    GetPage(
      name: _Paths.DETAIL_NEW,
      page: () => DetailNewView(),
      binding: DetailNewBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION,
      page: () => NotificationView(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: _Paths.TASK,
      page: () => TaskView(),
      binding: TaskBinding(),
    ),
    GetPage(
      name: _Paths.EDUCATION,
      page: () => EducationView(),
      binding: EducationBinding(),
    ),
    GetPage(
      name: _Paths.TRANSCRIPT,
      page: () => TranscriptView(),
      binding: TranscriptBinding(),
    ),
    GetPage(
      name: _Paths.TEST_SCHEDULE,
      page: () => TestScheduleView(),
      binding: TestScheduleBinding(),
    ),
    GetPage(
      name: _Paths.DETAI_CLASS,
      page: () => DetaiClassView(),
      binding: DetaiClassBinding(),
    ),
    GetPage(
      name: _Paths.SCHEDULE,
      page: () => ScheduleView(),
      binding: ScheduleBinding(),
    ),
    GetPage(
        name: _Paths.CHAT_DETAIL,
        page: () => ChatDetailView(),
        binding: ChatDetailBinding(),
        maintainState: true),
    GetPage(
      name: _Paths.CHAT_GROUP_INFO,
      page: () => ChatGroupInfoView(),
      binding: ChatGroupInfoBinding(),
    ),
    GetPage(
      name: _Paths.USER_INFO,
      page: () => UserInfoView(),
      binding: UserInfoBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.RESGISTER_SUBJECT_TERM,
      page: () => ResgisterSubjectTermView(),
      binding: ResgisterSubjectTermBinding(),
    ),
    GetPage(
      name: _Paths.SUBJECT_LIST_TERM,
      page: () => SubjectListTermView(),
      binding: SubjectListTermBinding(),
    ),
    GetPage(
      name: _Paths.SUBJECT_LIST_CART,
      page: () => SubjectListCartView(),
      binding: SubjectListCartBinding(),
    ),
  ];
}
