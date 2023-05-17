import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../utils/app_ui/ui_utils.dart';

class MobileSettingsScreen extends StatelessWidget {
  const MobileSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MobileSettingsScaffold();
  }
}

class MobileSettingsScaffold extends StatelessWidget {
  const MobileSettingsScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[10],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: getTitle(settings),
      ),
      body: const Center(
        child: Text("Mobile Settings Page"),
      ),
    );
  }
}
