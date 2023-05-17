import 'package:flutter/material.dart';
import 'package:news_feed/responsive/responsive_settings_layout.dart';
import 'package:news_feed/tablet/tablet_settings_screen.dart';

import 'desktop/desktop_settings_screen.dart';
import 'mobile/mobile_settings_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Web Demo Application",
        home: ResponsiveSettingsLayout(
          mobileScreen: MobileSettingsScreen(),
          tabletScreen: TabletSettingsScreen(),
          desktopScreen: DesktopSettingsScreen(),
        ));
  }
}
