import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconSvg {
  IconSvg({this.size = 15, this.color, this.fit});
  final double size;
  final Color color;
  final BoxFit fit;

  static const String collapse_down = 'assets/icons/collapse_down.svg';

  SvgPicture get collapseDown => renderImage(collapse_down);

  renderImage(String asset) {
    return SvgPicture.asset(asset,
        color: color, fit: fit ?? BoxFit.contain, width: size);
  }
}
