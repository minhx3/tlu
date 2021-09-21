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
  final Color backgroundColor;
  final Color splashColor;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final EdgeInsets buttonPadding;
  final double height;

  const ButtonView(
      {Key key,
      this.title,
      this.onTap,
      this.verticalSpacing = 0,
      this.horizontalSpacing = 0,
      this.type = ButtonType.system,
      this.viewState = ViewState.idle,
      this.backgroundColor,
      this.splashColor,
      this.textColor,
      this.fontSize,
      this.fontWeight,
      this.buttonPadding,
      this.height})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: horizontalSpacing,
          top: verticalSpacing,
          right: horizontalSpacing),
      child: Material(
        color: (backgroundColor != null ? backgroundColor : null) ??
            (type == ButtonType.system ? AppColor.cfc2626 : Colors.transparent),
        borderRadius: BorderRadius.circular(3),
        child: InkWell(
          splashColor: (splashColor != null ? splashColor : null) ??
              (type == ButtonType.system
                  ? AppColor.primaryColor.withOpacity(0.5)
                  : Colors.transparent),
          onTap: () {
            onTap();
          },
          child: Container(
            padding: buttonPadding,
            alignment: Alignment.center,
            height: height ?? 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                border: type == ButtonType.system
                    ? null
                    : Border.all(color: AppColor.cd9d9d9, width: 1)),
            child: viewState == ViewState.loading
                ? centerloading(size: 20)
                : Text(
                    title.tr,
                    textAlign: TextAlign.center,
                    style: fontInter(fontSize ?? 14,
                        fontWeight: fontWeight ?? FontWeight.w600,
                        color: textColor ?? type == ButtonType.system
                            ? Colors.white
                            : AppColor.c000333),
                  ),
          ),
        ),
      ),
    );
  }
}
