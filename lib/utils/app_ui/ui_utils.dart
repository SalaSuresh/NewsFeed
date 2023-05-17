import 'dart:io';

import 'package:flutter/material.dart';

import '../../bookmark_screen.dart';
import '../../mobile/mobile_home_screen.dart';
import '../../service/api_service.dart';

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
    // if (Platform.isAndroid || Platform.isIOS || Platform.isWindows) {
    return Padding(
      padding: EdgeInsets.only(right: padding),
      child: GestureDetector(
        onTap: () async {
          await getTestdata().then((newsData) {
            updateNewsFeed(newsData);
            /*NewsFeedState().setState(() {
              print("News feed set state called");
            });*/
          });

          /*FutureBuilder<List<String>?>(
              future: getTestdata(),
              builder: (context, snapshot) {
                print("Waiting for data");
                if (snapshot.hasData) {
                  return const Text("Data");
                } else if (snapshot.hasError) {
                  return const Text("Error");
                } else {
                  return const Text("Waiting");
                }
              },
            );*/
        },
        child: const Icon(
          Icons.refresh,
        ),
      ),
    );
    // } else {
    //   return Padding(padding: EdgeInsets.only(right: padding));
    // }
  } catch (exception) {
    return Padding(padding: EdgeInsets.only(right: padding));
  }
}

/*
* REFERENCE CODE
* /*final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                await prefs.setInt('counter', 10);

                final int? counter = prefs.getInt('counter');
                print("Saved value: $counter");*/
* */
