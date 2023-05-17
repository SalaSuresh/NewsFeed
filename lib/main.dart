import 'package:flutter/material.dart';
import 'package:news_feed/desktop/desktop_home_screen.dart';
import 'package:news_feed/responsive/responsive_home_layout.dart';
import 'package:news_feed/tablet/tablet_home_screen.dart';

import 'mobile/mobile_home_screen.dart';
/*
* Refer the video for Splash https://www.youtube.com/watch?v=4Aawfl6yOg4
* */
void main() {
  runApp(const MyHome());
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Web Demo Application",
        home: ResponsiveHomeLayout(
          mobileScreen: MobileHomeScreen(),
          tabletScreen: TabletHomeScreen(),
          desktopScreen: DesktopHomeScreen(),
        ));
  }
}
