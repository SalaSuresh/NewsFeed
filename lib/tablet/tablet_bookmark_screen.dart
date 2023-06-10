import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constants.dart';
import '../model/bookmark.dart';
import '../utils/app_ui/ui_utils.dart';
import '../web_screen.dart';

late SharedPreferences sharedPreference;

class TabletBookmarkScreen extends StatelessWidget {
  const TabletBookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabletBookmarkScaffold();
  }
}

class TabletBookmarkScaffold extends StatefulWidget {
  const TabletBookmarkScaffold({super.key});

  @override
  State<TabletBookmarkScaffold> createState() => _TabletBookmarkScaffoldState();
}

class _TabletBookmarkScaffoldState extends State<TabletBookmarkScaffold> {
  List<Bookmark> bookmarks = [];

  @override
  void initState() {
    loadSharedPreferences();
    super.initState();
  }

  loadSharedPreferences() async {
    debugPrint("aaaaaaaaaaaaa");
    sharedPreference = await SharedPreferences.getInstance();
    final keys = sharedPreference.getKeys();
    debugPrint("aaaaaaaaaaaaa $keys");

    for (String key in keys) {
      debugPrint("aaaaaaaaaaaaa0000");
      String url = key;
      String? savedTitle = sharedPreference.getString(url);
      Bookmark bookmark = Bookmark(url: url, title: savedTitle);
      debugPrint("aaaaaaaaaaaaa");
      setState(() {
        bookmarks.add(bookmark);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[10],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: getTitle(bookmarksTitle),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: bookmarks.length,
        itemBuilder: (context, index) {
          return ListItem(bookmarks[index]);
        },
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  ListItem(this.bookmark, {super.key});

  Bookmark bookmark;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding:
            const EdgeInsets.only(right: 5.0, left: 5.0, bottom: 0.0, top: 5.0),
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 2,
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return WebScreen(webUrl: bookmark.url.toString());
              }));
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 10.0, left: 10.0, bottom: 10.0, top: 10.0),
              child: Text("${bookmark.title}",
                  textDirection: TextDirection.ltr,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500)),
            ),
          ),
        ));
  }
}
