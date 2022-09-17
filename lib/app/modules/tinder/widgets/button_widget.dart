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
          borderRadius: BorderRadius.circular(32),
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              border: Border.all(
                color: Colors.white,
                width: 1,
              ),
              color: backgroundColor ?? Colors.transparent,
            ),
            height: 48,
            width: isMobile ? null : 400,
            child: Center(
              child: Row(
                children: [
                  if (prefix != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 14),
                      child: SizedBox(
                        height: 24,
                        width: 24,
                        child: IconTheme(
                          data: const IconThemeData(color: Colors.white),
                          child: prefix!,
                        ),
                      ),
                    ),
                  Expanded(
                    child: Text(
                      label,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: fontColor ?? Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
