import 'package:flutter/material.dart';

class ResponsiveSettingsLayout extends StatelessWidget {
  final Widget mobileScreen;
  final Widget tabletScreen;
  final Widget desktopScreen;

  const ResponsiveSettingsLayout(
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
