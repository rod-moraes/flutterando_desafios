import 'package:flutter/material.dart';

class TextLogoWidget extends StatelessWidget {
  const TextLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: const [
        Text(
          'Get your Money\nUnder Control',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 30,
            height: 39 / 30,
          ),
        ),
        SizedBox(height: 18),
        Text(
          'Menage your expenses.\nSeamlessly.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 18,
            height: 22 / 18,
          ),
        ),
      ],
    );
  }
}
