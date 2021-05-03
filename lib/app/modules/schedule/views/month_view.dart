import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/modules/schedule/views/week_time_view.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MonthView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 40,
          child: WeekTimeView(
            timeViewType: TimeViewType.month,
          ),
        ),
        Container(
          height: 331,
          margin: EdgeInsets.symmetric(vertical: 12),
          child: SfCalendar(
            view: CalendarView.month,
            headerHeight: 0,
            viewHeaderHeight: 40,
            viewHeaderStyle: ViewHeaderStyle(
                dayTextStyle: fontInter(16,
                    fontWeight: FontWeight.w600, color: AppColor.subTextColor),
                dateTextStyle: TextStyle(color: Colors.grey, fontSize: 25)),
            selectionDecoration: BoxDecoration(),
            scheduleViewSettings: ScheduleViewSettings(
                weekHeaderSettings:
                    WeekHeaderSettings(backgroundColor: AppColor.errorColor)),
            monthCellBuilder:
                (BuildContext buildContext, MonthCellDetails details) {
              print(
                details.date.day.toString(),
              );
              return Container(
                alignment: Alignment.center,
                child: Text(
                  details.date.day.toString(),
                  style: fontInter(14,
                      fontWeight: FontWeight.w600,
                      color: AppColor.appBarDarkBackground),
                ),
              );
            },
          ),
          decoration: BoxDecoration(
              color: AppColor.whiteColor,
              borderRadius: BorderRadius.circular(5)),
        ),
      ],
    );
  }
}
