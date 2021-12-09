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
  Widget getImage(String imagePath, {BoxFit? fit}) {
    late Widget child;
    if (imagePath.startsWith(RegExp(r'http://|https://|http|https'))) {
      child = Image.network(
        imagePath,
        fit: fit,
        width: 40,
      );
    } else {
      child = Image.asset(imagePath);
    }
    return child;
  }

  /// Get button background module
  Widget getBackgroundImage(String imagePath) {
    late Widget child;
    if (imagePath.startsWith(RegExp(r'http://|https://|http|https'))) {
      child = Image.network(
        imagePath,
        fit: BoxFit.fill,
      );
    } else {
      child = Image.asset(
        imagePath,
        fit: BoxFit.fill,
      );
    }
    return child;
  }

  /// Get graphic partition module
  Widget getClapboard({double? width, double? height}) {
    return SizedBox(width: width, height: height);
  }
}
