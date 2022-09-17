import 'package:flutter/material.dart';

import 'widgets/expansion_tile_custom.dart';

class DesafioControladaTwoPage extends StatefulWidget {
  const DesafioControladaTwoPage({super.key});

  @override
  State<DesafioControladaTwoPage> createState() =>
      _DesafioControladaTwoPageState();
}

class _DesafioControladaTwoPageState extends State<DesafioControladaTwoPage> {
  final ScrollController _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
        itemBuilder: (context, index) => ExpansionControladaTileCustom(
          scrollController: _controller,
          title: index.toString(),
        ),
      ),
    );
  }
}
