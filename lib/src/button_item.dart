import 'package:flutter/material.dart';
import 'package:idkit_button/src/button_enum.dart';
import 'package:idkit_button/src/button_mixin.dart';

class IDKitButtonItem extends StatelessWidget with ButtonMixin {
  const IDKitButtonItem({
    Key? key,
    this.style,
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
              getImage(image),
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
              getImage(image),
            ],
          );
          break;
        case BtnGraphicLayout.dt:
          child = Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              getText(title, style: style),
              getClapboard(height: distance),
              getImage(image),
            ],
          );
          break;
        default:
          child = Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              getImage(image),
              getClapboard(width: distance),
              getText(title, style: style),
            ],
          );
      }
    } else if (image.isNotEmpty) {
      child = getImage(image);
    } else {
      child = getText(title, style: style);
    }
    return child;
  }

  @override
  Widget build(BuildContext context) => getChild();
}
