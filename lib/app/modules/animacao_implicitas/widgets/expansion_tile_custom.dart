import 'package:flutter/material.dart';

class ExpansionTileCustom extends StatefulWidget {
  final String title;
  final ScrollController scrollController;
  const ExpansionTileCustom({
    Key? key,
    required this.title,
    required this.scrollController,
  }) : super(key: key);

  @override
  State<ExpansionTileCustom> createState() => _ExpansionTileCustomState();
}

class _ExpansionTileCustomState extends State<ExpansionTileCustom> {
  final duration = const Duration(milliseconds: 500);

  bool isOpen = true;
  late ThemeData textTheme;
  late ThemeData iconTheme;
  late double turn;
  late double? heightFactor;

  @override
  void initState() {
    modifyOpen();
    super.initState();
  }

  void modifyOpen() {
    isOpen = !isOpen;
    modifyTextTheme();
    modifyIconTheme();
    modifyTurn();
    modifyHeightFactor();
  }

  void modifyHeightFactor() {
    if (isOpen) {
      heightFactor = 1;
    } else {
      heightFactor = 0;
    }
  }

  void modifyTurn() {
    if (isOpen) {
      turn = 0.25;
    } else {
      turn = -0.25;
    }
  }

  void modifyTextTheme() {
    if (isOpen) {
      textTheme = ThemeData(
        textTheme: const TextTheme(bodyText1: TextStyle(color: Colors.blue)),
      );
    } else {
      textTheme = ThemeData(
        textTheme: const TextTheme(bodyText1: TextStyle(color: Colors.black)),
      );
    }
  }

  void modifyIconTheme() {
    if (isOpen) {
      iconTheme = ThemeData(
        iconTheme: const IconThemeData(color: Colors.blue),
      );
    } else {
      iconTheme = ThemeData(
        iconTheme: const IconThemeData(color: Colors.black),
      );
    }
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
                duration: duration,
              );
              modifyOpen();
              setState(() {});
            },
            title: AnimatedTheme(
              duration: duration,
              data: textTheme,
              child: Builder(builder: (context) {
                return Text(
                  'My expansion tile ${widget.title}',
                  style: Theme.of(context).textTheme.bodyText1,
                );
              }),
            ),
            trailing: AnimatedTheme(
              duration: duration,
              data: iconTheme,
              child: AnimatedRotation(
                duration: duration,
                turns: turn,
                child: const Icon(Icons.keyboard_arrow_left),
              ),
            ),
          ),
        ),
        ClipRect(
          child: AnimatedAlign(
            alignment: Alignment.center,
            duration: duration,

            // alignment: widget.expandedAlignment ??
            //     expansionTileTheme.expandedAlignment ??
            //     Alignment.center,
            heightFactor: heightFactor,
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
