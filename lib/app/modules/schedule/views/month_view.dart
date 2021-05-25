import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:thanglong_university/app/modules/schedule/controllers/schedule_controller.dart';

import '../../../configuration/constant/global.dart';

class MonthView extends GetView<ScheduleController> {
  final double height;
  final Color backgroundColor;
  final bool showLine;
  MonthView(
      {this.height = 331,
      this.backgroundColor = AppColor.cf2f2f2,
      this.showLine = true});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: height,
          child: SfCalendar(
            view: CalendarView.month,
            monthViewSettings: MonthViewSettings(
              dayFormat: 'EEE',
              navigationDirection: MonthNavigationDirection.horizontal,
            ),
            headerHeight: 0,
            controller: controller.calendarController,
            viewHeaderHeight: 40,
            viewHeaderStyle: ViewHeaderStyle(
                dayTextStyle: fontInter(12,
                    fontWeight: FontWeight.w600, color: AppColor.cb3b3b3),
                dateTextStyle: TextStyle(color: Colors.red, fontSize: 25)),
            firstDayOfWeek: 1,
            todayHighlightColor: Colors.red,
            onTap: (details) {
              int checkDay = details.date.day;
              controller.setCurrentDay(checkDay);
              controller.calendarController.selectedDate = details.date;
            },
            monthCellBuilder:
                (BuildContext buildContext, MonthCellDetails details) {
              int currentMonth = DateTime.now().month;
              int currentYear = DateTime.now().year;

              int checkMonth = details.date.month;
              bool isSunday = details.date.weekday == 7;

              int checkYear = details.date.year;
              bool isDayInMonth =
                  (currentMonth == checkMonth && currentYear == checkYear);

              bool isHasEvent = false;
              bool isSelected = controller.currentDay() == details.date.day &&
                  currentMonth == checkMonth;
              return viewItem(
                  isSelected, details, isDayInMonth, isSunday, isHasEvent);
            },
          ),
        ),
        showLine == true
            ? Container(
                height: 1,
                margin: EdgeInsets.symmetric(vertical: 10),
                color: AppColor.ce9e9e9,
              )
            : SizedBox()
      ],
    );
  }

  Widget viewItem(bool isSelected, MonthCellDetails details, bool isDayInMonth,
      bool isSunday, bool isHasEvent) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color:
                  isSelected == true ? AppColor.c000333 : Colors.transparent),
          child: Text(
            details.date.day.toString(),
            style: fontInter(14,
                fontWeight: FontWeight.w600,
                color: isDayInMonth == true
                    ? isSunday
                        ? isSelected == true
                            ? AppColor.whiteColor
                            : AppColor.cdc3649
                        : isSelected == true
                            ? AppColor.whiteColor
                            : AppColor.c000333
                    : AppColor.cbfbfbf),
          ),
        ),
        Visibility(
          visible: isHasEvent,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 5,
              width: 5,
              margin: EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  color: AppColor.cfc7171),
            ),
          ),
        )
      ],
    );
  }
}
