import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../settings_screen.dart';
import '../utils/app_ui/ui_utils.dart';
import '../web_screen.dart';

class TabletHomeScreen extends StatelessWidget {
  const TabletHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabletHomeScaffold();
  }
}

class TabletHomeScaffold extends StatelessWidget {
  const TabletHomeScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[10],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: getTitle(appName),
        actions: <Widget>[
          refreshAction(context, 40.0),
          bookmarksAction(context, 40.0),
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
        ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const WebScreen();
            }));
          },
          child: const Text("Tablet Web View"),
        ),
      ),
    );
  }
}
