import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../constants/constants.dart';
import '../utils/app_ui/ui_utils.dart';

class DesktopWebScreen extends StatelessWidget {
  final String webUrl;

  const DesktopWebScreen({super.key, required this.webUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[10],
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          title: getTitle(appName),
        ),
        body: WebViewApp(webUrl));
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
    return WebViewWidget(
      controller: controller,
    );
  }
}
