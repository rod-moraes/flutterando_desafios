import 'package:flutter/material.dart';

import 'widgets/expansion_tile_custom.dart';

class DesafioTwoPage extends StatefulWidget {
  const DesafioTwoPage({super.key});

  @override
  State<DesafioTwoPage> createState() => _DesafioTwoPageState();
}

class _DesafioTwoPageState extends State<DesafioTwoPage> {
  Alignment _alignment = Alignment.bottomRight;
  ShapeBorder _shape = const CircleBorder();
  double _widthRadius = 50;

  void modifyWidth() {
    if (_widthRadius == 0) {
      _widthRadius = 50;
    } else if (_widthRadius == 50) {
      _widthRadius = 0;
    }
  }

  void modifyShape() {
    if (_shape is RoundedRectangleBorder) {
      _shape = const CircleBorder();
    } else if (_shape is CircleBorder) {
      _shape = const RoundedRectangleBorder();
    }
  }

  void modifyAlignment() {
    if (_alignment == Alignment.bottomRight) {
      _alignment = Alignment.topCenter;
    } else if (_alignment == Alignment.topCenter) {
      _alignment = Alignment.bottomRight;
    }
  }

  final ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("MyScrollView"),
        centerTitle: false,
      ),
      body: ListView.builder(
        controller: _controller,
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        itemCount: 100,
        itemBuilder: (context, index) => ExpansionTileCustom(
          scrollController: _controller,
          title: index.toString(),
        ),
      ),
    );
  }
}
