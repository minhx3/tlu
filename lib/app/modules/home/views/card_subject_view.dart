import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/model/schedule_model.dart';
import 'package:thanglong_university/app/modules/home/controllers/home_controller.dart';
import 'package:thanglong_university/app/utils/global_constants.dart';

class CardSubjectView extends GetView<HomeController> {
  final SwiperController swiperController = SwiperController();
  final List<ScheduleModel> subjects;

  CardSubjectView(this.subjects);

  @override
  Widget build(BuildContext context) {
    return subjects.length == 0
        ? SizedBox()
        : Container(
            height: 176,
            child: Swiper(
              controller: swiperController,
              onIndexChanged: (index) {
                controller.setCard(index);
              },
              onTap: (index) {
                // controller.swiperController.move(index);
                // pushTo(Routes.TASK, arguments: controller.rxCalendarList[index]);
              },
              itemBuilder: (BuildContext context, int index) {
                return cardContentView(subjects[index]);
              },
              viewportFraction: 0.85,
              containerWidth: double.maxFinite,
              scale: 1,
              itemCount: subjects.length,
            ),
          );
  }

  Widget cardContentView(ScheduleModel item) {
    return Container(
      margin: const EdgeInsets.only(left: 5, right: 5, top: 15, bottom: 25),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          offset: Offset(0, 12),
          blurRadius: 10,
          color: AppColor.black.withOpacity(0.2),
        ),
      ], color: AppColor.c000333, borderRadius: BorderRadius.circular(5)),
      padding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SizedBox(
                  height: 38,
                  child: Text(
                    "${item.subjectName ?? ""}",
                    style: fontInter(16,
                        fontWeight: FontWeight.w600,
                        color: AppColor.cfafafa,
                        height: 1.18),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 15),
                decoration: BoxDecoration(
                    color: AppColor.errorColor,
                    borderRadius: BorderRadius.circular(3)),
                height: 18,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                child: Text(
                  "${item?.subjectId ?? ""}",
                  style: fontInter(10,
                      fontWeight: FontWeight.w600,
                      color: AppColor.whiteColor,
                      height: 1.2),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ).marginOnly(bottom: 8),
          Divider(thickness: 2, height: 16, color: AppColor.c33355a),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(Images.timeClock,
                      width: 13, height: 13, color: AppColor.cfc7171)
                  .marginOnly(right: 9),
              Text(
                item.getTime + ' - ' + dateFormat(item.day),
                style: fontInter(12,
                    fontWeight: FontWeight.w600, color: AppColor.cfc7171),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ).marginOnly(bottom: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                Images.place,
                width: 13,
                height: 13,
              ).marginOnly(right: 9),
              Text(
                "Phòng ${item?.address ?? ""}",
                style: fontInter(12,
                    fontWeight: FontWeight.w600, color: AppColor.cd9d9d9),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
