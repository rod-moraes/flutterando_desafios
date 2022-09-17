import 'package:flutter/material.dart';

class DesafioOnePage extends StatefulWidget {
  const DesafioOnePage({super.key});

  @override
  State<DesafioOnePage> createState() => _DesafioOnePageState();
}

class _DesafioOnePageState extends State<DesafioOnePage> {
  Alignment _alignment = Alignment.bottomRight;
  double _widthRadius = 50;

  void modifyWidth() {
    if (_widthRadius == 0) {
      _widthRadius = 50;
    } else if (_widthRadius == 50) {
      _widthRadius = 0;
    }
  }

  void modifyAlignment() {
    if (_alignment == Alignment.bottomRight) {
      _alignment = Alignment.topCenter;
    } else if (_alignment == Alignment.topCenter) {
      _alignment = Alignment.bottomRight;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Desafio do Botão Flutuante"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: AnimatedAlign(
          alignment: _alignment,
          duration: const Duration(seconds: 1),
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(_widthRadius),
            ),
            width: 100 - _widthRadius,
            height: 50,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(_widthRadius),
                onTap: () {
                  setState(() {
                    modifyAlignment();
                    modifyWidth();
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
