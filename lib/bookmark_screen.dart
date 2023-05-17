import 'package:flutter/material.dart';
import 'package:news_feed/responsive/responsive_bookmark_layout.dart';
import 'package:news_feed/tablet/tablet_bookmark_screen.dart';

import 'desktop/desktop_bookmark_screen.dart';
import 'mobile/mobile_bookmark_screen.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Web Demo Application",
        home: ResponsiveBookmarkLayout(
          mobileScreen: MobileBookmarkScreen(),
          tabletScreen: TabletBookmarkScreen(),
          desktopScreen: DesktopBookmarkScreen(),
        ));
  }
}
