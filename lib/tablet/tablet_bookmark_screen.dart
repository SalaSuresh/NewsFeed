import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../settings_screen.dart';
import '../utils/app_ui/ui_utils.dart';

class TabletBookmarkScreen extends StatelessWidget {
  const TabletBookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabletBookmarkScaffold();
  }
}

class TabletBookmarkScaffold extends StatelessWidget {
  const TabletBookmarkScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[10],
      appBar: AppBar(
          backgroundColor: Colors.grey[900],
          title: getTitle(bookmarks),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 40.0),
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
          ]),
      body: const Center(
        child: Text("Tablet Bookmark Screen"),
      ),
    );
  }
}
