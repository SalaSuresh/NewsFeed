// import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/constants.dart';
import '../locator.dart';
import '../model/news.dart';
import '../service/api_service.dart';
import '../settings_screen.dart';
import '../utils/app_ui/ui_utils.dart';

List<Set<NewsArticle>> listNewsArticles = [];
// final Uri _url = Uri.parse('');

class DesktopHomeScreen extends StatelessWidget {
  const DesktopHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DesktopHomeScaffold();
  }
}

class DesktopHomeScaffold extends StatefulWidget {
  const DesktopHomeScaffold({super.key});

  @override
  State<DesktopHomeScaffold> createState() => _DesktopHomeScaffoldState();
}

class _DesktopHomeScaffoldState extends State<DesktopHomeScaffold> {
  @override
  void initState() {
    super.initState();
    getNewsFeed("in");
  }

  getNewsFeed(String countryCode) async {
    var newsData = await locator.get<ApiService>().getNewsArticles(countryCode);
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
          refreshAction(context, 60.0, getNewsFeed),
          bookmarksAction(context, 60.0),
          Padding(
            padding: const EdgeInsets.only(right: 60.0),
            child: GestureDetector(
              onTap: () {
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
      body: const NewsFeed(),
    );
  }
}

class NewsFeed extends StatefulWidget {
  const NewsFeed({super.key});

  @override
  NewsFeedState createState() => NewsFeedState();
}

class NewsFeedState extends State<NewsFeed> {
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
}

class ListItem extends StatelessWidget {
  ListItem(this.newsArticle, {super.key});

  Set<NewsArticle> newsArticle;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 10,
      child: Column(
        children: <Widget>[
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 10.0, left: 10.0, bottom: 5.0, top: 5.0),
                child: Text(newsArticle.first.title.toString(),
                    textDirection: TextDirection.ltr,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              )),
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                child: Text(newsArticle.first.author.toString(),
                    textDirection: TextDirection.ltr,
                    style: const TextStyle(
                      color: Colors.grey,
                    )),
              )),
          Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 10.0, left: 10.0, bottom: 5.0, top: 5.0),
                child: FadeInImage(
                  image:
                      NetworkImage(getImageUrl(newsArticle.first.urlToImage)),
                  placeholder: const NetworkImage(defaultImage),
                ),
              )),
          Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 10.0, left: 10.0, bottom: 5.0, top: 5.0),
                child: ElevatedButton(
                  onPressed: () {
                    Uri.parse(newsArticle.first.url.toString());
                    _launchUrl(newsArticle.first.url.toString());
                  },
                  child: const Text("View"),
                ),
              )),
        ],
      ),
    );
  }

  String getImageUrl(String? urlToImage) {
    if (urlToImage == null) {
      return defaultImage;
    } else {
      return urlToImage.toString();
    }
  }

  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
