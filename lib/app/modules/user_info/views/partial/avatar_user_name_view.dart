import 'package:flutter/material.dart';
import 'package:thanglong_university/Images/resources.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/model/chat/base_model.dart';
import 'package:thanglong_university/app/views/views/value_box_view.dart';

class AvatarUserNameView extends StatelessWidget {
  final bool isAllowEdit;
  final UserModel user;

  const AvatarUserNameView({Key key, this.isAllowEdit = false, this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        renderAvatar(user),
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
                    text: "${user?.id ?? ""}",
                  ),
                  Spacer(),
                  Visibility(
                    visible: isAllowEdit == true,
                    child: Image.asset(
                      Images.icEdit,
                      width: 20,
                      height: 20,
                    ),
                  )
                ],
              ),
              Text(
                "${user?.name ?? user?.fullName ?? ""}",
                style: fontInter(18,
                    fontWeight: FontWeight.w600, color: AppColor.c4d4d4d),
              )
            ],
          ),
        ),
      ],
    );
  }

  CircleAvatar renderAvatar([UserModel _profile]) {
    NetworkImage _backgroundImage;
    Widget _child = SizedBox();

    if (_profile?.avatar != null && _profile.avatar.isNotEmpty) {
      _backgroundImage = NetworkImage(_profile.avatar);
    } else {
      _child = Text(
        _profile?.name != null
            ? RegExp(r'\b(\w)')
                .stringMatch(_profile?.name.toString())
                .toUpperCase()
            : "",
        style: TextStyle(
            color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
      );
    }

    return CircleAvatar(
      radius: 35,
      backgroundColor: AppColor.primaryColor,
      backgroundImage: _backgroundImage,
      child: _child,
    );
  }
}
