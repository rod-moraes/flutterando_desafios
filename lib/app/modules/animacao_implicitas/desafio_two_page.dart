import 'package:flutter/material.dart';

import 'widgets/expansion_tile_custom.dart';

class DesafioTwoPage extends StatefulWidget {
  const DesafioTwoPage({super.key});

  @override
  State<DesafioTwoPage> createState() => _DesafioTwoPageState();
}

class _DesafioTwoPageState extends State<DesafioTwoPage> {
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
        itemBuilder: (context, index) => ExpansionTileCustom(
          scrollController: _controller,
          title: index.toString(),
        ),
      ),
    );
  }
}
