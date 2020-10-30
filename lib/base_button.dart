import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class IDKitButton extends StatefulWidget {
  const IDKitButton({
    Key key,
    this.title,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLine,
    this.image,
    this.imageSize,
    this.imageFit,
    this.sketchLayout,
    this.space,
    this.padding,
    this.margin,
    this.bgColor,
    this.height,
    this.width,
    this.bgImage,
    this.enable,
    this.radiusInsets,
    this.border,
    this.shape,
    this.boxShadow,
    this.gradient,
    this.alignment,
    this.onTap,
    this.isRepeatClick,
    this.repeatTime,
    this.onLongPress,
    this.onLongPressTitleColor,
    this.onLongPressImage,
  }) : super(key: key);

  /// The bgColor of widget.
  final Color bgColor;

  /// The text of button.
  final String title;

  /// The style of button title.
  final TextStyle style;

  /// How the text should be aligned horizontally.
  final TextAlign textAlign;

  /// How visual overflow should be handled.
  final TextOverflow overflow;

  /// An optional maximum number of lines for the text to span, wrapping if necessary.
  final int maxLine;

  /// The picture of the image button.
  final ImageProvider image;

  /// The size of the image button.
  final Size imageSize;

  /// How to inscribe the image into the space allocated during layout.
  final BoxFit imageFit;

  /// The space between the button image and the text.defalut: 8pd
  final double space;

  /// Image at the bottom of the button
  final ImageProvider bgImage;

  /// The layout of Inage and text,defalut: SketchLayout.lr.
  final SketchLayout sketchLayout;

  /// The size of button.
  final double width;
  final double height;

  /// Can buttons interact，default: enable=true.
  final bool enable;

  /// Overall cutting angle value of button.defult: radius=0;
  final BorderRadius radiusInsets;

  /// A border to draw above the background [color], [gradient], or [image].
  final BoxBorder border;

  /// The shape to fill the background [color], [gradient], and [image] into and
  /// to cast as the [boxShadow].
  final BoxShape shape;

  /// A list of shadows cast by this box behind the box.
  final List<BoxShadow> boxShadow;

  /// A gradient to use when filling the box.
  final Gradient gradient;

  /// Align the [child] within the container.
  final AlignmentGeometry alignment;

  /// Empty space to inscribe inside the [decoration]. The [child], if any, is
  /// placed inside this padding.
  final EdgeInsetsGeometry padding;

  /// Empty space to surround the [decoration] and [child].
  final EdgeInsetsGeometry margin;

  /// Button tap press event callback.
  final Function onTap;

  /// Whether to turn on prevent duplicate click.
  final bool isRepeatClick;

  /// The time interval of anti key points, the default unit is MS, and the default value is 500.
  final int repeatTime;

  /// Button long press event callback.
  final Function onLongPress;

  /// Button length and text color.
  final Color onLongPressTitleColor;

  /// Button length on time image.
  final ImageProvider onLongPressImage;

  @override
  _IDKitButtonState createState() => _IDKitButtonState();
}

class _IDKitButtonState extends State<IDKitButton> {
  AlignmentGeometry _alignment;
  bool _enable;
  BoxShape _shape;
  bool _sketch = false;
  SketchLayout _sketchLayout;
  double _space;
  bool _isRepeatClick;
  int _repeatTime;
  TextStyle _textStyle;
  ImageProvider _imageProvider;

  @override
  void initState() {
    super.initState();
    _enable = widget.enable ?? true;
    _alignment = widget.alignment ?? Alignment.center;
    _shape = widget.shape ?? BoxShape.rectangle;
    _space = widget.space ?? 8;
    _sketchLayout = widget.sketchLayout ?? SketchLayout.lr;
    _sketch =
        (_sketchLayout == SketchLayout.lr || _sketchLayout == SketchLayout.rl);
    _isRepeatClick = widget.isRepeatClick ?? true;
    _repeatTime = widget.repeatTime ?? 500;
    _textStyle = widget.style;
    _imageProvider = widget.image;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: widget.padding,
        margin: widget.margin,
        alignment: _alignment,
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: widget.bgColor ?? Colors.transparent,
          image: widget.bgImage != null
              ? DecorationImage(
                  image: widget.bgImage,
                  fit: BoxFit.fill,
                )
              : null,
          borderRadius: widget.radiusInsets,
          border: widget.border,
          shape: _shape,
          boxShadow: widget.boxShadow,
          gradient: widget.gradient,
        ),
        child: _selectionWidget(),
      ),
      onTap: _onTap,
      onLongPress: _onLongPress,
      onLongPressEnd: _onLongPressEnd,
    );
  }

  /// Single click event handling.
  void _onTap() {
    if (_enable) {
      if (widget.onTap != null) {
        widget.onTap();
        if (_isRepeatClick) {
          _enable = false;
          print(DateTime.now().millisecondsSinceEpoch);
          Future.delayed(Duration(milliseconds: _repeatTime), () {
            _enable = true;
          });
        }
      }
    }
  }

  // Press and hold the button to start.
  void _onLongPress() {
    if (_enable) {
      setState(() {
        _imageProvider = widget.onLongPressImage ?? widget.image;
        _textStyle = _textStyle.copyWith(color: widget.onLongPressTitleColor);
      });
    }
  }

  // Press and hold the button to end.
  void _onLongPressEnd(LongPressEndDetails details) {
    _onTap();
    setState(() {
      _imageProvider = widget.image;
      _textStyle = widget.style;
    });
  }

  /// Button component selection.
  Widget _selectionWidget() {
    if (widget.image == null && widget.title != null) {
      return _textButtonBuild();
    } else if (widget.title == null && widget.image != null) {
      return _imageButton();
    } else if (widget.title != null && widget.image != null) {
      return _imageAndTextButtonBuild();
    } else {
      return null;
    }
  }

  // Text button
  Widget _textButtonBuild() {
    return Flexible(
      child: Text(
        widget.title,
        style: _textStyle,
        textAlign: widget.textAlign ?? TextAlign.start,
        overflow: widget.overflow,
        maxLines: widget.maxLine,
      ),
    );
  }

  // Image button
  Widget _imageButton() {
    return Image(
      image: _imageProvider,
      height: widget.imageSize == null ? null : widget.imageSize.height,
      width: widget.imageSize == null ? null : widget.imageSize.width,
      fit: widget.imageFit,
    );
  }

  // Iamge and text button.
  Widget _imageAndTextButtonBuild() {
    if (_sketch) {
      List<Widget> children;
      if (_sketchLayout == SketchLayout.lr) {
        children = [
          _imageButton(),
          SizedBox(
            width: _space,
          ),
          _textButtonBuild(),
        ];
      } else {
        children = [
          _textButtonBuild(),
          SizedBox(
            width: _space,
          ),
          _imageButton(),
        ];
      }
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      );
    } else {
      List<Widget> children;
      if (_sketchLayout == SketchLayout.td) {
        children = [
          _imageButton(),
          SizedBox(
            height: _space,
          ),
          _textButtonBuild(),
        ];
      } else {
        children = [
          _textButtonBuild(),
          SizedBox(
            height: _space,
          ),
          _imageButton(),
        ];
      }
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      );
    }
  }
}

/// The layout of text and img in button.
enum SketchLayout {
  // Image on the left; text on the right.
  lr,
  // Image on the right; text on the left.
  rl,
  // Image on the top; text on the down.
  td,
  // Image on the down; text on the top.
  dt,
}

/// Setting of cutting angle of button.
class RadiusInsets {
  /// Creates a border radius where all radii are [radius].
  static BorderRadius all(double value) {
    return BorderRadius.all(Radius.circular(value));
  }

  /// Creates a border radius with only the given non-zero values. The other
  /// corners will be right angles.
  static BorderRadius only(
      {double topLeft = 0,
      double topRight = 0,
      double bottomLeft = 0,
      double bottomRight = 0}) {
    return BorderRadius.only(
      topLeft: Radius.circular(topLeft),
      topRight: Radius.circular(topRight),
      bottomLeft: Radius.circular(bottomLeft),
      bottomRight: Radius.circular(bottomRight),
    );
  }

  /// Creates a vertically symmetric border radius where the top and bottom
  /// sides of the rectangle have the same radii.
  static BorderRadius vertical({
    double top = 0,
    double bottom = 0,
  }) {
    return BorderRadius.vertical(
      top: Radius.circular(top),
      bottom: Radius.circular(bottom),
    );
  }

  /// Creates a horizontally symmetrical border radius where the left and right
  /// sides of the rectangle have the same radii.
  static BorderRadius horizontal({
    double left = 0,
    double right = 0,
  }) {
    return BorderRadius.horizontal(
      left: Radius.circular(left),
      right: Radius.circular(right),
    );
  }
}
