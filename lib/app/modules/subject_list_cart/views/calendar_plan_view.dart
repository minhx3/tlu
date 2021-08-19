import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/model/register_subject_entity.dart';

final double rowheight = 26;
final double leftSpace = 45;

// ignore: must_be_immutable
class CalendarPlanView extends StatelessWidget {
  final List<RegisterSubjectEntity> listSubjectClass;

  CalendarPlanView({Key key, this.listSubjectClass}) : super(key: key);

  List<Map<String, int>> getListSchedule() {
    List<Map<String, int>> listSchedule = [];
    int _index = 1;
    for (var subjectClass in listSubjectClass) {
      subjectClass.listTimelineClass.forEach((timeline) {
        timeline.listSchedule.forEach((schedule) {
          schedule.listSession.forEach((session) {
            listSchedule.add({
              "title": _index,
              "dayOfWeek": schedule.dayOfWeek,
              "hour": session.startTime.hours,
              "timeRange": session.endTime.hours - session.startTime.hours,
            });
          });
        });
      });
      _index++;
    }
    return listSchedule;
  }

  @override
  Widget build(BuildContext context) {
    getListSchedule();
    return Column(children: [
      Container(
        margin: EdgeInsets.only(bottom: 5),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: AppColor.cb3b4c2, width: 1.5))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: leftSpace,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                child: Text(
                  "Ngày",
                  style: fontInter(12).copyWith(
                      color: AppColor.cb3b4c2, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            ...["T2", "T3", "T4", "T5", "T6", "T7", "CN"]
                .map((e) => Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Text(e,
                          textAlign: TextAlign.center,
                          style: fontInter(12).copyWith(
                              color: AppColor.cb3b4c2,
                              fontWeight: FontWeight.w600)),
                    )))
                .toList(),
          ],
        ),
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: List.generate(
              15,
              (e) => SizedBox(
                width: leftSpace,
                height: rowheight,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Text("${(e + 7).toString()}h",
                      textAlign: TextAlign.center,
                      style: fontInter(11).copyWith(
                          color: AppColor.cfdaaaa,
                          fontWeight: FontWeight.w600)),
                ),
              ),
            ),
          ),
          Expanded(
            child: LayoutBuilder(builder: (context, constraints) {
              double widthItem = constraints.biggest.width / 7;
              return Stack(
                children: [
                  tableCalendar(),
                  ...getListSchedule()
                      .map((item) => scheduleItem(item['title'].toString(),
                          width: widthItem,
                          height: rowheight,
                          dayOfWeek: item['dayOfWeek'],
                          timeRange: item['timeRange'],
                          hour: item['hour']))
                      .toList(),
                ],
              );
            }),
          )
        ],
      ),
    ]);
  }

  Table tableCalendar() => Table(
        children: [
          ...List.generate(
            30,
            (rowIndex) => TableRow(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: rowIndex % 2 == 0
                        ? AppColor.cf2f2f2
                        : Colors.transparent,
                    width: 1,
                  ),
                ),
              ),
              children: List.generate(
                14,
                (colIndex) => TableCell(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          color: colIndex % 2 == 0
                              ? AppColor.cf2f2f2
                              : Colors.transparent,
                          width: 1,
                        ),
                      ),
                    ),
                    child: SizedBox(
                      height: rowheight / 2,
                      child: SizedBox(),
                    ),
                  ),
                ),
              ),
            ),
          ),
          //
        ],
      );

  Widget scheduleItem(String title,
      {@required double width,
      @required double height,
      @required int dayOfWeek,
      @required int hour,
      int timeRange = 1}) {
    return Positioned(
      top: (hour - 7) * height + (rowheight / 2),
      left: ((dayOfWeek - 1) * width).toDouble(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 12,
                spreadRadius: 2,
                color: Colors.black.withOpacity(0.05),
              ),
            ],
            gradient: new LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment(0, 0),
                stops: [0.1, 0.1],
                colors: [AppColor.c000333, Colors.white]),
            borderRadius: BorderRadius.circular(3),
          ),
          width: width - 4,
          height: timeRange * rowheight - 6,
          child: Center(
              child: Text(
            title,
            style: fontInter(14,
                fontWeight: FontWeight.w600, color: AppColor.c000333),
          )),
        ),
      ),
    );
  }
}
