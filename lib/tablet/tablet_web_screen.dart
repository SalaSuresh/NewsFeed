import 'package:flutter/material.dart';

class TabletWebScreen extends StatelessWidget {
  const TabletWebScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabletWebScaffold();
  }
}

class TabletWebScaffold extends StatelessWidget {
  const TabletWebScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Tablet Web Page"),
      ),
    );
  }
}
