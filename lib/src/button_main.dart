import 'dart:async';

import 'package:flutter/material.dart';
import 'package:idkit_button/src/button_enum.dart';
import 'package:idkit_button/src/button_item.dart';
import 'package:idkit_button/src/button_mixin.dart';

class IDKitButton extends StatefulWidget {
  const IDKitButton({
    Key? key,
    this.width,
    this.height,
    this.bgColor,
    this.disableBgColor,
    this.backgroundImage,
    this.decoration,
    this.disableDecoration,
    this.title,
    this.disableTitle,
    this.image,
    this.disableImage,
    this.layout = BtnGraphicLayout.lr,
    this.distance,
    this.margin,
    this.padding,
    this.style,
    this.disableStyle,
    this.onTap,
    this.enable = true,
    this.enableStreamController,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Color? bgColor;
  final Color? disableBgColor;
  final String? backgroundImage;
  final Decoration? decoration;
  final Decoration? disableDecoration;
  final String? title;
  final String? disableTitle;
  final String? image;
  final String? disableImage;
  final BtnGraphicLayout layout;
  final double? distance;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final TextStyle? style;
  final TextStyle? disableStyle;
  final Function()? onTap;
  final bool enable;
  final StreamController<bool>? enableStreamController;
  @override
  _IDKitButtonState createState() => _IDKitButtonState();
}

class _IDKitButtonState extends State<IDKitButton> with ButtonMixin {
  // Whether the record button is available
  late bool _isEnable = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: StreamBuilder<bool>(
        stream: widget.enableStreamController?.stream,
        initialData: widget.enable,
        builder: (_, AsyncSnapshot<bool> state) {
          final bool isAble = state.data ?? false;
          _isEnable = isAble;
          final Color? _bgColor =
              isAble ? widget.bgColor : widget.disableBgColor;
          final Decoration? _decoration =
              isAble ? widget.decoration : widget.disableDecoration;
          final String? _title = isAble ? widget.title : widget.disableTitle;
          final String? _image = isAble ? widget.image : widget.disableImage;
          final TextStyle? _style = isAble ? widget.style : widget.disableStyle;
          return Container(
            margin: widget.margin,
            padding: widget.padding,
            color: _bgColor,
            alignment: Alignment.center,
            width: widget.width,
            height: widget.height,
            decoration: _decoration,
            child: IDKitButtonItem(
              title: _title ?? '',
              image: _image ?? '',
              distance: widget.distance ?? 5,
              layout: widget.layout,
              style: _style,
            ),
          );
        },
      ),
      onTap: _isEnable
          ? () {
              widget.onTap?.call();
            }
          : null,
      onTapDown: (TapDownDetails details) {},
      onTapCancel: () {},
    );
  }
}
