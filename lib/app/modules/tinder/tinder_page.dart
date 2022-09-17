import 'dart:math';

import 'package:flutter/material.dart';
import '../../shared/scroll_view_all_axis_widget.dart';
import 'widgets/back_button_tinder_widget.dart';
import 'widgets/button_widget.dart';
import 'widgets/logo_animated_widget.dart';
import 'widgets/text_ritch_button/text_ritch_button.dart';

class TinderPage extends StatefulWidget {
  const TinderPage({super.key});

  @override
  State<TinderPage> createState() => _TinderPageState();
}

class _TinderPageState extends State<TinderPage> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final isMobile = width < 550;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [
            0,
            0.65,
            1,
          ],
          colors: [
            Color(0xffEE7364),
            Color(0xffEC5F6C),
            Color(0xffE94976),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: LayoutBuilder(builder: (context, size) {
          final isSmallHeight = size.maxHeight < 600;
          return Stack(
            children: [
              Center(
                child: ScrollViewAllAxisWidget(
                  size: Size(size.maxWidth, size.maxHeight),
                  minHeight: 600,
                  minWidth: 265,
                  child: Flex(
                    direction: isMobile ? Axis.vertical : Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Align(
                          alignment: isMobile
                              ? Alignment.bottomCenter
                              : Alignment.centerRight,
                          child: const LogoAnimatedWidget(),
                        ),
                      ),
                      SizedBox(width: min(100, width * 0.075)),
                      Flexible(
                        flex: isMobile ? (isSmallHeight ? 5 : 2) : 2,
                        child: Align(
                          alignment: isMobile
                              ? Alignment.center
                              : Alignment.centerLeft,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              TextRitchButton(),
                              SizedBox(height: 24),
                              ButtonWidget(
                                label: 'SIGN IN WITH APPLE',
                                prefix: Icon(Icons.apple),
                              ),
                              SizedBox(height: 12),
                              ButtonWidget(
                                label: 'SIGN IN WITH FACEBOOK',
                                prefix: Icon(Icons.facebook),
                              ),
                              SizedBox(height: 12),
                              ButtonWidget(
                                label: 'SIGN IN WITH PHONE NUMBER',
                                prefix: Icon(Icons.messenger),
                              ),
                              SizedBox(height: 18),
                              Text(
                                "Trouble Signing In?",
                                style: TextStyle(
                                  color: Colors.white,
                                  overflow: TextOverflow.clip,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: min(50, width * 0.04)),
                      SizedBox(height: min(50, height * 0.05)),
                    ],
                  ),
                ),
              ),
              const BackButtonTinderWidget(),
            ],
          );
        }),
      ),
    );
  }
}
