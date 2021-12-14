import 'package:flutter/material.dart';

mixin ButtonMixin {
  /// Get button text module
  Widget getText(String title, {TextStyle? style}) {
    final String text = title;
    return Text(
      text.isNotEmpty ? text : 'Button',
      style: style,
    );
  }

  /// Get button image module
  Widget getImage(
    String imagePath, {
    BoxFit? fit,
    double? width,
    double? height,
  }) {
    late Widget child;
    if (imagePath.startsWith(RegExp(r'http://|https://|http|https'))) {
      child = Image.network(
        imagePath,
        fit: fit,
        width: width,
        height: height,
      );
    } else {
      child = Image.asset(
        imagePath,
        width: width,
        height: height,
      );
    }
    return child;
  }

  /// Get graphic partition module
  Widget getClapboard({double? width, double? height}) {
    return SizedBox(width: width, height: height);
  }
}
