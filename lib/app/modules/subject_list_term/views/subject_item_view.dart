import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thanglong_university/Images/icon_svg.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';
import 'package:thanglong_university/app/enums/subject_class_status.dart';
import 'package:thanglong_university/app/model/register_subject_entity.dart';
import 'package:thanglong_university/app/modules/subject_list_cart/controllers/subject_list_cart_controller.dart';
import 'package:thanglong_university/app/modules/subject_list_term/controllers/subject_list_term_controller.dart';
import 'package:thanglong_university/app/routes/app_pages.dart';

class SubjectItemView extends StatefulWidget {
  final RegisterSubjectEntity subject;

  SubjectItemView({this.subject});

  @override
  _SubjectItemViewState createState() => _SubjectItemViewState();
}

class _SubjectItemViewState extends State<SubjectItemView>
    with SingleTickerProviderStateMixin {
  Animation<double> _iconTurns;
  AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(duration: Duration(milliseconds: 100), vsync: this);
    _iconTurns = _controller.drive(Tween<double>(begin: 0.0, end: 0.5)
        .chain(CurveTween(curve: Curves.easeIn)));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1, color: AppColor.ce6e6e6))),
      child: Theme(
        data: ThemeData().copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ListTileTheme(
          child: ExpansionTile(
            onExpansionChanged: (_isExpanded) {
              if (_isExpanded) {
                _controller.forward();
              } else {
                _controller.reverse();
              }
            },
            trailing: RotationTransition(
              child: IconSvg(size: 15).collapseDown,
              turns: _iconTurns,
            ),
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
                    widget.subject?.id ?? '',
                    style: fontInter(10,
                        fontWeight: FontWeight.w600,
                        color: AppColor.whiteColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Expanded(
                  child: Text(
                    widget.subject?.subject?.name ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: fontInter(14,
                        fontWeight: FontWeight.w600, color: AppColor.c000333),
                  ),
                ),
              ],
            ),
            children: [itemTimeLine()],
          ),
        ),
      ),
    );
  }

  Widget itemTimeLine() {
    return InkWell(
      onTap: () {
        pushTo(Routes.DETAI_CLASS,
            arguments: {"id": widget.subject.id, "data": widget.subject});
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
              widget.subject?.id ?? "",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: fontInter(16,
                  fontWeight: FontWeight.w600, color: AppColor.c33355a),
            ).marginOnly(bottom: 10),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  itemColTimeLine(
                      "L???p:",
                      (widget.subject?.listTimelineClass ?? [])
                          .map((timeLineClass) => timeLineClass.id)
                          .join("\n")),
                  VerticalDivider(
                    width: 30,
                    color: AppColor.lineColor,
                    thickness: 1,
                  ),
                  itemColTimeLine("S??? l?????ng",
                      "${widget.subject?.haveRegistered}/${widget.subject?.population}"),
                  VerticalDivider(
                    width: 30,
                    color: AppColor.lineColor,
                    thickness: 1,
                  ),
                  itemColTimeLine(
                      "Th???i gian:",
                      (widget.subject?.listTimelineClass ?? [])
                          .map((timeLineClass) => timeLineClass.getAllTime)
                          .join("\n"),
                      toolTip: (widget.subject?.listTimelineClass ?? [])
                          .map((timeLineClass) =>
                              timeLineClass.getAllTimeToolTip)
                          .join("\n")),
                  VerticalDivider(
                    width: 30,
                    color: AppColor.lineColor,
                    thickness: 1,
                  ),
                  itemColTimeLine(
                      "?????a ??i???m:",
                      (widget.subject?.listTimelineClass ?? [])
                          .map((timeLineClass) => timeLineClass.listSchedule
                              .map((e) => e.address ?? "")
                              .join(','))
                          .join('\n')),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 1,
              color: AppColor.lineColor,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Gi??o vi??n:",
                        style: fontInter(11,
                            fontWeight: FontWeight.w500,
                            color: AppColor.c84869C),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 2),
                      Text(
                        widget.subject.listTimelineClass
                            .map((e) =>
                                '${e.teacher?.degree} ${e.teacher?.fullName}')
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
                widget.subject.status == SubjectClassStatusEnum.PENDING
                    ? SizedBox()
                    : InkWell(
                        onTap: () {
                          if (widget.subject.status ==
                              SubjectClassStatusEnum.REGI) {
                            SubjectListTermController controller = Get.find();
                            controller.confirmRegisterSubject(widget.subject);
                          } else {
                            SubjectListCartController controller = Get.find();
                            controller.confirmAddToCart(widget.subject);
                          }
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
  }

  Widget itemColTimeLine(String title, String subTitle, {String toolTip}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          softWrap: true,
          style: fontInter(11,
              fontWeight: FontWeight.w500, color: AppColor.c84869C),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ).marginOnly(bottom: 2),
        SizedBox(
          width: 50,
          child: toolTip == null
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
                        fontWeight: FontWeight.w600, color: AppColor.c000333),
                  ),
                ),
        ),
      ],
    );
  }
}
