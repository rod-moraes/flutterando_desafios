import 'package:flutter/material.dart';

class WidgetSpanText extends StatelessWidget {
  final String text;
  const WidgetSpanText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            decoration: TextDecoration.underline,
            overflow: TextOverflow.clip,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
