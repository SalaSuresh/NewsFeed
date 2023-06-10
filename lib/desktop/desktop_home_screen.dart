import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constants/constants.dart';
import '../locator.dart';
import '../model/news.dart';
import '../service/api_service.dart';
import '../utils/app_ui/ui_utils.dart';

List<Set<NewsArticle>> listNewsArticles = [];

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
    getNewsFeed();
  }

  getNewsFeed() async {
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
        /*actions: <Widget>[
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
        ],*/
      ),
      body: const Padding(
          padding: EdgeInsets.only(right: 40.0, left: 40.0), child: NewsFeed()),
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
    return GridView.count(
        crossAxisCount: 3,
        children: List.generate(listNewsArticles.length, (index) {
          return ListItem(listNewsArticles[index]);
        }));
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
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 5,
      child: Column(
        children: <Widget>[
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 10.0, left: 10.0, bottom: 5.0, top: 15.0),
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
                  placeholder: const NetworkImage(urlDefaultImage),
                ),
              )),
          Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 10.0, left: 10.0, bottom: 5.0, top: 5.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (kIsWeb) {
                      _launchUrl(newsArticle.first.url.toString());
                    } else {
                      //TODO: Launch Web screen
                    }
                  },
                  child: Text(visit),
                ),
              )),
        ],
      ),
    );
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
