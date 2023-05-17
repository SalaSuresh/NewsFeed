import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../settings_screen.dart';
import '../utils/app_ui/ui_utils.dart';

class DesktopBookmarkScreen extends StatelessWidget {
  const DesktopBookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DesktopBookmarkScaffold();
  }
}

class DesktopBookmarkScaffold extends StatelessWidget {
  const DesktopBookmarkScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[10],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: getTitle(bookmarks),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 60.0),
            child: GestureDetector(
              onTap: () {
                print("Settings clicked...");
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const SettingsScreen();
                }));
              },
              child: const Icon(
                Icons.settings,
              ),
            ),
          )
        ],
      ),
      body: const Center(
        child: Text("Desktop Bookmark Screen"),
      ),
    );
  }
}
