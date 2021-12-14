import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:idkit_button/idkit_button.dart';

class BtnTools {
  // Get button corner decoration object
  static Decoration? getCornerDecoration(
    double radius,
    BtnCornerType cornerType, {
    Color? color,
  }) {
    Decoration? decoration;
    switch (cornerType) {
      case BtnCornerType.left:
        decoration = BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radius),
            bottomLeft: Radius.circular(radius),
          ),
        );
        break;
      case BtnCornerType.top:
        decoration = BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radius),
            topRight: Radius.circular(radius),
          ),
        );
        break;
      case BtnCornerType.right:
        decoration = BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(radius),
            topRight: Radius.circular(radius),
          ),
        );
        break;
      case BtnCornerType.bottom:
        decoration = BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(radius),
            bottomLeft: Radius.circular(radius),
          ),
        );
        break;
      case BtnCornerType.topLeft:
        decoration = BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(radius),
          ),
        );
        break;
      case BtnCornerType.topRight:
        decoration = BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(radius),
          ),
        );
        break;
      case BtnCornerType.bottomLeft:
        decoration = BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(radius),
          ),
        );
        break;
      case BtnCornerType.bottomRight:
        decoration = BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(radius),
          ),
        );
        break;
      default:
        decoration = BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
        );
    }
    return decoration;
  }

  // Get the button gradient decoration object
  static Decoration? getGradientDecoration(
    BtnGradientType type,
    List<Color> colors, {
    double? radius,
    List<double>? stops,
    TileMode tileMode = TileMode.clamp,
    AlignmentGeometry begin = Alignment.centerLeft,
    AlignmentGeometry end = Alignment.centerRight,
    AlignmentGeometry center = Alignment.center,
    double startAngle = 0.0,
    double endAngle = math.pi * 2,
    double radiusGradient = 0.5,
  }) {
    Decoration? decoration;
    switch (type) {
      case BtnGradientType.radial:
        decoration = BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 0),
          gradient: RadialGradient(
            colors: colors,
            stops: stops,
            tileMode: tileMode,
            center: center,
            radius: radiusGradient,
          ),
        );
        break;
      case BtnGradientType.sweep:
        decoration = BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 0),
          gradient: SweepGradient(
            colors: colors,
            stops: stops,
            tileMode: tileMode,
            startAngle: startAngle,
            endAngle: endAngle,
          ),
        );
        break;
      default:
        decoration = BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 0),
          gradient: LinearGradient(
            colors: colors,
            stops: stops,
            tileMode: tileMode,
            begin: begin,
            end: end,
          ),
        );
    }
    return decoration;
  }

  // Get the button outline decoration object
  static Decoration? getOutlineDecoration({
    Color borderColor = Colors.black,
    double borderWidth = 1.0,
    BorderStyle borderStyle = BorderStyle.solid,
    Color? color,
    double? radius,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius ?? 0),
      border: Border.all(
        color: borderColor,
        width: borderWidth,
        style: borderStyle,
      ),
    );
  }
}
