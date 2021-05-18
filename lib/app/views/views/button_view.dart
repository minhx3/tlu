import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';
import 'package:thanglong_university/app/configuration/constant/global.dart';
import 'package:thanglong_university/app/configuration/constant/view_state.dart';

enum ButtonType { outline, system }

class ButtonView extends StatelessWidget {
  final String title;
  final Function onTap;
  final double verticalSpacing;
  final double horizontalSpacing;
  final ViewState viewState;
  final ButtonType type;

  const ButtonView(
      {Key key,
      this.title,
      this.onTap,
      this.verticalSpacing = 0,
      this.horizontalSpacing = 0,
      this.type = ButtonType.system,
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
        color:
            type == ButtonType.system ? AppColor.cfc2626 : Colors.transparent,
        borderRadius: BorderRadius.circular(3),
        child: InkWell(
          splashColor: type == ButtonType.system
              ? AppColor.primaryColor.withOpacity(0.5)
              : Colors.transparent,
          onTap: () {
            onTap();
          },
          child: Container(
            alignment: Alignment.center,
            height: 40,
            decoration: BoxDecoration(
                border: type == ButtonType.system
                    ? null
                    : Border.all(color: AppColor.cd9d9d9, width: 1)),
            child: viewState == ViewState.loading
                ? centerloading(size: 20)
                : Text(
                    title.tr,
                    textAlign: TextAlign.center,
                    style: fontInter(14,
                        fontWeight: type == ButtonType.system
                            ? FontWeight.bold
                            : FontWeight.w600,
                        color: type == ButtonType.system
                            ? Colors.white
                            : AppColor.c000333),
                  ),
          ),
        ),
      ),
    );
  }
}
