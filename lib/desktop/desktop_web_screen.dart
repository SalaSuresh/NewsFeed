import 'package:flutter/material.dart';

class DesktopWebScreen extends StatelessWidget {
  const DesktopWebScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DesktopWebScaffold();
  }
}

class DesktopWebScaffold extends StatelessWidget {
  const DesktopWebScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Desktop Web Page"),
      ),
    );
  }
}
