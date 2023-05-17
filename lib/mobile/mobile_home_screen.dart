import 'package:flutter/material.dart';
import 'package:news_feed/constants/constants.dart';

import '../locator.dart';
import '../service/api_service.dart';
import '../settings_screen.dart';
import '../utils/app_ui/ui_utils.dart';

class MobileHomeScreen extends StatelessWidget {
  const MobileHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MobileScaffold();
  }
}

class MobileScaffold extends StatelessWidget {
  const MobileScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[10],
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: getTitle(appName),
        actions: <Widget>[
          refreshAction(context, 20.0),
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
      body: const NewsFeedBody(),
    );
  }
}

class NewsFeedBody extends StatefulWidget {
  const NewsFeedBody({super.key});

  /*@override
  State<StatefulWidget> createState() {
    throw UnimplementedError();
  }*/
  @override
  NewsFeedScaffoldState createState() => NewsFeedScaffoldState();
}

class NewsFeedScaffoldState extends State<NewsFeedBody> {
  String message = "Application Message";

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("Mobile Home Screen \nMessage: $message"),
          ElevatedButton(
            onPressed: () async {
              /*Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const WebScreen();
              }));*/
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
}
//TODO: Commented the below code and keeping for reference to implement the required features
/*class NewsFeed extends StatefulWidget {
  NewsFeed({super.key});

  @override
  NewsFeedState createState() => NewsFeedState();

  testfunction(List<String> newsData) async {
    print("test function called $newsData");
    createState().testFunction2(newsData);
  }
}*/

/*class NewsFeedState extends State<NewsFeed> {
  List<String> tasks = ["qwe", "tyu", "iop"];

  @override
  Widget build(BuildContext context) {
    print("Build Called-------");
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return ListItem(tasks[index]);
      },
    );
  }

  testFunction2(List<String> newsData) {
    print("test function2222 called $newsData");
    setState(() {
      print("test setting state--------------");
      List<String> test = ["ABC", "DEF", "GHI"];
      tasks = test;
    });
  }
}*/

/*class ListItem extends StatelessWidget {
  ListItem(this.task, {super.key});

  String task;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 10,
      child: Container(
        */ /*foregroundDecoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.transparent,
              Colors.grey,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0, 0.5],
          ),
        ),*/ /*
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Test-Logo.svg/783px-Test-Logo.svg.png',
            ),
            Padding(
              padding:
                  const EdgeInsets.only(right: 10.0, left: 10.0, bottom: 10.0),
              child: Text(task,
                  textDirection: TextDirection.ltr,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ) */ /*Column(children: [
        Image.network(
            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Test-Logo.svg/783px-Test-Logo.svg.png'),
        Text(task, textDirection: TextDirection.ltr),
      ],)*/ /*
      ,
    );
  }
}*/

/*updateNewsFeed(List<String> newsData) async {
  print("Update Newsfeed UI $newsData");
  NewsFeed().testfunction(newsData);
}*/

/*
* /*Center(
        */ /*
        * Link(
                  target: LinkTarget.defaultTarget,
                  uri: Uri.parse("https://www.google.com/"),
                  builder: (context, followLink) => ElevatedButton(
                        onPressed: followLink,
                        child: const Text("Web Url defaultTarget"),
                      ))*/ /*
        child: ElevatedButton(
          onPressed: () {
            */ /*Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const WebScreen();
            }));*/ /*
          },
          child: const Text("Mobile Web View"),
        ),
        */ /*child: Link(
            target: LinkTarget.self,
            uri: Uri.parse("https://www.google.com/"),
            builder: (context, followLink) => ElevatedButton(
                  onPressed: followLink,
                  child: const Text("Mobile Web View:+:"),
                )),*/ /*
      )*/
* */
