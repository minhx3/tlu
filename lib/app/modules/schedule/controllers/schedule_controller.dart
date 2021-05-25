import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class ScheduleController extends GetxController {
  //TODO: Implement ScheduleController

  final tagIndex = 0.obs;
  final isFilter = false.obs;
  final currentDay = DateTime.now().day.obs;
  CalendarController calendarController = CalendarController();
  @override
  void onInit() {
    super.onInit();
    calendarController.selectedDate = DateTime.now();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  setTag(int index) => tagIndex(index);
  switchFilter() => isFilter(!isFilter());
  setCurrentDay(int value) => currentDay(value);
}
