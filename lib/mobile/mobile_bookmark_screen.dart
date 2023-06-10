import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constants.dart';
import '../model/bookmark.dart';
import '../utils/app_ui/ui_utils.dart';
import '../web_screen.dart';

late SharedPreferences sharedPreference;

class MobileBookmarkScreen extends StatelessWidget {
  const MobileBookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MobileBookmarkScaffold();
  }
}

class MobileBookmarkScaffold extends StatefulWidget {
  const MobileBookmarkScaffold({super.key});

  @override
  State<MobileBookmarkScaffold> createState() => _MobileBookmarkScaffoldState();
}

class _MobileBookmarkScaffoldState extends State<MobileBookmarkScaffold> {
  List<Bookmark> bookmarks = [];

  @override
  void initState() {
    loadSharedPreferences();
    super.initState();
  }

  loadSharedPreferences() async {
    sharedPreference = await SharedPreferences.getInstance();
    final keys = sharedPreference.getKeys();

    for (String key in keys) {
      String url = key;
      String? savedTitle = sharedPreference.getString(url);
      Bookmark bookmark = Bookmark(url: url, title: savedTitle);
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
