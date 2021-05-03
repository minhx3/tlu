import 'package:flutter/material.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';

class PressableView extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final Color backgroundColor;
  final Function onPressed;
  final Function onLongPressed;

  PressableView(
      {this.child,
      this.borderRadius,
      this.backgroundColor,
      this.onPressed,
      this.onLongPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(borderRadius ?? 0),
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius ?? 0),
        onTap: onPressed,
        onLongPress: onLongPressed,
        splashColor: AppColor.primaryColor,
        highlightColor: AppColor.primaryColor.withOpacity(0.5),
        child: child,
      ),
    );
  }
}
