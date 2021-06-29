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
  final TextEditingController controller;
  final TextInputType keyboardType;
  const TextFieldView({
    Key key,
    this.label,
    this.hasError = false,
    this.obscureText = false,
    this.hintText,
    this.onTap,
    this.keyboardType,
    this.controller,
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
                  color: AppColor.c333333, fontWeight: FontWeight.w600),
            ),
          ),
          Material(
            color: AppColor.cfafafa,
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
                              : AppColor.ce3e3e3)),
                  alignment: Alignment.center,
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextField(
                          obscuringCharacter: "*",
                          cursorHeight: 16,
                          keyboardType: this.keyboardType,
                          controller: this.controller,
                          keyboardAppearance: Brightness.light,
                          obscureText: obscureText,
                          style: fontInter(14,
                              fontWeight: FontWeight.w600,
                              color: AppColor.inputTextColor),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: hintText,
                              isDense: true,
                              isCollapsed: false,
                              hintStyle: fontInter(12,
                                  color: AppColor.cbfbfbf,
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
