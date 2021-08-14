import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/modules/schedule/controllers/schedule_controller.dart';
import 'package:thanglong_university/app/views/views/calendar/flutter_calendar.dart';

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
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            child: Calendar(
          isExpandable: true,
          showHeaderControl: false,
          showExpandControl: false,
          calendarController: controller.calendarController,
          weekDays: [
            "Th 2",
            "Th 3",
            "Th 4",
            "Th 5",
            "Th 6",
            "Th 7",
            "CN",
          ],
          dayBuilder: (c, date) {
            int currentMonth = controller.currentDate.month;
            int currentYear = controller.currentDate.year;

            int checkMonth = date.month;
            bool isSunday = date.weekday == 7;

            int checkYear = date.year;
            bool isDayInMonth =
                (currentMonth == checkMonth && currentYear == checkYear);

            bool isHasEvent =
                controller.listDateIsEvent.contains(date.day.toString()) &&
                    currentMonth == checkMonth;
            print('currentDayX' + controller.currentDayX().toString());
            bool isSelected = controller.currentDayX() == date.day &&
                currentMonth == checkMonth;
            return viewItem(controller, isSelected, date, isDayInMonth,
                isSunday, isHasEvent);
          },
          onDateSelected: (date) {
            print('date' + date.toString());
            print('day' + date.day.toString());
            controller.setCurrentDay(date.day);
          },
          onSelectedRangeChange: (range) =>
              print("Range is ${range.item1}, ${range.item2}"),
          // onDateSelected: (date) => hxandleNewDate(date),
        )),
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

  Widget viewItem(ScheduleController controller, bool isSelected, DateTime date,
      bool isDayInMonth, bool isSunday, bool isHasEvent) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              color:
                  isSelected == true ? AppColor.c000333 : Colors.transparent),
          child: Text(
            date.day.toString(),
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
