import 'package:flutter/material.dart';
import 'package:idkit_button/src/button_enum.dart';
import 'package:idkit_button/src/button_mixin.dart';

class IDKitButtonItem extends StatelessWidget with ButtonMixin {
  const IDKitButtonItem({
    Key? key,
    this.style,
    this.imgWidth,
    this.imgHeight,
    this.fit,
    required this.title,
    required this.image,
    required this.layout,
    required this.distance,
  }) : super(key: key);
  final String title;
  final String image;
  final BtnGraphicLayout layout;
  final double distance;
  final TextStyle? style;
  final double? imgWidth;
  final double? imgHeight;
  final BoxFit? fit;

  /// Get the core module
  Widget getChild() {
    late Widget child;
    if (title.isNotEmpty && image.isNotEmpty) {
      switch (layout) {
        case BtnGraphicLayout.td:
          child = Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              getImage(image, width: imgWidth, height: imgHeight, fit: fit),
              getClapboard(height: distance),
              getText(title, style: style),
            ],
          );
          break;
        case BtnGraphicLayout.rl:
          child = Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              getText(title, style: style),
              getClapboard(width: distance),
              getImage(image, width: imgWidth, height: imgHeight, fit: fit),
            ],
          );
          break;
        case BtnGraphicLayout.bt:
          child = Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              getText(title, style: style),
              getClapboard(height: distance),
              getImage(image, width: imgWidth, height: imgHeight, fit: fit),
            ],
          );
          break;
        default:
          child = Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              getImage(image, width: imgWidth, height: imgHeight, fit: fit),
              getClapboard(width: distance),
              getText(title, style: style),
            ],
          );
      }
    } else if (image.isNotEmpty) {
      child = getImage(image, width: imgWidth, height: imgHeight, fit: fit);
    } else {
      child = getText(title, style: style);
    }
    return child;
  }

  @override
  Widget build(BuildContext context) => getChild();
}
