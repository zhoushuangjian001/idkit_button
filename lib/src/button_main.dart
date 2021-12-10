import 'dart:async';
import 'dart:math' as math;
import 'package:idkit_button/src/button_tools.dart';
import 'package:rxdart/rxdart.dart';
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
    this.duration,
  }) : super(key: key);

  factory IDKitButton.title(
    String title, {
    Color? bgColor,
    Color? disableBgColor,
    TextStyle? style,
    String? disableTitle,
    TextStyle? disableStyle,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    double? width,
    double? height,
    String? backgroundImage,
    Function()? onTap,
    StreamController<bool>? enableStreamController,
    bool enable = true,
    Duration? duration,
    Decoration? decoration,
    Decoration? disableDecoration,
  }) =>
      IDKitButton(
        title: title,
        style: style,
        disableTitle: disableTitle,
        disableStyle: disableStyle,
        margin: margin,
        padding: padding,
        width: width,
        height: height,
        backgroundImage: backgroundImage,
        onTap: onTap,
        enableStreamController: enableStreamController,
        enable: enable,
        duration: duration,
        bgColor: bgColor,
        disableBgColor: disableBgColor,
        decoration: decoration,
        disableDecoration: disableDecoration,
      );

  factory IDKitButton.image(
    String image, {
    String? disableImage,
    Color? bgColor,
    Color? disableBgColor,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    double? width,
    double? height,
    String? backgroundImage,
    Function()? onTap,
    StreamController<bool>? enableStreamController,
    bool enable = true,
    Duration? duration,
    Decoration? decoration,
    Decoration? disableDecoration,
  }) =>
      IDKitButton(
        image: image,
        margin: margin,
        padding: padding,
        width: width,
        height: height,
        backgroundImage: backgroundImage,
        onTap: onTap,
        enableStreamController: enableStreamController,
        enable: enable,
        duration: duration,
        bgColor: bgColor,
        disableBgColor: disableBgColor,
        decoration: decoration,
        disableDecoration: disableDecoration,
        disableImage: disableImage,
      );

  factory IDKitButton.imageAndText(
    String image,
    String title, {
    TextStyle? style,
    String? disableTitle,
    TextStyle? disableStyle,
    String? disableImage,
    Color? bgColor,
    Color? disableBgColor,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    double? width,
    double? height,
    String? backgroundImage,
    Function()? onTap,
    StreamController<bool>? enableStreamController,
    bool enable = true,
    Duration? duration,
    Decoration? decoration,
    Decoration? disableDecoration,
    BtnGraphicLayout layout = BtnGraphicLayout.lr,
  }) =>
      IDKitButton(
        title: title,
        image: image,
        style: style,
        disableStyle: disableStyle,
        disableTitle: disableTitle,
        margin: margin,
        padding: padding,
        width: width,
        height: height,
        backgroundImage: backgroundImage,
        onTap: onTap,
        enableStreamController: enableStreamController,
        enable: enable,
        duration: duration,
        bgColor: bgColor,
        disableBgColor: disableBgColor,
        decoration: decoration,
        disableDecoration: disableDecoration,
        disableImage: disableImage,
        layout: layout,
      );

  factory IDKitButton.corner({
    double radius = 4,
    String? title,
    TextStyle? style,
    String? disableTitle,
    TextStyle? disableStyle,
    String? image,
    String? disableImage,
    Color? bgColor,
    Color? disableBgColor,
    BtnCornerType cornerType = BtnCornerType.all,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    double? width,
    double? height,
    bool enable = true,
    Duration? duration,
    Function()? onTap,
    StreamController<bool>? enableStreamController,
  }) {
    return IDKitButton(
      title: title,
      style: style,
      disableTitle: disableTitle,
      disableStyle: disableStyle,
      image: image,
      disableImage: disableImage,
      decoration:
          BtnTools.getCornerDecoration(radius, cornerType, color: bgColor),
      disableDecoration: BtnTools.getCornerDecoration(radius, cornerType,
          color: disableBgColor),
      margin: margin,
      padding: padding,
      onTap: onTap,
      enable: enable,
      width: width,
      height: height,
      duration: duration,
      enableStreamController: enableStreamController,
    );
  }
  factory IDKitButton.gradient(
    List<Color> colors, {
    List<Color>? disableColors,
    TileMode tileMode = TileMode.clamp,
    BtnGradientType type = BtnGradientType.linear,
    AlignmentGeometry linearBegin = Alignment.centerLeft,
    AlignmentGeometry linearEnd = Alignment.centerRight,
    AlignmentGeometry center = Alignment.center,
    double radialRadius = 0.5,
    double sweepStartAngle = 0.0,
    double sweepEndAngle = math.pi * 2,
    List<double>? stops,
    double radius = 0,
    String? title,
    TextStyle? style,
    String? disableTitle,
    TextStyle? disableStyle,
    String? image,
    String? disableImage,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    double? width,
    double? height,
    bool enable = true,
    Duration? duration,
    Function()? onTap,
    StreamController<bool>? enableStreamController,
  }) {
    return IDKitButton(
      title: title,
      style: style,
      disableTitle: disableTitle,
      disableStyle: disableStyle,
      image: image,
      disableImage: disableImage,
      decoration: BtnTools.getGradientDecoration(
        type,
        colors,
        radius: radius,
        tileMode: tileMode,
        stops: stops,
        begin: linearBegin,
        end: linearEnd,
        center: center,
        startAngle: sweepStartAngle,
        endAngle: sweepEndAngle,
        radiusGradient: radialRadius,
      ),
      disableDecoration: BtnTools.getGradientDecoration(
        type,
        disableColors ?? colors,
        radius: radius,
        tileMode: tileMode,
        stops: stops,
        begin: linearBegin,
        end: linearEnd,
        center: center,
        startAngle: sweepStartAngle,
        endAngle: sweepEndAngle,
        radiusGradient: radialRadius,
      ),
      margin: margin,
      padding: padding,
      onTap: onTap,
      enable: enable,
      width: width,
      height: height,
      duration: duration,
      enableStreamController: enableStreamController,
    );
  }

  factory IDKitButton.outline({
    Color borderColor = Colors.black,
    Color disableBorderColor = Colors.transparent,
    double borderWidth = 1.0,
    BorderStyle borderStyle = BorderStyle.solid,
    double radius = 0,
    Color? bgColor,
    Color? disableBgColor,
    String? title,
    TextStyle? style,
    String? disableTitle,
    TextStyle? disableStyle,
    String? image,
    String? disableImage,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    double? width,
    double? height,
    bool enable = true,
    Duration? duration,
    Function()? onTap,
    StreamController<bool>? enableStreamController,
  }) {
    return IDKitButton(
      title: title,
      style: style,
      disableTitle: disableTitle,
      disableStyle: disableStyle,
      image: image,
      disableImage: disableImage,
      decoration: BtnTools.getOutlineDecoration(
        borderColor: borderColor,
        borderWidth: borderWidth,
        borderStyle: borderStyle,
        radius: radius,
        color: bgColor,
      ),
      disableDecoration: BtnTools.getOutlineDecoration(
        borderStyle: borderStyle,
        borderWidth: borderWidth,
        borderColor: disableBorderColor,
        radius: radius,
        color: disableBgColor,
      ),
      margin: margin,
      padding: padding,
      onTap: onTap,
      enable: enable,
      width: width,
      height: height,
      duration: duration,
      enableStreamController: enableStreamController,
    );
  }

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
  final Duration? duration;
  @override
  _IDKitButtonState createState() => _IDKitButtonState();
}

class _IDKitButtonState extends State<IDKitButton> with ButtonMixin {
  // Whether the record button is available
  late bool _isEnable = false;
  // Button click subscribers
  late PublishSubject<bool> buttonSubject = PublishSubject<bool>();

  @override
  void initState() {
    buttonSubject
        .throttleTime(widget.duration ?? const Duration(milliseconds: 500))
        .listen((bool state) {
      if (state) {
        widget.onTap?.call();
      }
    });
    super.initState();
  }

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
      onTap: () => buttonSubject.add(_isEnable),
      onTapDown: (TapDownDetails details) {},
      onTapCancel: () {},
    );
  }

  @override
  void dispose() {
    buttonSubject.close();
    super.dispose();
  }
}
