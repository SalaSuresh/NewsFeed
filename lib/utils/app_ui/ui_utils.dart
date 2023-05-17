import 'dart:io';

import 'package:flutter/material.dart';

import '../../bookmark_screen.dart';

getTitle(String title) {
  return Text(title,
      style: const TextStyle(
        fontSize: 20,
      ));
}

bookmarksAction(BuildContext context, double padding) {
  try {
    if (Platform.isAndroid || Platform.isIOS || Platform.isWindows) {
      return Padding(
        padding: EdgeInsets.only(right: padding),
        child: GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const BookmarkScreen();
            }));
          },
          child: const Icon(
            Icons.bookmark,
          ),
        ),
      );
    } else {
      return Padding(padding: EdgeInsets.only(right: padding));
    }
  } catch (exception) {
    return Padding(padding: EdgeInsets.only(right: padding));
  }
}

refreshAction(BuildContext context, double padding) {
  try {
    if (Platform.isAndroid || Platform.isIOS || Platform.isWindows) {
      return Padding(
        padding: EdgeInsets.only(right: padding),
        child: GestureDetector(
          onTap: () async {
            /*await getTestdata().then((newsData) {
              updateNewsFeed(newsData);
            });*/
          },
          child: const Icon(
            Icons.refresh,
          ),
        ),
      );
    } else {
      return Padding(padding: EdgeInsets.only(right: padding));
    }
  } catch (exception) {
    return Padding(padding: EdgeInsets.only(right: padding));
  }
}
