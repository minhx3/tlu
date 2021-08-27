import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/enums/notification_status_enum.dart';
import 'package:thanglong_university/app/enums/notification_type_enum.dart';
import 'package:thanglong_university/app/model/notification_model.dart';
import 'package:thanglong_university/app/modules/notification/controllers/notification_controller.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationItemView extends GetView<NotificationController> {
  final NotificationModel notification;

  const NotificationItemView({Key key, this.notification}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String iconImg;
    switch (notification.type) {
      case NotificationTypeEnum.TRAINING:
        iconImg = Images.iconTraining;
        break;
      case NotificationTypeEnum.REGISTER:
        iconImg = Images.iconRegisterSubject;
        break;
      case NotificationTypeEnum.SCHEDULE:
        iconImg = Images.iconSchedule;
        break;
      default:
        iconImg = Images.noteIcon;
    }
    return Column(
      children: [
        InkWell(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  iconImg ?? iconImg,
                  height: 40,
                  width: 40,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          notification.title,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: fontInter(14,
                              fontWeight: FontWeight.w500,
                              color: notification.status ==
                                      NotificationStatusEnum.NEWR
                                  ? AppColor.c404040
                                  : AppColor.c8c8c8c),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          child: Text(
                            timeago.format(
                                DateTime.fromMillisecondsSinceEpoch(
                                    notification.createDate),
                                locale: "vi",
                                allowFromNow: true),
                            style: fontInter(12,
                                fontWeight: FontWeight.w500,
                                color: notification.status ==
                                        NotificationStatusEnum.NEWR
                                    ? AppColor.errorColor
                                    : AppColor.cb3b4c2),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                notification.status == NotificationStatusEnum.NEWR
                    ? Container(
                        margin: EdgeInsets.only(top: 10, left: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.errorColor),
                        height: 10,
                        width: 10,
                      )
                    : SizedBox()
              ],
            ),
          ),
          onTap: () => controller.readOne(notification.id),
        ),
        Divider(thickness: 1, height: 1, color: AppColor.lineColor),
      ],
    );
  }
}
