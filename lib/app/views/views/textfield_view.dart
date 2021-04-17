import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';
import 'package:thanglong_university/app/configuration/constant/font_style.dart';

class TextFieldView extends GetView {
  final String hintText;
  final Function onTap;
  final double verticalSpacing;
  final double horizontalSpacing;
  final bool obscureText;
  final String label;
  final bool hasError;
  const TextFieldView({
    Key key,
    this.label,
    this.hasError = false,
    this.obscureText = false,
    this.hintText,
    this.onTap,
    this.verticalSpacing = 16,
    this.horizontalSpacing = 0,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: horizontalSpacing,
          top: verticalSpacing,
          right: horizontalSpacing),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              label,
              style: fontInter(12,
                  color: AppColor.labelColor, fontWeight: FontWeight.w600),
            ),
          ),
          Material(
            color: AppColor.inputBackground,
            borderRadius: BorderRadius.circular(3),
            child: InkWell(
              splashColor: AppColor.primaryColor.withOpacity(0.5),
              borderRadius: BorderRadius.circular(3),
              onTap: () {
                onTap();
              },
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      border: Border.all(
                          width: 1,
                          color: hasError == true
                              ? AppColor.errorColor
                              : Colors.transparent)),
                  alignment: Alignment.center,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextField(
                          obscuringCharacter: "*",
                          cursorHeight: 16,
                          keyboardAppearance: Brightness.light,
                          obscureText: obscureText,
                          style: fontInter(14,
                              fontWeight: FontWeight.w600,
                              color: AppColor.inputTextColor),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: hintText,
                              isDense: false,
                              isCollapsed: false,
                              hintStyle: fontInter(14,
                                  color: AppColor.hintTextColor,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
