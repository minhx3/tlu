import 'package:flutter/material.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';

// ignore: must_be_immutable
class CustomCheckbox extends StatefulWidget {
  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();

  bool checked;
  double width;
  double height;
  double iconSize;
  IconData checkIcon;
  Color checkColor;
  Color checkBackgroundColor;
  Decoration decoration;
  Function(bool) onChanged;

  CustomCheckbox({
    this.checked = false,
    this.width = 18,
    this.height = 18,
    this.iconSize = 10,
    this.checkIcon = Icons.check,
    this.onChanged,
    this.decoration,
    this.checkColor = AppColor.whiteColor,
    this.checkBackgroundColor = AppColor.c808080,
  });
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: widget.height,
        width: widget.width,
        decoration: widget.decoration != null
            ? widget.decoration
            : BoxDecoration(
                border: Border.all(color: AppColor.c808080, width: 1.5),
                borderRadius: BorderRadius.circular(3),
                color: widget.checked
                    ? widget.checkBackgroundColor
                    : Colors.transparent),
        child: widget.checked
            ? Icon(
                widget.checkIcon,
                color: widget.checkColor,
                size: widget.iconSize,
              )
            : SizedBox(),
      ),
      onTap: () {
        widget.checked = !widget.checked;
        setState(() {});
        widget.onChanged(widget.checked);
      },
    );
  }
}
