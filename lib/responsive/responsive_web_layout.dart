import 'package:flutter/material.dart';

class ResponsiveWebLayout extends StatelessWidget {
  final Widget mobileScreen;
  final Widget tabletScreen;
  final Widget desktopScreen;

  const ResponsiveWebLayout(
      {super.key,
      required this.mobileScreen,
      required this.tabletScreen,
      required this.desktopScreen});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      //TODO: Change the max width to 500 later
      if (constraints.maxWidth < 600) {
        return mobileScreen;
      } else if (constraints.maxWidth < 1100) {
        return tabletScreen;
      } else {
        return desktopScreen;
      }
    });
  }
}
