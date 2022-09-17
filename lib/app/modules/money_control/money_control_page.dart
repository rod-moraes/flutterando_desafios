import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterando_desafios/app/modules/money_control/widgets/logo_animated_widget.dart';

import 'widgets/button_widget.dart';
import '../../shared/scroll_view_all_axis_widget.dart';
import 'widgets/text_logo_widget.dart';
import 'widgets/text_ritch_button.dart';

class MoneyControlPage extends StatefulWidget {
  const MoneyControlPage({super.key});

  @override
  State<MoneyControlPage> createState() => _MoneyControlPageState();
}

class _MoneyControlPageState extends State<MoneyControlPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 550;
    return Theme(
      data: ThemeData(
        highlightColor: Colors.white, //Does not work
      ),
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: ScrollViewAllAxisWidget(
            size: MediaQuery.of(context).size,
            minHeight: 645,
            minWidth: 265,
            child: Flex(
              direction: isMobile ? Axis.vertical : Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Align(
                    alignment: isMobile
                        ? Alignment.bottomCenter
                        : Alignment.centerRight,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        LogoAnimatedWidget(),
                        SizedBox(height: 44),
                        TextLogoWidget(),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: min(100, width * 0.075)),
                Flexible(
                  child: Align(
                    alignment:
                        isMobile ? Alignment.center : Alignment.centerLeft,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const ButtonWidget(
                          label: "Sign Up with Email ID",
                          backgroundColor: Color(0xff5E5CE5),
                          fontColor: Colors.white,
                        ),
                        const SizedBox(height: 12),
                        ButtonWidget(
                          prefix: Image.asset('assets/images/google.png'),
                          label: "Sign Up with Google",
                          backgroundColor: const Color(0xffFFFFFF),
                          fontColor: Colors.black,
                        ),
                        const SizedBox(height: 32),
                        const TextRitchButton(),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: min(50, width * 0.04)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
