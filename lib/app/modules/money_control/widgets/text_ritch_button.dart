import 'package:flutter/material.dart';

class TextRitchButton extends StatelessWidget {
  const TextRitchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      maxLines: 2,
      overflow: TextOverflow.clip,
      TextSpan(
          text: 'Already have an account? ',
          style: const TextStyle(
            color: Colors.white,
            overflow: TextOverflow.clip,
            fontSize: 14,
          ),
          children: [
            WidgetSpan(
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(8),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  child: Text(
                    "Sign In",
                    maxLines: 2,
                    style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                      overflow: TextOverflow.clip,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            )
          ]),
    );
  }
}
