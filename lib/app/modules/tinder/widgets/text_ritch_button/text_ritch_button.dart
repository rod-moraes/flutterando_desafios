import 'package:flutter/material.dart';

import 'widget_span_text.dart';

class TextRitchButton extends StatelessWidget {
  const TextRitchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 350,
        ),
        child: const Text.rich(
          overflow: TextOverflow.clip,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            overflow: TextOverflow.clip,
            fontSize: 14,
          ),
          TextSpan(
            text: 'By tapping Create Account or Sign In, you agree to our',
            children: [
              WidgetSpan(
                child: WidgetSpanText(
                  text: "Terms.",
                ),
              ),
              TextSpan(
                text: "Learn how we process your data in our",
              ),
              WidgetSpan(
                child: WidgetSpanText(
                  text: "Privacy Policy",
                ),
              ),
              TextSpan(
                text: "and",
              ),
              WidgetSpan(
                child: WidgetSpanText(
                  text: "Cookies Policy",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
