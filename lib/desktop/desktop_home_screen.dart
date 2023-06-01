import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../settings_screen.dart';
import '../utils/app_ui/ui_utils.dart';
import '../web_screen.dart';

class DesktopHomeScreen extends StatelessWidget {
  const DesktopHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DesktopHomeScaffold();
  }
}

class DesktopHomeScaffold extends StatelessWidget {
  const DesktopHomeScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[10],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: getTitle(appName),
        actions: <Widget>[
          //TODO:Need to update later
          // refreshAction(context, 60.0),
          bookmarksAction(context, 60.0),
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
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const WebScreen(webUrl: "",);
            }));
          },
          child: const Text("Desktop Web View"),
        ),
      ),
    );
  }
}
