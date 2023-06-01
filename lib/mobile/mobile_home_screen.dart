import 'package:flutter/material.dart';
import 'package:news_feed/constants/constants.dart';

import '../locator.dart';
import '../model/news.dart';
import '../service/api_service.dart';
import '../settings_screen.dart';
import '../utils/app_ui/ui_utils.dart';
import '../web_screen.dart';

// String message = "Application Message";
List<Set<NewsArticle>> listNewsArticles = [];

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
    // debugPrint("initState called");
    super.initState();
    getNewsFeed("in");
  }

  getNewsFeed(String countryCode) async {
    /*var messageFromFirebase = await locator.get<ApiService>().getTestApiData();
    setState(() {
      message = messageFromFirebase;
    });*/

    var newsData = await locator.get<ApiService>().getNewsArticles(countryCode);
    setState(() {
      listNewsArticles = newsData;
    });
    debugPrint("NEWS ARTICLES: $listNewsArticles");
    //TODO: Need to remove --- START
    listNewsArticles.forEach((e) {
      e.forEach((a) {
        print("NEWS DATA-------------------- ${a.title}");
        print("NEWS DATA-------------------- ${a.author}");
      });
    });
    //TODO: Need to remove --- END
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[10],
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          title: getTitle(appName),
          actions: <Widget>[
            refreshAction(context, 20.0, getNewsFeed),
            bookmarksAction(context, 20.0),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
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
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 10,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Align(
              alignment: Alignment.centerLeft,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 10.0, left: 10.0, bottom: 5.0, top: 5.0),
                  child: Text(newsArticle.first.title.toString(),
                      textDirection: TextDirection.ltr,
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
              )),
          Align(
              alignment: Alignment.centerLeft,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                  child: Text(newsArticle.first.author.toString(),
                      textDirection: TextDirection.ltr,
                      style: const TextStyle(
                        color: Colors.grey,
                      )),
                ),
              )),
          Align(
              alignment: Alignment.center,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 10.0, left: 10.0, bottom: 5.0, top: 5.0),
                  child: FadeInImage(
                    image:
                        // NetworkImage(newsArticle.first.urlToImage.toString()),
                        NetworkImage(getImageUrl(newsArticle.first.urlToImage)),
                    placeholder: const NetworkImage(
                        "https://dummyimage.com/640x360/000/aaa"),
                  ) /*Image.network(
                      getImageUrl(newsArticle.first.urlToImage),
                      height: 150,
                      fit: BoxFit.fill)*/
                  ,
                ),
              )),
          Align(
              alignment: Alignment.centerRight,
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 10.0, left: 10.0, bottom: 5.0, top: 5.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return WebScreen(
                            webUrl: newsArticle.first.url.toString());
                      }));
                    } /*() => {
                      debugPrint("News Article Url: ${newsArticle.first.url}")
                    }*/
                    ,
                    child: const Text("View"),
                  ),
                ),
              )),
        ],
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
    );
  }

  String getImageUrl(String? urlToImage) {
    if (urlToImage == null) {
      return "https://dummyimage.com/640x360/000/aaa";
    } else {
      return urlToImage.toString();
    }
  }
}

/*refreshNewsFeed() {
  print("Refresh Newsfeed UI");
  NewsFeedScaffoldState().getNewsFeed();
}*/
