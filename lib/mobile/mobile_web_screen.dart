import 'package:flutter/material.dart';

class MobileWebScreen extends StatelessWidget {
  const MobileWebScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MobileWebScaffold();
  }
}

class MobileWebScaffold extends StatelessWidget {
  const MobileWebScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Mobile Web Page"),
      ),
    );
  }
}
