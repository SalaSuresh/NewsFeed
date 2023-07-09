import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:news_feed/constants/constants.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../locator.dart';
import '../model/news.dart';
import '../service/api_service.dart';
import '../utils/app_ui/ui_utils.dart';
import '../web_screen.dart';

List<Set<NewsArticle>> listNewsArticles = [];
late SharedPreferences sharedPreference;

class MobileHomeScreen extends StatelessWidget {
  const MobileHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MobileScaffold();
  }
}

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({super.key});

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  @override
  void initState() {
    loadSharedPreferences();
    super.initState();
    getNewsFeed();
  }

  loadSharedPreferences() async {
    sharedPreference = await SharedPreferences.getInstance();
  }

  getNewsFeed() async {
    /*var messageFromFirebase = await locator.get<ApiService>().getTestApiData();
    setState(() {
      message = messageFromFirebase;
    });*/

    var newsData = await locator.get<ApiService>().getNewsArticles();
    setState(() {
      listNewsArticles = newsData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[10],
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          title: getTitle(appName),
          actions: <Widget>[
            // refreshAction(context, 20.0, getNewsFeed),
            bookmarksAction(context, 20.0),
            // Padding(
            //   padding: const EdgeInsets.only(right: 20.0),
            //   child: GestureDetector(
            //     onTap: () {
            //       Navigator.push(context, MaterialPageRoute(builder: (context) {
            //         return const SettingsScreen();
            //       }));
            //     },
            //     child: const Icon(
            //       Icons.settings,
            //     ),
            //   ),
            // )
          ],
        ),
        body: NewsFeed() //NewsFeedBody(),
        );
  }
}

/*class NewsFeedBody extends StatefulWidget {
  NewsFeedBody({super.key});

  @override
  NewsFeedScaffoldState createState() => NewsFeedScaffoldState();
}

class NewsFeedScaffoldState extends State<NewsFeedBody> {
  @override
  void initState() {
    super.initState();
    // getNewsFeed();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("Mobile Home Screen \nMessage: $message"),
          ElevatedButton(
            onPressed: () async {
              */ /*Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const WebScreen();
              }));*/ /*
              var messageFromFirebase =
                  await locator.get<ApiService>().getTestApiData();
              setState(() {
                message = messageFromFirebase;
              });
            },
            child: const Text("Get Message"),
          )
        ],
      ),
    );
  }

  Future<void> getNewsFeed() async {
    print("Getting News Feed");
    var messageFromFirebase = await locator.get<ApiService>().getTestApiData();
    setState(() {
      message = messageFromFirebase;
    });
  }
}*/

class NewsFeed extends StatefulWidget {
  NewsFeed({super.key});

  @override
  NewsFeedState createState() => NewsFeedState();

/*testfunction(List<String> newsData) async {
    print("test function called $newsData");
    createState().testFunction2(newsData);
  }*/
}

class NewsFeedState extends State<NewsFeed> {
  // List<String> tasks = [
  //   "test title message for list item test title message for list item",
  //   "tyu",
  //   "iop"
  // ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: listNewsArticles.length,
      itemBuilder: (context, index) {
        return ListItem(listNewsArticles[index]);
      },
    );
  }

/*testFunction2(List<String> newsData) {
    print("test function2222 called $newsData");
    setState(() {
      print("test setting state--------------");
      List<String> test = ["ABC", "DEF", "GHI"];
      tasks = test;
    });
  }*/
}

class ListItem extends StatelessWidget {
  ListItem(this.newsArticle, {super.key});

  Set<NewsArticle> newsArticle;

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
          elevation: 10,
          child: InkWell(
            onTap: () {
              if (kIsWeb || Platform.isWindows || Platform.isMacOS) {
                _launchUrl(newsArticle.first.url.toString());
              } else {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return WebScreen(webUrl: newsArticle.first.url.toString());
                }));
              }
            },
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 15.0, left: 15.0, bottom: 5.0, top: 10.0),
                      child: Text(newsArticle.first.title.toString(),
                          textDirection: TextDirection.ltr,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    )),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15.0, left: 15.0),
                      child: Text(
                          (newsArticle.first.author.toString().isEmpty)
                              ? getTitle(appName)
                              : newsArticle.first.author.toString(),
                          textDirection: TextDirection.ltr,
                          style: const TextStyle(
                              color: Colors.grey, fontSize: 12)),
                    )),
                Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 10.0, left: 10.0, bottom: 5.0, top: 5.0),
                      child: FadeInImage(
                        image: NetworkImage(
                            getImageUrl(newsArticle.first.urlToImage)),
                        placeholder: const NetworkImage(urlDefaultImage),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(
                      right: 10.0, left: 10.0, bottom: 10.0, top: 5.0),
                  child: Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(
                              right: 10.0, left: 10.0, bottom: 0.0, top: 0.0),
                          child: IconButton(
                            onPressed: () {
                              Share.share(
                                  'News Feed:\n ${newsArticle.first.url.toString()}');
                            },
                            icon: const Icon(
                              Icons.share,
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                          )),
                      Padding(
                          padding: const EdgeInsets.only(
                              right: 10.0, left: 10.0, bottom: 0.0, top: 0.0),
                          child: /*ElevatedButton.icon(
                        onPressed: () {
                          //TODO: Save the Article
                        },
                        icon: const Icon(
                          Icons.save,
                          size: 16.0,
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                        label: Text("Save"))*/
                              IconButton(
                                  onPressed: () async {
                                    await sharedPreference.setString(
                                        newsArticle.first.url.toString(),
                                        newsArticle.first.title.toString());
                                  },
                                  icon: const Icon(
                                    Icons.save,
                                  )))
                    ],
                  ), /*ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return WebScreen(
                          webUrl: newsArticle.first.url.toString());
                    }));
                  } */ /*() => {
                    debugPrint("News Article Url: ${newsArticle.first.url}")
                  }*/ /*
                  ,
                  child: Text(visit),
                ),*/
                ),
              ],
            ),
          ),

          /*child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Container(
            alignment: Alignment.center, // This is needed
            child: Image.network(
              'https://dummyimage.com/640x160/000/aaa',
              height: 100,
            ),
          ),
          Text(task,
              textDirection: TextDirection.ltr,
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.bold))
          */ /*Image.network(
            'https://dummyimage.com/640x160/000/aaa',
            height: 50,
          ),*/ /*
          */ /*Padding(
            padding:
                const EdgeInsets.only(right: 10.0, left: 10.0, bottom: 10.0),
            child: Text(task,
                textDirection: TextDirection.ltr,
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
          ),*/ /*
        ],
      ),*/
        ));
  }

  String getImageUrl(String? urlToImage) {
    if (urlToImage == null) {
      return urlDefaultImage;
    } else {
      return urlToImage.toString();
    }
  }

  Future<void> _launchUrl(String url) async {
    final Uri articleUrl = Uri.parse(url);
    if (!await launchUrl(articleUrl)) {
      throw Exception('Could not launch $articleUrl');
    }
  }
}

/*refreshNewsFeed() {
  print("Refresh Newsfeed UI");
  NewsFeedScaffoldState().getNewsFeed();
}*/
