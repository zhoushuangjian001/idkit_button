import 'dart:async';
import 'package:flutter/material.dart';

class IDKitDeclineTimeButton extends StatefulWidget {
  const IDKitDeclineTimeButton({
    Key key,
    this.title,
    this.maxLines,
    this.style,
    this.totalTime,
    this.width,
    this.height,
    this.bgColor,
    this.enable,
    this.onTap,
    this.padding,
    this.margin,
    this.alignment,
    this.lifte,
    this.timingTitle,
    this.resetState,
  }) : super(key: key);

  /// The text of button.
  final String title;

  /// Maximum number of lines of button text.
  final int maxLines;

  /// Button text style.
  final TextStyle style;

  /// Total time of button timing,defalut 60.
  final int totalTime;

  /// The size of the button.
  final double width;
  final double height;

  /// The background color of the button.
  final Color bgColor;

  /// Can buttons interact.
  final bool enable;

  /// Button click event callback method.
  final Function(Function(bool) start) onTap;

  /// Empty space to inscribe inside the [decoration]. The [child], if any, is
  /// placed inside this padding.
  final EdgeInsetsGeometry padding;

  /// Empty space to surround the [decoration] and [child].
  final EdgeInsetsGeometry margin;

  /// The location of the subclass within the button.
  final AlignmentGeometry alignment;

  /// Button timing mode: true is up time; false is down time, default false.
  final bool lifte;

  /// The copywriting form of button timing, for example: "get after x seconds", replace the timing value with %T.
  final String timingTitle;

  /// Reset button timing status.
  final Function(Function(bool) resetBlock) resetState;

  @override
  _IDKitDeclineTimeButtonState createState() => _IDKitDeclineTimeButtonState();
}

class _IDKitDeclineTimeButtonState extends State<IDKitDeclineTimeButton> {
  bool _enable;
  TextStyle _textStyle;
  int _timing;
  bool _lifte;
  int _totalTime;
  Timer _timer;
  String _timingTitle;

  /// Global button text mark key.
  GlobalKey<_ButtonTitleState> _globalKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    _enable = widget.enable ?? true;
    _textStyle = widget.style;
    _lifte = widget.lifte ?? false;
    _totalTime = 60;
    _timingTitle = widget.timingTitle;
    if (_timingTitle == null || !_timingTitle.contains("T")) {
      _timingTitle = "%Ts 后再试";
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: widget.padding,
        margin: widget.margin,
        width: widget.width,
        height: widget.height,
        alignment: widget.alignment ?? Alignment.center,
        color: widget.bgColor ?? Colors.transparent,
        child: ButtonTitle(
          key: _globalKey,
          title: widget.title ?? "",
          style: _textStyle,
          maxLines: widget.maxLines,
        ),
      ),
      onTap: () {
        if (_enable) {
          if (widget.onTap != null) {
            _enable = false;
            widget.onTap((start) {
              if (start) {
                _declineTimeMethod();
              } else {
                _enable = true;
              }
            });
          }

          /// Reset button timing status.
          if (widget.resetState != null) {
            widget.resetState((state) {
              if (state) {
                _timer?.cancel();
                _globalKey.currentState.declineTitleHandle(isFinsh: true);
                _enable = true;
              }
            });
          }
        }
      },
    );
  }

  void _declineTimeMethod() {
    // Reset value.
    _timing = 0;
    _enable = false;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _timing += 1;
      var isFinsh = false;
      if (_timing >= _totalTime) {
        isFinsh = true;
        _enable = true;
        timer.cancel();
      }
      var curTitle = _timing;
      if (!_lifte) {
        curTitle = _totalTime - _timing;
      }
      var result = _timingTitle.replaceAll(RegExp(r'%T'), "$curTitle");
      _globalKey.currentState
          .declineTitleHandle(title: result, isFinsh: isFinsh);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

class ButtonTitle extends StatefulWidget {
  ButtonTitle({Key key, this.title, this.style, this.maxLines})
      : super(key: key);
  final String title;
  final TextStyle style;
  final int maxLines;
  @override
  _ButtonTitleState createState() => _ButtonTitleState();
}

class _ButtonTitleState extends State<ButtonTitle> {
  String _title;
  TextStyle _style;
  int _maxLines;
  @override
  void initState() {
    super.initState();
    _title = widget.title;
    _style = widget.style;
    _maxLines = widget.maxLines;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _title,
      style: _style,
      maxLines: _maxLines,
    );
  }

  /// Update button text
  void declineTitleHandle({String title, bool isFinsh = false}) {
    setState(() {
      if (isFinsh) {
        _title = widget.title;
      } else {
        _title = title;
      }
    });
  }
}
