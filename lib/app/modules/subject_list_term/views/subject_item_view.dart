import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';
import 'package:thanglong_university/app/model/register_subject_entity.dart';
import 'package:thanglong_university/app/modules/subject_list_term/controllers/subject_list_term_controller.dart';
import 'package:thanglong_university/app/routes/app_pages.dart';

class SubjectItemView extends StatelessWidget {
  final RegisterSubjectEntity subject;

  SubjectItemView({this.subject});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1, color: AppColor.ce6e6e6))),
      child: Theme(
        data: ThemeData().copyWith(
            dividerColor: Colors.transparent,
            iconTheme: IconThemeData(size: 30, color: Colors.blue)),
        child: ListTileTheme(
          horizontalTitleGap: 0,
          child: ExpansionTile(
            tilePadding: EdgeInsets.symmetric(horizontal: 5),
            title: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                      color: AppColor.cfc7171,
                      borderRadius: BorderRadius.circular(5)),
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                  alignment: Alignment.center,
                  child: Text(
                    subject?.subjectId?.id ?? '',
                    style: fontInter(10,
                        fontWeight: FontWeight.w600,
                        color: AppColor.whiteColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(
                  child: Text(
                    subject?.subjectId?.name ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: fontInter(14,
                        fontWeight: FontWeight.w600, color: AppColor.c000333),
                  ),
                ),
              ],
            ),
            children: [
              Container(
                child: Column(children: [...itemTimeLine()]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> itemTimeLine() {
    return (subject?.listTimelineClass ?? []).map((timeLineClass) {
      return InkWell(
        onTap: () {
          pushTo(Routes.DETAI_CLASS);
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 10),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          decoration: boxShadow.copyWith(
              borderRadius: BorderRadius.circular(3), color: Colors.white),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subject?.name ?? "",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: fontInter(16,
                    fontWeight: FontWeight.w600, color: AppColor.c33355a),
              ),
              Row(
                children: [
                  itemColTimeLine("Lớp:", subject.id),
                  itemColTimeLine("Số lượng",
                      "${subject?.haveRegistered}/${subject?.population}"),
                  itemColTimeLine("Thời gian:", timeLineClass.getAllTime,
                      toolTip: timeLineClass.getAllTimeToolTip),
                  itemColTimeLine(
                      "Địa điểm:",
                      timeLineClass.listSchedule
                              .map((e) => e.address ?? "")
                              .join('\n') ??
                          '',
                      isLast: true),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: 1,
                color: AppColor.cbfbfbf,
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Giáo viên:",
                          style: fontInter(11,
                              fontWeight: FontWeight.w500,
                              color: AppColor.c84869C),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 2),
                        Text(
                          subject.listTeacher
                              .map((e) => '${e.degree} ${e.fullName}')
                              .join('\n'),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: fontInter(12,
                              fontWeight: FontWeight.w600,
                              color: AppColor.c595C82),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      SubjectListTermController controller = Get.find();
                      controller.postRegisterSubject(subject.id);
                    },
                    child: Image.asset(
                      Images.addButtonIcon,
                      height: 36,
                      width: 36,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
    }).toList();
  }

  Widget itemColTimeLine(String title, String subTitle,
      {String toolTip, bool isLast = false}) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                softWrap: true,
                style: fontInter(11,
                    fontWeight: FontWeight.w500, color: AppColor.c84869C),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 2),
              toolTip == null
                  ? Text(
                      subTitle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: fontInter(12,
                          fontWeight: FontWeight.w600, color: AppColor.c000333),
                    )
                  : Tooltip(
                      message: toolTip,
                      child: Text(
                        subTitle,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: fontInter(12,
                            fontWeight: FontWeight.w600,
                            color: AppColor.c000333),
                      ),
                    ),
            ],
          ),
          isLast == true
              ? SizedBox()
              : Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  width: 1,
                  height: 35,
                  color: AppColor.lineColor,
                ),
        ],
      ),
    );
  }
}
