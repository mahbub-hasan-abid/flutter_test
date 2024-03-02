import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// [PrettyBorderButton] is an animated button
/// that creates a border from left bottom and top right at the same time when pressed the button in mobile devices
class PrettyBorderButton extends StatefulWidget {
  const PrettyBorderButton({
    super.key,
    this.borderWidth = s1,
    this.borderColor = Colors.teal,
    required this.label,
    this.bgColor = kWhite,
    this.labelStyle,
    required this.onPressed,
  });
  final String label;
  final TextStyle? labelStyle;
  final double borderWidth;
  final Color borderColor;
  final VoidCallback onPressed;
  final Color bgColor;
  @override
  State<PrettyBorderButton> createState() => _PrettyBorderButtonState();
}

class _PrettyBorderButtonState extends State<PrettyBorderButton>
    with SingleTickerProviderStateMixin {
  late EdgeInsetsGeometry padding;
  late Size textSize;
  late Size containerSize;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration1000);
    padding = const EdgeInsets.symmetric(
      vertical: s14,
      horizontal: s24,
    );
    textSize = widget.label.textSize(
      style: widget.labelStyle,
    );
    containerSize = Size(
      textSize.width + padding.horizontal,
      textSize.height + padding.vertical,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        if (!kIsWeb) {
          _controller.reset();
          _controller.forward();
        }
      },
      onExit: (event) {
        if (!kIsWeb) {
          _controller.reverse();
        }
      },
      child: <Widget>[
        Text(
          widget.label,
          style: widget.labelStyle,
        ).addCenter().addContainer(
              decoration: BoxDecoration(
                color: widget.bgColor,
              ),
            ),
        Align(
          alignment: Alignment.topRight,
          child: _AnimatedBorder(
            animation: _controller,
            containerSize: containerSize,
            isHorizontal: true,
            borderWidth: widget.borderWidth,
            borderColor: widget.borderColor,
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: _AnimatedBorder(
            animation: _controller,
            containerSize: containerSize,
            isHorizontal: false,
            borderWidth: widget.borderWidth,
            borderColor: widget.borderColor,
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: _AnimatedBorder(
            animation: _controller,
            containerSize: containerSize,
            isHorizontal: true,
            borderWidth: widget.borderWidth,
            borderColor: widget.borderColor,
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: _AnimatedBorder(
            animation: _controller,
            containerSize: containerSize,
            isHorizontal: false,
            borderWidth: widget.borderWidth,
            borderColor: widget.borderColor,
          ),
        ),
      ]
          .addStack()
          .addSizedBox(width: containerSize.width, height: containerSize.height)
          .addCenter(),
    );
  }
}

class _AnimatedBorder extends AnimatedWidget {
  const _AnimatedBorder({
    required this.animation,
    required this.containerSize,
    required this.isHorizontal,
    required this.borderWidth,
    required this.borderColor,
  }) : super(
          listenable: animation,
        );
  final Animation<double> animation;
  final Size containerSize;
  final bool isHorizontal;
  final double borderWidth;
  final Color borderColor;

  Animation<double> get animatedWidth =>
      Tween<double>(begin: s0, end: containerSize.width)
          .animate(curvedAnimation);

  Animation<double> get animatedHeight =>
      Tween<double>(begin: s0, end: containerSize.height)
          .animate(curvedAnimation);

  Animation<double> get curvedAnimation =>
      CurvedAnimation(parent: animation, curve: Curves.easeInOut);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isHorizontal ? animatedWidth.value : borderWidth,
      height: isHorizontal ? borderWidth : animatedHeight.value,
      color: borderColor,
    );
  }
}

const double s0 = 0.0;
const double s05 = 0.5;
const double s08 = 0.8;
const double s1 = 1.0;
const double s2 = 2.0;
const double s3 = 3.0;
const double s4 = 4.0;
const double s5 = 5.0;
const double s6 = 6.0;
const double s8 = 8.0;
const double s10 = 10.0;
const double s12 = 12.0;
const double s14 = 14.0;
const double s18 = 18.0;
const double s20 = 20.0;
const double s24 = 24.0;
const double s26 = 26.0;
const double s28 = 28.0;
const double s30 = 30.0;
const double s32 = 32.0;
const double s38 = 38.0;
const double s40 = 40.0;
const double s42 = 42.0;
const double s44 = 44.0;
const double s48 = 48.0;
const double s50 = 50.0;
const double s60 = 60.0;
const double s65 = 65.0;
const double s70 = 70.0;
const double s80 = 80.0;
const double s96 = 96.0;
const double s100 = 100.0;
const double s120 = 120.0;
const double s150 = 150.0;
const double s180 = 180.0;
const double s200 = 200.0;
const double s220 = 220.0;
const double s250 = 250.0;
const double s400 = 400.0;

//duration
const int d50 = 50;
const int d100 = 100;
const int d150 = 150;
const int d200 = 200;
const int d300 = 300;
const int d500 = 500;
const int d800 = 800;
const int d1000 = 1000;
const int d2000 = 2000;
const int d2870 = 2870;
const int d3000 = 3000;
const int d4000 = 4000;
const int d4300 = 4300;
const int d5000 = 5000;
const Duration duration50 = Duration(milliseconds: d50);
const Duration duration100 = Duration(milliseconds: d100);
const Duration duration150 = Duration(milliseconds: d150);
const Duration duration200 = Duration(milliseconds: d200);
const Duration duration300 = Duration(milliseconds: d300);
const Duration duration500 = Duration(milliseconds: d500);
const Duration duration800 = Duration(milliseconds: d800);
const Duration duration1000 = Duration(milliseconds: d1000);
const Duration duration2000 = Duration(milliseconds: d2000);
const Duration duration2870 = Duration(milliseconds: d2870);
const Duration duration3000 = Duration(milliseconds: d3000);
const Duration duration4000 = Duration(milliseconds: d4000);
const Duration duration4300 = Duration(milliseconds: d4300);
const Duration duration5000 = Duration(milliseconds: d5000);

const double _tiny = s4;
const double _small = s8;
const double _medium = s14;
const double _large = s20;
const double _massive = s32;
const double _enormous = s60;

const SizedBox noSpace = SizedBox.shrink();

const SizedBox horizontalSpaceTiny = SizedBox(width: _tiny);
const SizedBox horizontalSpaceSmall = SizedBox(width: _small);
const SizedBox horizontalSpaceMedium = SizedBox(width: _medium);
const SizedBox horizontalSpaceLarge = SizedBox(width: _large);
const SizedBox horizontalSpaceMassive = SizedBox(width: _massive);
const SizedBox horizontalSpaceEnormous = SizedBox(width: _enormous);

const SizedBox verticalSpaceTiny = SizedBox(height: _tiny);
const SizedBox verticalSpaceSmall = SizedBox(height: _small);
const SizedBox verticalSpaceMedium = SizedBox(height: _medium);
const SizedBox verticalSpaceLarge = SizedBox(height: _large);
const SizedBox verticalSpaceMassive = SizedBox(height: _massive);
const SizedBox verticalSpaceEnormous = SizedBox(height: _enormous);

SizedBox customSpace({double? w, double? h}) => SizedBox(
      width: w ?? 0,
      height: h ?? 0,
    );

SizedBox get zeroSize => const SizedBox.shrink();

const kBlack = Colors.black;
const kWhite = Colors.white;
final Color kTeal200 = Colors.teal.shade200;
const kTransparent = Colors.transparent;
const Color kGreen = Color(0xff23c483);

extension StringEx on String {
  Size textSize({
    required TextStyle? style,
    int maxLines = 1,
    double maxWidth = double.infinity,
  }) {
    final TextPainter textPainter = TextPainter(
        text: TextSpan(text: this, style: style),
        maxLines: maxLines,
        textDirection: TextDirection.ltr)
      ..layout(minWidth: 0, maxWidth: maxWidth);
    return textPainter.size;
  }
}

extension WidgetEx on Widget {
  Padding addPadding({required EdgeInsetsGeometry edgeInsets}) {
    return Padding(
      padding: edgeInsets,
      child: this,
    );
  }

  Widget addCenter() {
    return Center(
      child: this,
    );
  }

  Widget addExpanded() {
    return Expanded(
      child: this,
    );
  }

  Widget addAlign({
    required AlignmentGeometry alignment,
  }) {
    return Align(
      alignment: alignment,
      child: this,
    );
  }

  Widget addSizedBox({
    double? width,
    double? height,
  }) {
    return SizedBox(
      width: width,
      height: height,
      child: this,
    );
  }

  Widget addContainer({
    double? width,
    double? height,
    Color? color,
    BoxDecoration? decoration,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: decoration,
      color: color,
      margin: margin,
      padding: padding,
      child: this,
    );
  }

  Widget addHero({required Object tag}) {
    return Hero(
      tag: tag,
      child: this,
    );
  }

  Widget addOpacity({required double opacity}) {
    return Opacity(
      opacity: opacity,
      child: this,
    );
  }

  Widget addInkWell({required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: this,
    );
  }

  Widget addScrollView() {
    return SingleChildScrollView(
      child: this,
    );
  }
}

extension WidgetListEx on List<Widget> {
  Widget addStack({AlignmentGeometry? alignment}) {
    return Stack(
      alignment: alignment ?? AlignmentDirectional.topStart,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      children: this,
    );
  }

  Widget addColumn({
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
    MainAxisSize? mainAxisSize,
  }) {
    return Column(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      mainAxisSize: mainAxisSize ?? MainAxisSize.max,
      children: this,
    );
  }

  Widget addRow({
    MainAxisAlignment? mainAxisAlignment,
    CrossAxisAlignment? crossAxisAlignment,
    MainAxisSize? mainAxisSize,
  }) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
      mainAxisSize: mainAxisSize ?? MainAxisSize.max,
      children: this,
    );
  }

  Widget addWrap() {
    return Wrap(
      alignment: WrapAlignment.start,
      crossAxisAlignment: WrapCrossAlignment.start,
      children: this,
    );
  }

  Widget addListView({
    Axis? scrollDirection,
    ScrollPhysics? physics,
    bool? shrinkWrap,
    EdgeInsetsGeometry? padding,
  }) {
    return ListView(
      scrollDirection: scrollDirection ?? Axis.vertical,
      physics: physics,
      shrinkWrap: shrinkWrap ?? false,
      padding: padding,
      children: this,
    );
  }
}
