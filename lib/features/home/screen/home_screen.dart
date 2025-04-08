import 'package:dummy_app/helpers/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            ListTile(
              title: Text("Products"),
              onTap: () => context.push(AppRoutes.products),
            ),
            ListTile(
              title: Text("Districts"),
              onTap: () => context.push(AppRoutes.districts),
            ),
            ListTile(
              title: Text("Indexed Stack"),
              onTap: () => context.push(AppRoutes.indexedStack),
            ),
            ListTile(
              title: Text("App Lifecycle Observer"),
              onTap: () => context.push(AppRoutes.lifecycleObserver),
            ),
            ListTile(
              title: Text("Inherited Widget"),
              onTap: () => context.push(AppRoutes.inheritedWidget),
            ),
          ],
        ),
      ),
    );
  }
}
