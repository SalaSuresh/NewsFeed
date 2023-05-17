import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../utils/app_ui/ui_utils.dart';

class DesktopSettingsScreen extends StatelessWidget {
  const DesktopSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DesktopSettingsScaffold();
  }
}

class DesktopSettingsScaffold extends StatelessWidget {
  const DesktopSettingsScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[10],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: getTitle(settings),
      ),
      body: const Center(
        child: Text("Desktop Settings Screen"),
      ),
    );
  }
}
