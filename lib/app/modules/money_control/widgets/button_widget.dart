import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String label;
  final Widget? prefix;
  final Color? backgroundColor;
  final Color? fontColor;
  const ButtonWidget({
    Key? key,
    required this.label,
    this.prefix,
    this.backgroundColor,
    this.fontColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 550;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 18 : 0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(8),
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: backgroundColor ?? Colors.black,
            ),
            height: 54,
            width: isMobile ? null : 400,
            child: Center(
              child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  style: TextStyle(
                    color: fontColor ?? Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                  children: [
                    if (prefix != null) ...[
                      WidgetSpan(
                          alignment: PlaceholderAlignment.middle,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: SizedBox(
                              height: 24,
                              width: 24,
                              child: prefix!,
                            ),
                          ))
                    ],
                    TextSpan(text: label),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
