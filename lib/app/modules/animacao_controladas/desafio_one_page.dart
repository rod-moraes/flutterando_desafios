import 'package:flutter/material.dart';

class DesafioControladaOnePage extends StatefulWidget {
  const DesafioControladaOnePage({super.key});

  @override
  State<DesafioControladaOnePage> createState() =>
      _DesafioControladaOnePageState();
}

class _DesafioControladaOnePageState extends State<DesafioControladaOnePage>
    with SingleTickerProviderStateMixin {
  late final controller =
      AnimationController(duration: const Duration(seconds: 2), vsync: this);
  late Animation<Alignment> _animationAligment;
  late Animation<double> _animationWidthRadius;
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
    _animationAligment =
        Tween<Alignment>(begin: Alignment.bottomRight, end: Alignment.topCenter)
            .animate(controller);
    _animationWidthRadius =
        Tween<double>(begin: 50, end: 0).animate(controller);

    controller.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Desafio do Botão Controlada Flutuante"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Align(
          alignment: _animationAligment.value,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(_animationWidthRadius.value),
            ),
            width: 100 - _animationWidthRadius.value,
            height: 50,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius:
                    BorderRadius.circular(_animationWidthRadius.value),
                onTap: () {
                  toggleAnimated();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
