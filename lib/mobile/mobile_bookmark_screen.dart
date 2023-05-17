import 'package:flutter/material.dart';

import '../bookmark_screen.dart';
import '../constants/constants.dart';
import '../settings_screen.dart';
import '../utils/app_ui/ui_utils.dart';

class MobileBookmarkScreen extends StatelessWidget {
  const MobileBookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MobileBookmarkScaffold();
  }
}

class MobileBookmarkScaffold extends StatelessWidget {
  const MobileBookmarkScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[10],
      appBar: AppBar(
          backgroundColor: Colors.grey[900],
          title: getTitle(bookmarks),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const SettingsScreen();
                  }));
                  /*final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                await prefs.setInt('counter', 10);

                final int? counter = prefs.getInt('counter');
                print("Saved value: $counter");*/
                },
                child: const Icon(
                  Icons.settings,
                ),
              ),
            )
          ]),
      body: const Center(
        child: Text("Mobile Bookmark Screen"),
      ),
    );
  }
}
