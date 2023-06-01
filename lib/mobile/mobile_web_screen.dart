import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MobileWebScreen extends StatelessWidget {
  final String webUrl;

  // const MobileWebScreen({super.key, String url});
  const MobileWebScreen({super.key, required String this.webUrl});

  // final String url;

  @override
  Widget build(BuildContext context) {
    print("URL $webUrl");
    // return const MobileWebScaffold(webUrl);
    // String testUrl = "https://www.google.com/";
    return WebViewApp(webUrl);
  }
}

class WebViewApp extends StatefulWidget {
  const WebViewApp(this.url, {super.key});

  final String url;

  @override
  State<WebViewApp> createState() => _WebViewAppState(url);
}

class _WebViewAppState extends State<WebViewApp> {
  late final WebViewController controller;
  String testUrl = "TS";

  _WebViewAppState(this.url);

  final String url;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse(url),
      );
  }

  @override
  Widget build(BuildContext context) {
    return /*Scaffold(
      appBar: AppBar(
        title: const Text('Flutter WebView'),
      ),
      body: */
        WebViewWidget(
      controller: controller,
    );
    // );
  }
}

/*class MobileWebScaffold extends StatelessWidget {
  const MobileWebScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Mobile Web Page"),
      ),
    );
  }
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
