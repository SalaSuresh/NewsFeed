import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../utils/app_ui/ui_utils.dart';

class TabletSettingsScreen extends StatelessWidget {
  const TabletSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabletSettingsScaffold();
  }
}

class TabletSettingsScaffold extends StatelessWidget {
  const TabletSettingsScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[10],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: getTitle(settings),
      ),
      body: const Center(
        child: Text("Tablet Settings Page"),
      ),
    );
  }
}
