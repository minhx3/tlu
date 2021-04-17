import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';
import 'package:thanglong_university/app/configuration/constant/view_state.dart';

class ButtonView extends StatelessWidget {
  final String title;
  final Function onTap;
  final double verticalSpacing;
  final double horizontalSpacing;
  final ViewState viewState;

  const ButtonView(
      {Key key,
      this.title,
      this.onTap,
      this.verticalSpacing = 0,
      this.horizontalSpacing = 0,
      this.viewState = ViewState.idle})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: horizontalSpacing,
          top: verticalSpacing,
          right: horizontalSpacing),
      child: Material(
        color: AppColor.primaryColor,
        borderRadius: BorderRadius.circular(3),
        child: InkWell(
          splashColor: AppColor.primaryColor.withOpacity(0.5),
          onTap: () {
            onTap();
          },
          child: Container(
            alignment: Alignment.center,
            height: 50,
            child: viewState == ViewState.loading
                ? centerloading(size: 20)
                : Text(
                    title.tr,
                    textAlign: TextAlign.center,
                    style: fontInter(13,
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
          ),
        ),
      ),
    );
  }
}
