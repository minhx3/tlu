import 'dart:io';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thanglong_university/app/configuration/constant/color.dart';

enum Type { network, assets, localFile }

// ignore: must_be_immutable
class ImageView extends StatelessWidget {
  String path;

  final double width;

  final double height;

  final BoxFit fit;

  final String placeholder;

  final BorderRadius borderRadius;

  final Type type;

  final double opacity;

  final double sigmaX;
  final double sigmaY;

  final Color filterColor;

  final Widget child;
  final EdgeInsetsGeometry padding;

  final AlignmentGeometry alignment;
  final Color color;

  ImageView(
    this.path, {
    Key key,
    this.width,
    this.height,
    this.fit: BoxFit.cover,
    this.borderRadius: const BorderRadius.all(Radius.circular(0.0)),
    this.placeholder: "",
    this.type: Type.network,
    this.opacity: 1.0,
    this.sigmaX: 0.0,
    this.color,
    this.sigmaY: 0.0,
    this.filterColor: Colors.transparent,
    this.child,
    this.alignment: Alignment.center,
    this.padding: EdgeInsets.zero,
  })  : assert(path != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;
    switch (type) {
      case Type.network:
        // path = path.startsWith("http") == true
        //     ? path
        //     : Configuration.shared.getValue("url") + path;
        // imageWidget = FadeInImage(
        //     placeholder: AssetImage(placeholder),
        //     image: NetworkImage(path),
        //     fit: fit);

        imageWidget = CachedNetworkImage(
          imageUrl: path,
          fadeInDuration: Duration(milliseconds: 700),
          fadeOutDuration: Duration(milliseconds: 300),
          placeholder: (context, url) => Center(
            child: CupertinoActivityIndicator(),
          ),
          fit: fit,
          errorWidget: (context, url, error) => Icon(
            Icons.error,
            color: AppColor.subTextColor,
          ),
          width: width,
          height: height,
        );
        break;
      case Type.assets:
        imageWidget = Image.asset(
          path,
          fit: fit,
          width: width,
          height: height,
          color: color,
        );
        break;
      case Type.localFile:
        imageWidget = Image.file(
          File(path),
          fit: fit,
          width: width,
          height: height,
        );
        break;
    }

    return Container(
      height: height ?? double.infinity,
      width: width ?? double.infinity,
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            imageWidget,
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
              child: Opacity(
                opacity: opacity,
                child: Container(
                  color: filterColor,
                  child: child ?? const SizedBox(),
                  alignment: alignment,
                  padding: padding,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
