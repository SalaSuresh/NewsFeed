import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constants.dart';
import '../locator.dart';
import '../model/news.dart';
import '../service/api_service.dart';
import '../utils/app_ui/ui_utils.dart';
import '../web_screen.dart';

List<Set<NewsArticle>> listNewsArticles = [];
late SharedPreferences sharedPreference;
class TabletHomeScreen extends StatelessWidget {
  const TabletHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabletHomeScaffold();
  }
}

class TabletHomeScaffold extends StatefulWidget {
  const TabletHomeScaffold({super.key});

  @override
  State<TabletHomeScaffold> createState() => _TabletHomeScaffoldState();
}

class _TabletHomeScaffoldState extends State<TabletHomeScaffold> {
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
          /* Refresh feature removed */
          // refreshAction(context, 40.0, getNewsFeed),
          bookmarksAction(context, 40.0),
          /* Settings feature removed */
          /*Padding(
            padding: const EdgeInsets.only(right: 40.0),
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
          )*/
        ],
      ),
      body: NewsFeed(),
    );
  }
}

class NewsFeed extends StatefulWidget {
  NewsFeed({super.key});

  @override
  NewsFeedState createState() => NewsFeedState();
}

class NewsFeedState extends State<NewsFeed> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
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
    return Padding(
        padding: const EdgeInsets.only(
            right: 10.0, left: 10.0, bottom: 0.0, top: 5.0),
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 10,
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return WebScreen(webUrl: newsArticle.first.url.toString());
              }));
            },
            child: Column(
              children: <Widget>[
                Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 15.0, left: 15.0, bottom: 5.0, top: 5.0),
                      child: Expanded(
                        child: Text(newsArticle.first.title.toString(),
                            textDirection: TextDirection.ltr,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                      ),
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
                              color: Colors.grey, fontSize: 10)),
                    )),
                Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 10.0, left: 10.0, bottom: 0.0, top: 5.0),
                      child: FadeInImage(
                        image: NetworkImage(
                            getImageUrl(newsArticle.first.urlToImage)),
                        placeholder: const NetworkImage(urlDefaultImage),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(
                      right: 10.0, left: 10.0, bottom: 0.0, top: 0.0),
                  child: Row(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(
                              right: 5.0, left: 5.0, bottom: 0.0, top: 0.0),
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
                              right: 5.0, left: 5.0, bottom: 0.0, top: 0.0),
                          child: IconButton(
                              onPressed: () async {
                                await sharedPreference.setString(
                                    newsArticle.first.url.toString(),
                                    newsArticle.first.title.toString());
                              },
                              icon: const Icon(
                                Icons.save,
                              )))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  String getImageUrl(String? urlToImage) {
    if (urlToImage == null) {
      return urlDefaultImage;
    } else {
      return urlToImage.toString();
    }
  }
}
