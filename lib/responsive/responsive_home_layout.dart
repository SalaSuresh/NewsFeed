import 'package:flutter/material.dart';

class ResponsiveHomeLayout extends StatelessWidget {
  final Widget mobileScreen;
  final Widget tabletScreen;
  final Widget desktopScreen;

  const ResponsiveHomeLayout(
      {super.key,
      required this.mobileScreen,
      required this.tabletScreen,
      required this.desktopScreen});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 500) {
        return mobileScreen;
      } else if (constraints.maxWidth < 1100) {
        return tabletScreen;
      } else {
        return desktopScreen;
      }
    });
  }
}

//TODO: Below Widget is to check the lifecycle and experiment, Need to remove later
class TestWidget extends StatefulWidget {
  const TestWidget({super.key});

  @override
  State<StatefulWidget> createState() => _TestWidgetState();
}

class _TestWidgetState extends State<TestWidget> with WidgetsBindingObserver {
  int count = 0;
  bool isAppInactive = false;

  @override
  Widget build(BuildContext context) {
    /*Future.delayed(const Duration(milliseconds: 2000), () {
      setState(() {
        // count += 1;
      });
    });*/
    print("isAppInactive-=-=-=-=-=-=-=-=-=-=-: $isAppInactive");
    return Text("Message: $count");
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    print("didChangeAppLifecycleState:::::::::::::::::");
    /*if (state == AppLifecycleState.paused) {
      print("PAUSED---------------------");
    } else if (state == AppLifecycleState.resumed) {
      print("RESUMED---------------------");
    }*/
    switch (state) {
      case AppLifecycleState.resumed:
        // Handle this case
        print(
            "Resumed++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
        break;
      case AppLifecycleState.inactive:
        // Handle this case
        print(
            "Inactive++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
        break;
      case AppLifecycleState.paused:
        // Handle this case
        print(
            "Paused++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
        break;
      case AppLifecycleState.detached:
        // Handle this case
        print(
            "Detached++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
        break;
    }
  }

  @override
  void initState() {
    print("initState--------------------------------");
    WidgetsBinding.instance.addObserver(this);
    super.initState();

    /*WidgetsBinding.instance.addObserver(LifecycleEventHandler(
        resumeCallBack: () async => setState(() {
              // The app is now resumed, so let's change the value to false
              setState(() {
                isAppInactive = false;
              });
            }),
        suspendingCallBack: () async {
          // The app is now inactive, so let's change the value to true
          setState(() {
            isAppInactive = true;
          });
        }));*/
    // WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didUpdateWidget(covariant TestWidget oldWidget) {
    print("didUpdateWidget--------------------------------");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    print("didChangeDependencies--------------------------------");
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    print("DISPOSE--------------------------------");
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
