import 'dart:math';

import 'package:flutter/cupertino.dart';

class LogoAnimatedWidget extends StatelessWidget {
  const LogoAnimatedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: min(max(size.width * 0.25, 190), 320),
      child: Image.asset(
        'assets/images/tinder.png',
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
