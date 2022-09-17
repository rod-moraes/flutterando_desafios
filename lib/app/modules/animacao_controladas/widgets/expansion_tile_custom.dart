import 'package:flutter/material.dart';

class ExpansionControladaTileCustom extends StatefulWidget {
  final String title;
  final ScrollController scrollController;
  const ExpansionControladaTileCustom({
    Key? key,
    required this.title,
    required this.scrollController,
  }) : super(key: key);

  @override
  State<ExpansionControladaTileCustom> createState() =>
      _ExpansionControladaTileCustomState();
}

class _ExpansionControladaTileCustomState
    extends State<ExpansionControladaTileCustom>
    with SingleTickerProviderStateMixin {
  late final controller = AnimationController(
      duration: const Duration(milliseconds: 500), vsync: this);
  late Animation<double> _animationHeightFactor;
  late Animation<double> _animationTurn;
  late Animation<Color?> _animationColor;
  bool forward = false;

  void toggleAnimated() {
    if (forward) {
      controller.reverse();
    } else {
      controller.forward();
    }
    forward = !forward;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _animationHeightFactor =
        Tween<double>(begin: 0, end: 1).animate(controller);
    _animationTurn = Tween<double>(begin: -0.25, end: 0.25).animate(controller);
    _animationColor =
        ColorTween(begin: Colors.black, end: Colors.blue).animate(controller);
    controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ListTileTheme.merge(
          child: ListTile(
            onTap: () {
              widget.scrollController.position.ensureVisible(
                context.findRenderObject()!,
                alignment: 0,
                duration: const Duration(milliseconds: 500),
              );
              toggleAnimated();
            },
            title: Builder(builder: (context) {
              return Text('My expansion tile ${widget.title}',
                  style: TextStyle(color: _animationColor.value));
            }),
            trailing: RotationTransition(
              turns: _animationTurn,
              child: Icon(
                Icons.keyboard_arrow_left,
                color: _animationColor.value,
              ),
            ),
          ),
        ),
        ClipRect(
          child: Align(
            heightFactor: _animationHeightFactor.value,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                FlutterLogo(
                  size: 50,
                ),
                Text(
                  textAlign: TextAlign.justify,
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut vel nulla a erat efficitur volutpat. Nam ac tempor leo, ullamcorper euismod magna. Etiam elementum fringilla sem. Vivamus at orci tincidunt, tristique elit non, congue massa. Donec eget lobortis velit, quis interdum ex. Suspendisse quis facilisis nulla. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Sed convallis, risus vitae cursus dictum, felis eros faucibus risus, sed molestie diam eros luctus ipsum. Donec elementum ultricies sagittis. Integer bibendum, orci ut tempor molestie, nulla tellus luctus elit, vel malesuada massa justo non enim. Donec in dui faucibus, faucibus neque quis, ultrices eros. Fusce vitae ipsum in nunc feugiat molestie. Integer id tellus libero. Sed sit amet tellus porttitor, pharetra felis quis, consectetur ex. Nullam eget suscipit orci. Morbi dignissim quam quis diam consectetur pulvinar.',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
