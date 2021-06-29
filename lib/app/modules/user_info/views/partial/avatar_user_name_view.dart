import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/modules/profile/controllers/profile_controller.dart';
import 'package:thanglong_university/app/views/views/value_box_view.dart';

class AvatarUserNameView extends StatelessWidget {
  final bool isAllowEdit;

  const AvatarUserNameView({Key key, this.isAllowEdit = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          children: [
            CircleAvatar(
              radius: 35,
              backgroundColor: AppColor.primaryColor,
              child: Text('AVT'),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ValueBoxView(
                        text:
                            "${ProfileController.to.rxUserInfo()?.username ?? ""}",
                      ),
                      Spacer(),
                      Visibility(
                        visible: isAllowEdit == true,
                        child: Image.asset(
                          Images.icGreySquareEdit,
                          width: 23,
                          height: 23,
                        ),
                      )
                    ],
                  ),
                  Text(
                    "${ProfileController.to.rxUserInfo()?.fullName ?? ""}",
                    style: fontInter(18, fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
