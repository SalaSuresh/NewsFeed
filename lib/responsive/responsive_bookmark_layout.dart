import 'package:flutter/material.dart';

class ResponsiveBookmarkLayout extends StatelessWidget {
  final Widget mobileScreen;
  final Widget tabletScreen;
  final Widget desktopScreen;

  const ResponsiveBookmarkLayout(
      {super.key,
      required this.mobileScreen,
      required this.tabletScreen,
      required this.desktopScreen});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 500) {
        return mobileScreen;
      } else if (constraints.maxWidth < 1100) {
        return tabletScreen;
      } else {
        return desktopScreen;
      }
    });
  }
}
