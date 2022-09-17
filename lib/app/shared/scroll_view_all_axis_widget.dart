import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ScrollViewAllAxisWidget extends StatefulWidget {
  final Size size;
  final double minHeight;
  final double minWidth;
  final Color colorScroll;
  final Widget child;
  const ScrollViewAllAxisWidget({
    Key? key,
    required this.size,
    required this.minHeight,
    required this.minWidth,
    this.colorScroll = Colors.white,
    required this.child,
  }) : super(key: key);

  @override
  State<ScrollViewAllAxisWidget> createState() =>
      _ScrollViewAllAxisWidgetState();
}

class _ScrollViewAllAxisWidgetState extends State<ScrollViewAllAxisWidget> {
  final ScrollController _firstController = ScrollController();
  final ScrollController _secondController = ScrollController();
  @override
  Widget build(BuildContext context) {
    final size = widget.size;
    final double maxHeight =
        size.height < widget.minHeight ? widget.minHeight : size.height;
    final double maxWidth =
        size.width < widget.minWidth ? widget.minWidth : size.width;

    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(
        dragDevices: {
          PointerDeviceKind.touch,
          PointerDeviceKind.mouse,
        },
      ),
      child: Scrollbar(
        controller: _firstController,
        thumbVisibility: true,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          controller: _firstController,
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          child: Scrollbar(
            controller: _secondController,
            thumbVisibility: true,
            child: SingleChildScrollView(
              controller: _secondController,
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: widget.minHeight,
                  maxHeight: maxHeight,
                  minWidth: widget.minWidth,
                  maxWidth: maxWidth,
                ),
                child: widget.child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
