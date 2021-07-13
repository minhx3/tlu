import 'package:flutter/material.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';
import 'package:thanglong_university/app/model/register_subject_entity.dart';
import 'package:thanglong_university/app/routes/app_pages.dart';

class SubjectItemView extends StatefulWidget {
  final double space;
  final RegisterSubjectEntity subject;

  SubjectItemView({this.space = 5, this.subject});

  @override
  _SubjectItemViewState createState() => _SubjectItemViewState();
}

class _SubjectItemViewState extends State<SubjectItemView> {
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      margin: EdgeInsets.only(top: 5),
      decoration: boxShadow
          .copyWith(borderRadius: BorderRadius.circular(5), boxShadow: []),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                visible = !visible;
              });
            },
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                      color: AppColor.cfc7171,
                      borderRadius: BorderRadius.circular(5)),
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                  alignment: Alignment.center,
                  child: Text(
                    widget.subject?.subjectId?.id ?? '',
                    style: fontInter(10,
                        fontWeight: FontWeight.w600,
                        color: AppColor.whiteColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(
                  child: Text(
                    widget.subject?.subjectId?.name ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: fontInter(16,
                        fontWeight: FontWeight.w600, color: AppColor.c000333),
                  ),
                ),
              ],
            ),
          ),
          Visibility(
            visible: visible,
            child: InkWell(
              onTap: () {
                pushTo(Routes.DETAI_CLASS);
              },
              child: Column(
                children: [
                  Row(
                    children: [
                      item("Mã lớp:", widget.subject.id),
                      item("Số lượng",
                          "${widget.subject?.haveRegistered}/${widget.subject?.population}"),
                      item("Thời gian:", 'widget.subject?.'),
                      item(
                          "Địa điểm:",
                          widget.subject.listTimelineClass
                                  .map((e) => e.code)
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
                                  color: AppColor.c808080),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              widget.subject.listTeacher
                                  .map((e) => '${e.degree} ${e.fullName}')
                                  .join('\n'),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: fontInter(12,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.c000333),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {},
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
          ),
        ],
      ),
    );
  }

  Widget item(String title, String subTitle, {bool isLast = false}) {
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
                style: fontInter(11,
                    fontWeight: FontWeight.w500, color: AppColor.c808080),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                subTitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: fontInter(12,
                    fontWeight: FontWeight.w600, color: AppColor.c000333),
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
