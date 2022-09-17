import 'dart:math';

import 'package:flutter/cupertino.dart';

class LogoAnimatedWidget extends StatelessWidget {
  const LogoAnimatedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: min(max(size.width * 0.25, 100), 180),
      height: min(max(size.width * 0.25, 100), 180),
      child: FittedBox(
        fit: BoxFit.contain,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 37,
                  height: 37,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff5E5CE5),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  width: 37,
                  height: 37,
                  decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(52)),
                    color: Color(0xff5E5CE5),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 6),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 37,
                  height: 80,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(52),
                        topRight: Radius.circular(52)),
                    color: Color(0xff5E5CE5),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
