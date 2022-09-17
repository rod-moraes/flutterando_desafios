import 'package:flutter/material.dart';

class BackButtonTinderWidget extends StatelessWidget {
  const BackButtonTinderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 12, top: 24),
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(16),
            child: Ink(
              padding: const EdgeInsets.all(12),
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 32,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
