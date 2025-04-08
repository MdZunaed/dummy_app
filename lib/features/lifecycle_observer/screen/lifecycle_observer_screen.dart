import 'package:flutter/material.dart';

class AppLifecycleObserver extends StatefulWidget {
  const AppLifecycleObserver({super.key});
  @override
  State<AppLifecycleObserver> createState() => _AppLifecycleObserverState();
}

class _AppLifecycleObserverState extends State<AppLifecycleObserver> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      print("App is paused");
    } else if (state == AppLifecycleState.resumed) {
      print("App is resumed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.teal.shade100,
        child: Center(child: Text("view lifecycle changes in console")),
      ),
    ); // Your app's widget tree
  }
}
