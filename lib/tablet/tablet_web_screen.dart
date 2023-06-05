import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TabletWebScreen extends StatelessWidget {
  final String webUrl;
  const TabletWebScreen({super.key, required this.webUrl});

  @override
  Widget build(BuildContext context) {
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
  // String testUrl = "TS";

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
