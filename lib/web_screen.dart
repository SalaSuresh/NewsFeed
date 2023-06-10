import 'package:flutter/material.dart';
import 'package:news_feed/responsive/responsive_web_layout.dart';
import 'package:news_feed/tablet/tablet_web_screen.dart';

import 'desktop/desktop_web_screen.dart';
import 'mobile/mobile_web_screen.dart';

class WebScreen extends StatelessWidget {
  const WebScreen({super.key, required this.webUrl});

  final String webUrl;

  @override
  Widget build(BuildContext context) {
    print(webUrl);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Web Demo Application",
        home: ResponsiveWebLayout(
          mobileScreen: MobileWebScreen(webUrl: webUrl),
          tabletScreen: TabletWebScreen(webUrl: webUrl),
          desktopScreen: DesktopWebScreen(webUrl: webUrl),
        ));
  }
}
